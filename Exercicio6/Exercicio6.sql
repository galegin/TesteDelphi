/*
Cliente
 - IdCliente: integer
 - Nome: varchar(50)
 - DataNascimento: timestamp
 - DataCadastro: timestamp
 - CPF: varchar(11)

PedidoVenda
 - IdPedido: integer
 - IdVendedor: integer
 - IdCliente: integer
 - DataInclusao: timestamp
 - DataBaixa: timestamp
 - NumeroParcelas: smallint
 - TotalPedido: numeric(14,4)

Vendedor
 - IdVendedor: integer
 - Nome: varchar(50)
*/

/*
a) Escreva um comando SQL que retorne o total dos pedidos realizados
pelo vendedor no mês de agosto de 2020. Exiba o código do vendedor, seu
nome e a soma do TotalPedido daquele mês.
*/

select
	p.IdVendedor,
	v.Nome,
	sum(p.TotalPedido) as TotalPedido
from
	PedidoVenda p,
	inner join Vendedor v on (v.IdVendedor = p.IdVendedor)
where 
	p.DataInclusao between '2020-08-31' and '2020-08-01'
group by
	p.IdVendedor,
	v.Nome
;

/*
b) Selecione os clientes aniversariantes do mês atual. Exiba o código,
nome e data de nascimento do cliente.
*/

select
	c.IdCliente,
	c.Nome,
	c.DataNascimento
from
	Cliente c
where
	extract(month from c.DataNascimento) = extract(month from current_date)
;

/*
c) Selecione todos os clientes que não tenham nenhum pedido de venda.
Exiba o nome, CPF e Data de cadastro.
*/

select
	c.Nome,
	c.CPF,
	c.DataCadastro
from
	Cliente c
	left outer join PedidoVenda p on (p.IdCliente = c.IdCliente)
where
	p.IdCliente is null
;