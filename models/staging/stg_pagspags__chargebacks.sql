WITH fonte AS (
     SELECT * FROM {{ source('pagspags', 'chargebacks') }}
)

SELECT
    chargeback_id,
    transacao_id,
    data_abertura,
    valor_centavos,
    motivo,
    status
FROM fonte

qualify row_number() over (partition by chargeback_id order by data_abertura) = 1