WITH transacoes AS (
    SELECT * FROM {{ ref('stg_pagspags__transacoes') }}
),
clientes AS (
    SELECT cliente_id FROM {{ ref('stg_pagspags__clientes') }}
)

SELECT t.*
FROM transacoes t
-- tira as 40 transacoes orfas
INNER JOIN clientes c
    ON t.cliente_id = c.cliente_id
-- tira os 25 valores negativos indevidos
WHERE NOT (t.valor_centavos < 0 AND t.status != 'estornada')
 -- tira as 15 datas no futuro
    AND t.data_transacao <= current_date()