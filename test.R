library(dplyr)

# Criação do dataframe original
df <- data.frame(
  Orgao = c('Plantão', 'Plantão', 'Outro', 'Plantão'),
  Assuntos_Gampes = c('Assunto 1', 'Assunto 2', 'Assunto 3', 'Assunto 4'),
  Autos_movimentados = c(10, 15, 5, 20)
)

df <- NAVV

df

# Filtrando o dataframe para "Orgão" igual a 'Plantão' e selecionando apenas as colunas desejadas
df_filtrado <- df %>%
  filter(Orgao == 'Plantão') %>%
  select(Assunto_Gampes, Autos_Movimentados)

# Exibindo o dataframe filtrado
ft< flextable(df_filtrado)
