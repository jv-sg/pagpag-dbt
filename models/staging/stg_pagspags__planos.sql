WITH fonte AS (
    SELECT * FROM {{ source('pagspags', 'planos') }}
)

SELECT
    plano_id,
    nome_plano,
    taxa_credito_pct,
    taxa_debito_pct,
    mensalidade_centavos
FROM fonte