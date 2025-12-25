SELECT
    referencia,
    ano,
    mes,
    regiao,
    estado,
    combustivel,
    preco_medio
FROM {{ ref('int_preco_combustivel_estado_mes') }}