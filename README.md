# 📊 Projeto de Engenharia de Dados — Preço de Combustíveis no Brasil

## 📌 Sobre o Projeto

Este projeto tem como objetivo construir um pipeline de dados utilizando **dbt (Data Build Tool)** para modelar e transformar dados de preços médios de combustíveis no Brasil.

A partir de dados brutos (raw), são criadas camadas de transformação e modelos analíticos que permitem análise de preços:

- 🇧🇷 Brasil (agregado nacional)
- 🗺️ Por Unidade Federativa (Estados + DF)
- 🌎 Por Região

Ao final do processo, os dados são consumidos em um dashboard desenvolvido no **Power BI**, conectado diretamente ao banco PostgreSQL.

---

## 🏗️ Arquitetura do Projeto

O projeto segue uma arquitetura em camadas clássica de Engenharia de Dados:

Raw → Staging → Marts (Fact Tables) → Power BI

### 🔹 Raw
- Dados brutos armazenados no schema `analytics_raw`
- Sem tratamento ou modificação
- Representam fielmente a origem dos dados

### 🔹 Staging
- Padronização e limpeza de dados
- Remoção de valores nulos críticos
- Normalização de colunas

### 🔹 Marts (Camada Analítica)

Foram construídas as seguintes tabelas fact:

- `fct_preco_combustivel_brasil`
- `fct_preco_combustivel_estado`
- `fct_preco_combustivel_regioes`

Cada tabela contém:

- `referencia` (ano e mês)
- `ano`
- `mes`
- `combustivel`
- `preco_medio`
- `mom_pct` (variação percentual mês a mês - Month over Month)

As tabelas por estado e região incluem também:

- `estado` (Unidade Federativa)
- `regiao`

---

## 🧰 Tecnologias Utilizadas

- dbt
- PostgreSQL
- Power BI
- SQL
- Git & GitHub

---

## 🗄️ Banco de Dados

O projeto está conectado a um banco de dados **PostgreSQL**, onde:

- O schema `analytics_raw` armazena os dados brutos
- As tabelas transformadas são materializadas via dbt
- Testes de qualidade garantem integridade dos dados

---

## 📈 Visualização de Dados

Os dados modelados no PostgreSQL são consumidos pelo **Power BI**, onde foi desenvolvido um dashboard para análise de:

- Evolução histórica de preços
- Comparação entre regiões
- Comparação entre estados
- Variação percentual mês a mês (MoM)

⚠️ O arquivo do Power BI (.pbix) não é versionado no repositório por se tratar de um arquivo binário.

---

## 🧪 Qualidade de Dados

O projeto utiliza testes nativos do dbt para garantir:

- `not_null` em colunas críticas
- Controle de granularidade
- Integridade dos dados na camada analítica

---

## 📚 Documentação

A documentação do projeto pode ser gerada com:

```bash
dbt docs generate
dbt docs serve
```

---

## 🚀 Como Executar o Projeto

1. Configurar conexão com PostgreSQL no `profiles.yml`
2. Executar:

```bash
dbt run
dbt test
```

3. (Opcional) Gerar documentação:

```bash
dbt docs generate
dbt docs serve
```

---

## 🎯 Objetivo do Projeto

Este projeto foi desenvolvido com foco em:

- Prática de modelagem dimensional
- Organização de camadas (Raw → Staging → Marts)
- Implementação de testes de qualidade
- Integração entre Engenharia de Dados e BI