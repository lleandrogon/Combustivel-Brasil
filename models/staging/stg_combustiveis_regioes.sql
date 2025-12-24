WITH source AS (
    SELECT
        TO_DATE(referencia || '-01', 'YYYY-MM-DD') AS referencia,
        ano,
        mes,
        regiao,
        gasolina_comum_preco_revenda_avg,
        gasolina_comum_preco_revenda_min,
        gasolina_comum_preco_revenda_max,
        gasolina_aditivada_preco_revenda_avg,
        gasolina_aditivada_preco_revenda_min,
        gasolina_aditivada_preco_revenda_max,
        etanol_hidratado_preco_revenda_avg,
        etanol_hidratado_preco_revenda_min,
        etanol_hidratado_preco_revenda_max,
        oleo_diesel_preco_revenda_avg,
        oleo_diesel_preco_revenda_min,
        oleo_diesel_preco_revenda_max,
        oleo_diesel_s10_preco_revenda_avg,
        oleo_diesel_s10_preco_revenda_min,
        oleo_diesel_s10_preco_revenda_max,
        gas_cozinha_glp_preco_revenda_avg,
        gas_cozinha_glp_preco_revenda_min,
        gas_cozinha_glp_preco_revenda_max,
        gas_natural_veicular_gnv_preco_revenda_avg,
        gas_natural_veicular_gnv_preco_revenda_min,
        gas_natural_veicular_gnv_preco_revenda_max
    FROM {{ source('raw', 'combustiveis_regioes') }}
)

SELECT * FROM source