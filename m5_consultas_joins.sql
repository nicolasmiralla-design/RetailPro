/* ============================================================
   PRE-ENTREGA N° 5
   Consultas con JOINs para el proyecto
   Base de datos: Ventas_Tech_DB
   ============================================================ */

USE Ventas_Tech_DB;
GO


/* ============================================================
   CONSULTA 1 - VISTA BASE DEL PROYECTO
   INNER JOIN
   ============================================================ */

SELECT
    v.fecha_venta AS fecha,
    v.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    v.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;
GO


/* ============================================================
   CONSULTA 2 - CLIENTES SIN VENTAS
   LEFT JOIN
   ============================================================ */

SELECT
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
GO


/* ============================================================
   CONSULTA 3 - PRODUCTOS SIN VENTAS
   LEFT JOIN
   ============================================================ */

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;
GO


/* ============================================================
   CONSULTA 4 - CONSOLIDADO POR CANAL
   UNION ALL
   ============================================================ */

WITH ventas_por_canal AS (

    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Online' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) <= 10

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Presencial' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) > 10
)

SELECT
    canal,
    SUM(total) AS total_facturado
FROM ventas_por_canal
GROUP BY canal
ORDER BY total_facturado DESC;
GO