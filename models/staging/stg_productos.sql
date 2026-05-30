WITH source AS (
    SELECT * FROM {{ source('raw', 'productos') }}
)

SELECT
    producto_id,
    nombre                       AS nombre_producto,
    categoria,
    subcategoria,
    costo,
    precio_venta,
    ROUND((precio_venta - costo) / NULLIF(costo, 0) * 100, 2) AS margen_pct,
    CURRENT_TIMESTAMP()          AS cargado_en
FROM source
WHERE producto_id IS NOT NULL