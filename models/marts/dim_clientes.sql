{{ config(materialized='table') }}

WITH clientes AS (
    SELECT * FROM {{ ref('stg_pagspags__clientes') }}
),

planos AS (
    SELECT * FROM {{ ref('stg_pagspags__planos') }}
)

SELECT
    c.cliente_id,
    c.cnpj,
    c.nome_fantasia,
    c.cidade,
    c.uf,
    c.mcc_principal,
    p.nome_plano,
    p.taxa_credito_pct,
    p.taxa_debito_pct,
    c.data_cadastro,
    c.status,
    c.canal_aquisicao
FROM clientes c
LEFT JOIN planos p
    ON c.plano_id = p.plano_id