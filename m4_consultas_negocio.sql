/* ============================================================
   PRE-ENTREGA N° 4
   Consultas SQL de negocio
   Base de datos: Ventas_Tech_DB
   ============================================================ */

USE Ventas_Tech_DB;
GO


/* ============================================================
   CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
   Total facturado, cantidad de pedidos y ticket promedio
   agrupados por mes.
   ============================================================ */

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
GO


/* ============================================================
   CONSULTA 2 - RANKING DE PRODUCTOS
   Top 5 de productos según su facturación total.
   ============================================================ */

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;
GO


/* ============================================================
   CONSULTA 3 - CLIENTES RECURRENTES
   Clientes que realizaron más de un pedido.
   ============================================================ */

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;
GO


/* ============================================================
   CONSULTA 4 - MESES POR ENCIMA/POR DEBAJO DEL PROMEDIO
   Compara la facturación mensual contra el promedio mensual.
   ============================================================ */

WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM facturacion_mensual
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;
GO


/* ============================================================
   HALLAZGOS
   ============================================================ */

-- 1. Marzo concentra toda la facturación registrada, ya que las
--    10 ventas disponibles corresponden a ese mes.

-- 2. El producto con ID 1 es el que genera la mayor facturación,
--    con 3 unidades vendidas y un total facturado de 3600.00.

-- 3. Los 5 clientes registrados son recurrentes, ya que cada uno
--    realizó 2 pedidos durante el período analizado.