# Carregando o pacote data.table
install.packages('data.table')
library(data.table)

# Importando as tabelas de arquivos CSV com separadores diferentes
atividades <- fread("data/areafim/atividades.csv", sep = ";")
promotor <- fread("data/areafim/promotor.csv", sep = ",")
funcao <- fread("data/areafim/funcao.csv", sep = ",")
movimento <- fread("data/areafim/movimento.csv", sep = ",")
orgao <- fread("data/areafim/orgao.csv", sep = ",")

# Realizando a consulta
resultado <- atividades[funcao[IdFuncao == atividades$IdFuncao & Nome == "1º Promotor de Justiça"],
                        on = .(IdPromotor = IdPromotor)][Tipo = 'A',
                                                         .(nome_orgao = orgao$Nome,
                                                           nome_funcao = funcao$Nome,
                                                           nome_movimento = movimento$Descricao,
                                                           movimentos = uniqueN(IdMovimentoAuto)),
                                                         by = .(orgao$Nome, funcao$Nome, movimento$Descricao)][IdOrgao == 100,
                                                                                              order(-movimentos)]

# Exibir o resultado
print(resultado)
head(promotor)
