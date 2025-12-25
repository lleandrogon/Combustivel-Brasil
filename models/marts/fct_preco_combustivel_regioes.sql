SELECT
    referencia,
    ano,
    mes,
    regiao,
    combustivel,
    preco_medio,
    ROUND(
        (
            preco_medio
            / NULLIF(
                LAG(preco_medio) OVER (
                    PARTITION BY regiao, combustivel
                    ORDER BY referencia
                ),
                0
            )
            - 1
        ) * 100,
        2
    ) AS mom_pct
FROM {{ ref('int_preco_combustivel_regioes_mes') }}