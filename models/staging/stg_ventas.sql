WITH source AS (
    SELECT * FROM {{ source('raw', 'ventas') }}
)

SELECT
    venta_id,
    fecha,
    cliente_id,
    producto_id,
    cantidad,
    precio_unitario,
    total,
    CURRENT_TIMESTAMP()          AS cargado_en
FROM source
WHERE venta_id IS NOT NULL