USE Ecommerce;

-- Qual o status do pedido dos clientes?
SELECT CONCAT(C.PrimeiroNome, ' ', C.UltimoNome) AS Cliente, P.StatusPedido 
FROM Cliente C 
INNER JOIN Pedido P ON C.IdCliente = P.IdPedido
ORDER BY C.PrimeiroNome;

-- Qual a forma de pagamento dos clientes?
SELECT CONCAT(C.PrimeiroNome, ' ', C.UltimoNome) AS Cliente, PG.FormaPagamento
FROM Cliente C
INNER JOIN Pagamento PG ON C.IdCliente = PG.IdPagamento
ORDER BY PG.FormaPagamento;

-- Algum vendedor também é fornecedor?
SELECT F.RazaoSocial AS Fornecedor, V.RazaoSocial AS Vendedor 
FROM Fornecedor F 
INNER JOIN VendedorTerceirizado V ON F.RazaoSocial = V.RazaoSocial;
-- OBS.: Os vendedores não são fornecedores.

