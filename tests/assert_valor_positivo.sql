-- Teste singular: retorna as linhas ERRADAS. Zero linhas = passou.
SELECT
    transacao_id,
    valor_centavos,
    status
FROM {{ ref('fct_transacoes') }}

WHERE valor_centavos < 0
    AND status != 'estornada'