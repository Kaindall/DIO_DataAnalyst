import numpy as np
import matplotlib.pyplot as plt

import pandas as pd

pd.set_option('display.max_columns', None)
pd.options.display.float_format = "{:20,.2f}".format


df = pd.read_excel("DIO-Pandas\AdventureWorks.xlsx")

#Receita Total
income = df["Valor Venda"].sum()
print (f"A receita total é: R$ {income}")

#Custo Total
df["Custo Total"] = df["Custo Unitário"] * df["Quantidade"]
total_cost = round(df["Custo Total"].sum(), 2)
print (f"O custo total é: R$ {total_cost}")

#Lucro Total
df["Lucro Bruto"] = df["Valor Venda"] - df["Custo Total"]
print (f'O lucro total é: R$ {round(df["Lucro Bruto"].sum(), 2)}')

#Tempo de Entrega por Marca
df["Tempo de Entrega"] = (df["Data Envio"] - df["Data Venda"]).dt.days
print(df.groupby("Marca")["Tempo de Entrega"].mean().reset_index())

#Lucro por Ano
print(df.groupby([df["Data Venda"].dt.year, "Marca"])["Lucro Bruto"].sum().reset_index())

#Quantidade vendida de cada produto
print(df.groupby(df["Produto"])["Quantidade"].sum().sort_values(ascending=False).reset_index())


#Lucro anual
df.groupby(df["Data Venda"].dt.year)[["Custo Total", "Valor Venda", "Lucro Bruto"]].sum().plot(kind="bar", \
                                                                                                title="Lucro x Ano",
                                                                                                ylabel = "Valor em R$",
                                                                                                xlabel = "Ano");

#Lucro por mês relatado bimestralmente em 2008
df_2008 = df[df["Data Venda"].dt.year == 2008]

df_2008.groupby(df_2008["Data Venda"].dt.month)[["Custo Total", "Valor Venda", "Lucro Bruto"]].sum().plot(title="Lucro x Bimestre",
                                                                                                        ylabel = "Valor em R$",
                                                                                                        xlabel = "Mês");

#Lucro de cada marca em 2008
df_2008.groupby("Marca")["Lucro Bruto"].sum().plot(kind="bar",
                                                    title="Lucro x Marca",
                                                    ylabel = "Valor em R$",
                                                    xlabel = "Marca",
                                                    rot=0);

#Lucro de cada classe de produto em 2008
df_2008.groupby("Classe")["Lucro Bruto"].sum().plot(kind="bar",
                                                    title="Lucro x Classe",
                                                    ylabel = "Valor em R$",
                                                    xlabel = "Classe",
                                                    rot=0);

#Verificando a distribuição de Tempo de Envio em 2008
df_2008["Tempo de Entrega"].plot(kind="box",
                                title="Lucro x Classe",
                                ylabel = "Valor em R$",
                                xlabel = "Classe",
                                rot=0);

#Verificando o caso excepcional fora da curva
df[df["Tempo de Entrega"] == 20]

df.to_csv("AW_New.csv", index=False)

plt.show()