WITH ventas AS (
    SELECT * FROM {{ ref('stg_ventas') }}
),

productos AS (
    SELECT * FROM {{ ref('stg_productos') }}
),

clientes AS (
    SELECT * FROM {{ ref('stg_clientes') }}
)

SELECT
    v.venta_id,
    v.fecha,
    v.cantidad,
    v.precio_unitario,
    v.total,

    p.producto_id,
    p.nombre_producto,
    p.categoria,
    p.subcategoria,
    p.costo,
    p.margen_pct,

    c.cliente_id,
    c.nombre_cliente,
    c.ciudad,
    c.pais,

    v.total - (p.costo * v.cantidad) AS ganancia_neta

FROM ventas v
LEFT JOIN productos p ON v.producto_id = p.producto_id
LEFT JOIN clientes  c ON v.cliente_id  = c.cliente_id