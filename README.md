# Joins-Complexos-Views-SQL
Praticando joins em várias tabelas e treinando condições 

Disciplina de Banco de Dados
Prof. @cassiocosta_


Visões – Exercícios
Criar Modelagem Orçamentos  
produtos (id, nome, valor, saldo) 
Saldo é a quantidade atual em estoque de um produto
Orcamentos ( id, data, status)
em orçamento
vendido
cancelado
Orçamentos_itens(id_prod, id_orc, valor_unit, quantidade, valor_total_item)
valor total do item é o valor_unit * quantidade. No insert já tem que informar.

Criar os scritps para criação do esquema do banco e as tabelas.
Criar UMA view que dê condições de:
Lista de orçamentos por produto
Valor total de produtos orçados por período	
ex. valor total dos produtos orçados no mes de março de 2022
Produtos que tem “Computador” no nome e que tem quantidade em estoque.
Os 10 produtos mais orçados no mês de setembro de 2014 e que ainda tem saldo em estoque. Somente os produtos com o valor acima de R$ 500.00.
Faça uma consulta utilizando a view para acrescentar 20% nos produtos que o saldo em estoque é menor ou igual a 5.
id, nome do produto, valor atual, valor_mais20
Delete todos os produtos que não foram orçados.
Explique quando utilizar o GROUP BY, de um exemplo sql.
Explique quando utilizar o HAVING, de um exemplo sql.
Explique quando utilizar o UNION, de um exemplo sql.
Explique quando utilizar o LEFT JOIN, de um exemplo sql.
