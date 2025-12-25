WITH combustiveis AS (

    -- Gasolina Comum
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'gasolina_comum' AS combustivel,
        ROUND(gasolina_comum_preco_revenda_avg, 2) AS preco_medio,
        ROUND(gasolina_comum_preco_revenda_min, 2) AS preco_min,
        ROUND(gasolina_comum_preco_revenda_max, 2) AS preco_max
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- Gasolina Aditivada
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'gasolina_aditivada' AS combustivel,
        ROUND(gasolina_aditivada_preco_revenda_avg, 2),
        ROUND(gasolina_aditivada_preco_revenda_min, 2),
        ROUND(gasolina_aditivada_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- Etanol
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'etanol_hidratado' AS combustivel,
        ROUND(etanol_hidratado_preco_revenda_avg, 2),
        ROUND(etanol_hidratado_preco_revenda_min, 2),
        ROUND(etanol_hidratado_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- Diesel
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'oleo_diesel' AS combustivel,
        ROUND(oleo_diesel_preco_revenda_avg, 2),
        ROUND(oleo_diesel_preco_revenda_min, 2),
        ROUND(oleo_diesel_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- Diesel S10
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'oleo_diesel_s10' AS combustivel,
        ROUND(oleo_diesel_s10_preco_revenda_avg, 2),
        ROUND(oleo_diesel_s10_preco_revenda_min, 2),
        ROUND(oleo_diesel_s10_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- GLP
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'gas_cozinha_glp' AS combustivel,
        ROUND(gas_cozinha_glp_preco_revenda_avg, 2),
        ROUND(gas_cozinha_glp_preco_revenda_min, 2),
        ROUND(gas_cozinha_glp_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

    UNION ALL

    -- GNV
    SELECT
        referencia,
        ano,
        mes,
        regiao,
        'gas_natural_veicular_gnv' AS combustivel,
        ROUND(gas_natural_veicular_gnv_preco_revenda_avg, 2),
        ROUND(gas_natural_veicular_gnv_preco_revenda_min, 2),
        ROUND(gas_natural_veicular_gnv_preco_revenda_max, 2)
    FROM {{ ref('stg_combustiveis_regioes') }}

)

SELECT * FROM combustiveis
