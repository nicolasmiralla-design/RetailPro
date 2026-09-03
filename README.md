# RetailPro — Proyecto de Análisis de Datos

## Descripción

RetailPro es un proyecto de análisis de datos orientado al estudio del desempeño comercial mediante un flujo completo de trabajo que abarca almacenamiento, consultas SQL, transformación, modelado y análisis de información.

La base de datos utilizada es `Ventas_Tech_DB` y está compuesta principalmente por las tablas `ventas`, `clientes`, `productos` y `categorias`, relacionadas para permitir el análisis integrado de las operaciones comerciales.

## Herramientas utilizadas

- **SQL Server:** creación y administración de la base de datos `Ventas_Tech_DB`.
- **SQL Server Management Studio (SSMS):** creación de tablas, carga de datos y ejecución de consultas SQL.
- **Power BI:** transformación de datos mediante Power Query, construcción del modelo de relaciones, creación de tabla calendario y desarrollo de medidas DAX.
- **GitHub:** organización, almacenamiento y documentación de los archivos correspondientes al proyecto.

## Contenido del proyecto

El proyecto incluye scripts SQL destinados a:

- Crear la base de datos y sus tablas.
- Establecer claves y relaciones entre las tablas.
- Cargar los datos necesarios para el análisis.
- Realizar consultas con filtros y agregaciones.
- Analizar productos, clientes y ventas.
- Combinar información mediante `INNER JOIN` y `LEFT JOIN`.
- Consolidar resultados mediante operaciones como `UNION ALL`.

Además, se incluyen los archivos de Power BI utilizados para la transformación, el modelado y el análisis de los datos.

## Cómo ejecutar los scripts SQL

1. Abrir **SQL Server Management Studio (SSMS)**.
2. Conectarse a la instancia correspondiente de SQL Server.
3. Ejecutar primero el script encargado de crear la base de datos `Ventas_Tech_DB`, sus tablas y relaciones.
4. Ejecutar los scripts correspondientes a la carga de datos.
5. Ejecutar posteriormente las consultas SQL de análisis.
6. Verificar los resultados obtenidos antes de utilizarlos en las siguientes etapas del proyecto.

## Power BI

Los datos del proyecto son utilizados posteriormente en Power BI, donde se realiza el proceso de transformación mediante Power Query y se construye el modelo analítico.

El modelo incluye relaciones entre las tablas, una tabla calendario para el análisis temporal y medidas DAX destinadas a calcular indicadores comerciales.

## Objetivo del proyecto

El objetivo de RetailPro es disponer de una solución organizada y documentada que permita analizar el desempeño comercial y que, al mismo tiempo, pueda ser comprendida y continuada por otro analista.
