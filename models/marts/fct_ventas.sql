WITH int_ventas AS (
    SELECT * FROM {{ ref('int_ventas_enriquecidas') }}
)

SELECT
    venta_id,
    fecha,
    cliente_id,
    producto_id,
    cantidad,
    precio_unitario,
    total,
    ganancia_neta,
    DATE_TRUNC('month', fecha) AS mes,
    DATE_TRUNC('year',  fecha) AS anio
FROM int_ventas