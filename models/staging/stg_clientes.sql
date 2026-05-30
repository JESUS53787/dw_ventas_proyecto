WITH source AS (
    SELECT * FROM {{ source('raw', 'clientes') }}
)

SELECT
    cliente_id,
    nombre                       AS nombre_cliente,
    email,
    ciudad,
    pais,
    fecha_registro,
    CURRENT_TIMESTAMP()          AS cargado_en
FROM source
WHERE cliente_id IS NOT NULL