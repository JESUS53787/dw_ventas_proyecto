SELECT
    producto_id,
    nombre_producto,
    categoria,
    subcategoria,
    costo,
    precio_venta,
    margen_pct,
    CASE
        WHEN margen_pct >= 40 THEN 'Alto Margen'
        WHEN margen_pct >= 20 THEN 'Margen Medio'
        ELSE 'Bajo Margen'
    END AS clasificacion_margen
FROM {{ ref('stg_productos') }}