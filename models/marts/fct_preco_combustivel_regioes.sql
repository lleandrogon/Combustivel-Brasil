SELECT
    referencia,
    ano,
    mes,
    regiao,
    combustivel,
    preco_medio
FROM {{ ref('int_preco_combustivel_regioes_mes') }}