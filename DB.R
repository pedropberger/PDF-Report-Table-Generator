#library(readxl)
#autos <- read_excel("data/Autos Movimentados por Cargo.xlsx")
#View(autos)

# Carregando Bibliotecas

library(DBI)
library(odbc)

source('secrets.R')

con <- dbConnect(odbc(),
                 Driver = Driver,
                 Server = Server,
                 Database = Database,
                 UID = UID,
                 PWD = PWD,
                 Port = Port)

consulta_sql <- "/* Consulta que será utilizada para o relatório a partir de julho de 2022 */

  SELECT o.nome as [Orgão], a.[Assunto Gampes], MONTH(a.Data) as Mes, a.Data as Data, a.idauto as IdAuto, a.IdMovimentoAuto as IdMovimentoAuto
  FROM [BI_2023].[dbo].[Tabela195] as a with(nolock)
  INNER JOIN [MPES_Rel].[corporativo].[Orgao] as o with(nolock) ON a.IdOrgao = o.IdOrgao
  WHERE Cod_Assunto IN ('3372', '3370', '3371', '10845', '10846', '5566', '3419', '3420', '3421', '11417', '3465', '11456', '9742','900169')
  AND Data >= '2023-01-01' and Data < '2023-06-01'
  AND a.Cod_Movimento NOT IN ('1000024','1000023','1000072','2000010','2000020','920005','2000026','2000028','2000029','2000031','920007','920024','920025','920040','920041','920042','920058','920039','920043','920057','920303','920309','920327','920331','920332','920337',
'920344','920345','920346','920347','920350','920352','920353','920356','920357','920362','920364','920365','920366','920367','920371','920372','920377','920378','920385','920386','920387','920388','920393','920395','920401','920403','920407','920411','920413','920420',
'920424','920425','920426','920428','920434','920436','920437','920438','920441','920443','920447','920452','920455','970003','970005','970006','970113','920302','920307','920308','920310','920311','920313','920315','920333','920336','920341','920343','920359','920363','920370','920373','920375','920380',
'920382','920384','920399','920402','920404','920405','920406','920415','920421','920422','920427','920429','920430','920431','920432','920433','920435','920440','920442','920446','920453','970000','970002','970004','970107','970111'
)
"


# Execute a consulta
resultados <- dbGetQuery(con, consulta_sql)

# Feche a conexão com o banco de dados
dbDisconnect(con)

# Verifica se está tudo correto
head(resultados)
