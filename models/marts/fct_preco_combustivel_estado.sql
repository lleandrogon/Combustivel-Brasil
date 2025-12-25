SELECT
    referencia,
    ano,
    mes,
    regiao,
    estado,
    combustivel,
    preco_medio,
    ROUND(
        (
            preco_medio
            / NULLIF(
                LAG(preco_medio) OVER (
                    PARTITION BY estado, combustivel
                    ORDER BY referencia
                ),
                0
            )
            - 1
        ) * 100,
        2
    ) AS mom_pct
FROM {{ ref('int_preco_combustivel_estado_mes') }}
