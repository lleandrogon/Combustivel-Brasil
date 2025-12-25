WITH source AS (
    SELECT
        TO_DATE(referencia || '-01', 'YYYY-MM-DD') AS referencia,
        ano,
        mes,
        regiao,
        CAST(gasolina_comum_preco_revenda_avg AS numeric) AS gasolina_comum_preco_revenda_avg,
        CAST(gasolina_comum_preco_revenda_min AS numeric) AS gasolina_comum_preco_revenda_min,
        CAST(gasolina_comum_preco_revenda_max AS numeric) AS gasolina_comum_preco_revenda_max,
        CAST(gasolina_aditivada_preco_revenda_avg AS numeric) AS gasolina_aditivada_preco_revenda_avg,
        CAST(gasolina_aditivada_preco_revenda_min AS numeric) AS gasolina_aditivada_preco_revenda_min,
        CAST(gasolina_aditivada_preco_revenda_max AS numeric) AS gasolina_aditivada_preco_revenda_max,
        CAST(etanol_hidratado_preco_revenda_avg AS numeric) AS etanol_hidratado_preco_revenda_avg,
        CAST(etanol_hidratado_preco_revenda_min AS numeric) AS etanol_hidratado_preco_revenda_min,
        CAST(etanol_hidratado_preco_revenda_max AS numeric) AS etanol_hidratado_preco_revenda_max,
        CAST(oleo_diesel_preco_revenda_avg AS numeric) AS oleo_diesel_preco_revenda_avg,
        CAST(oleo_diesel_preco_revenda_min AS numeric) AS oleo_diesel_preco_revenda_min,
        CAST(oleo_diesel_preco_revenda_max AS numeric) AS oleo_diesel_preco_revenda_max,
        CAST(oleo_diesel_s10_preco_revenda_avg AS numeric) AS oleo_diesel_s10_preco_revenda_avg,
        CAST(oleo_diesel_s10_preco_revenda_min AS numeric) AS oleo_diesel_s10_preco_revenda_min,
        CAST(oleo_diesel_s10_preco_revenda_max AS numeric) AS oleo_diesel_s10_preco_revenda_max,
        CAST(gas_cozinha_glp_preco_revenda_avg AS numeric) AS gas_cozinha_glp_preco_revenda_avg,
        CAST(gas_cozinha_glp_preco_revenda_min AS numeric) AS gas_cozinha_glp_preco_revenda_min,
        CAST(gas_cozinha_glp_preco_revenda_max AS numeric) AS gas_cozinha_glp_preco_revenda_max,
        CAST(gas_natural_veicular_gnv_preco_revenda_avg AS numeric) AS gas_natural_veicular_gnv_preco_revenda_avg,
        CAST(gas_natural_veicular_gnv_preco_revenda_min AS numeric) AS gas_natural_veicular_gnv_preco_revenda_min,
        CAST(gas_natural_veicular_gnv_preco_revenda_max AS numeric) AS gas_natural_veicular_gnv_preco_revenda_max
    FROM {{ source('raw', 'combustiveis_regioes') }}
)

SELECT *
FROM source
