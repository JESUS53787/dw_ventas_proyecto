WITH clientes AS (
    SELECT * FROM {{ ref('stg_clientes') }}
)

SELECT
    cliente_id,
    nombre_cliente,
    email,
    ciudad,
    pais,
    fecha_registro,
    DATEDIFF('day', fecha_registro, CURRENT_DATE()) AS dias_como_cliente
FROM clientes