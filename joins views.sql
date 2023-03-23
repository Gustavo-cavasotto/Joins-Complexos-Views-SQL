

ALTER TABLE orcamentos_itens
ADD valor_total_item DECIMAL(10,2) GENERATED ALWAYS AS (valor_unit * quantidade); # código para atribuir o calculo automaticamente

# 1
create view orcamentos_por_produto as
SELECT produtos.nome, orcamentos_itens.id_orc, orcamentos_itens.quantidade, orcamentos_itens.valor_total_item
FROM produtos
INNER JOIN orcamentos_itens ON orcamentos_itens.id_prod = produtos.id
GROUP BY produtos.nome;

# 2 
create view produtos_orcados_marco as
SELECT SUM(orcamentos_itens.valor_total_item) AS valor_total_produtos_vendidos, orcamentos.`data`
FROM orcamentos
INNER JOIN orcamentos_itens ON orcamentos_itens.id_orc = orcamentos.id
WHERE orcamentos.`data` BETWEEN '2023-03-01' AND '2023-03-31'
ORDER BY orcamentos.`data`;


#3
create view computadores_em_estoque as
SELECT produtos.nome, produtos.saldo - SUM(orcamentos_itens.quantidade) AS saldo_do_produto
FROM produtos
INNER JOIN orcamentos_itens ON orcamentos_itens.id_prod = produtos.id
WHERE produtos.nome LIKE 'Computador%'
HAVING saldo_do_produto > 0;

# se eu não colocasse SUM(orcamentos_itens.quantidade), ele pegaria cada orcamento e subtraria pela quantidade de cada coluna

# 4
create view produtos_mais_orcados_2014 as
SELECT produtos.nome, produtos.saldo - SUM(orcamentos_itens.quantidade) AS saldo_do_produto
FROM orcamentos
INNER JOIN orcamentos_itens ON orcamentos_itens.id_orc = orcamentos.id
INNER JOIN produtos ON produtos.id = orcamentos_itens.id_prod
WHERE orcamentos.`data` BETWEEN '2014-09-01' AND '2014-09-30'
  AND produtos.valor > 500
GROUP BY produtos.nome
HAVING saldo_do_produto > 0 
ORDER BY produtos.nome DESC
LIMIT 10;

# 5 

SELECT produtos.nome, produtos.saldo - SUM(orcamentos_itens.quantidade) AS estoque_atual, produtos.valor AS valor_antigo, produtos.valor * 1.2 AS valor_com_aumento
FROM produtos
INNER JOIN orcamentos_itens ON orcamentos_itens.id_prod = produtos.id
GROUP BY produtos.nome
HAVING estoque_atual <= 5;

#Delete todos os produtos que não foram orçados.

DELETE FROM produtos
WHERE id NOT IN (SELECT id_prod FROM orcamentos_itens)
# O id da tabela produtos que não está presente na tabela gerada na query, será excluido.



