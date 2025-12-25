SELECT
    referencia,
    ano,
    mes,
    combustivel,
    preco_medio
FROM {{ ref('int_preco_combustivel_brasil_mes') }}