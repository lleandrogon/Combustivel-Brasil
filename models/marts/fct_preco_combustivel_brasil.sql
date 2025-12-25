SELECT
    referencia,
    ano,
    mes,
    combustivel,
    preco_medio,
    ROUND(
        (
            preco_medio
            / NULLIF(
                LAG(preco_medio) OVER(
                    PARTITION BY combustivel
                    ORDER BY referencia
                ),
                0
            )
            - 1
        ) * 100,
        2
    ) AS mom_pct
FROM {{ ref('int_preco_combustivel_brasil_mes') }}