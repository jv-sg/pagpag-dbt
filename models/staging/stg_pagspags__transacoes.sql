WITH fonte AS (
    SELECT * FROM {{ source('pagspags', 'transacoes') }}
)

SELECT
    transacao_id,
    cliente_id,
    data_transacao,
    valor_centavos,
    tipo,
    bandeira,
    parcelas,
    cast(mcc as string) AS mcc,
    status
FROM fonte