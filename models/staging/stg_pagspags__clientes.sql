WITH fonte AS (
    SELECT * FROM {{ source('pagspags', 'clientes') }}
)

SELECT
    cliente_id,
    lpad(cast(cnpj as string), 14, '0') AS cnpj,
    nome_fantasia,
    cidade,
    upper(uf)                           AS uf,
    plano_id,
    data_cadastro,
    status,
    canal_aquisicao,
    cast(mcc_principal as string)       AS mcc_principal
FROM fonte