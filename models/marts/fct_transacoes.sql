{{
    config(
        materialized = 'incremental',
        unique_key = 'transacao_id'
    )
}}

SELECT
    t.transacao_id,
    t.cliente_id,
    t.data_transacao,
    t.valor_centavos,
    {{ centavos_para_reais ('t.valor_centavos') }} AS valor_reais,
    t.tipo,
    t.bandeira,
    t.parcelas,
    t.mcc,
    cat.categoria,
    cat.segmento,
    t.status

FROM {{ ref('int_transacoes_validas') }} t
LEFT JOIN {{ ref('mcc_categorias') }} cat
    ON t.mcc = cat.mcc

{% if is_incremental() %}

WHERE data_transacao > (select max(data_transacao) FROM {{ this }})

{% endif %}