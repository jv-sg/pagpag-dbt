{{ config(severity = 'warn') }}
-- Regra de negocio: contestacao nao pode valer mais que a transacao.
SELECT
    cb.chargeback_id,
    cb.transacao_id,
    cb.valor_centavos       AS valor_contestado,
    abs(t.valor_centavos)   AS valor_transacao

FROM {{ ref('stg_aurora__chargebacks') }} cb

INNER JOIN {{ ref('stg_aurora__transacoes') }} t
    ON cb.transacao_id = t.transacao_id
    
WHERE cb.valor_centavos > abs(t.valor_centavos)