/*1. a) A partir da tabela DimProduct, crie uma View contendo as informações de
ProductName, ColorName, UnitPrice e UnitCost, da tabela DimProduct. Chame essa View 
de vwProdutos.*/
CREATE VIEW vwProdutos as
SELECT 
ProductName, ColorName, UnitPrice, UnitCost
FROM
DimProduct
GO

SELECT * FROM vwProdutos go
/*b) A partir da tabela DimEmployee, crie uma View mostrando FirstName, BirthDate, 
DepartmentName. Chame essa View de vwFuncionarios.*/
CREATE VIEW vwFuncionarios as
select 
FirstName, BirthDate, 
DepartmentName
from DimEmployee
go
SELECT * FROM vwFuncionarios GO

/*c) A partir da tabela DimStore, crie uma View mostrando StoreKey, StoreName e 
OpenDate. Chame essa View de vwLojas.*/
CREATE VIEW vwLojas as
SELECT 
StoreKey, StoreName, 
OpenDate
FROM
DimStore
GO
SELECT * FROM vwLojas


/*2. Crie uma View contendo as informações de Nome Completo (FirstName + LastName), Gênero (por extenso), E-mail e Renda Anual (formatada com R$). Utilize a tabela DimCustomer. Chame essa View de vwClientes.*/
CREATE VIEW vwClientes as
SELECT C.FirstName +' '+ C.LastName as 'Nome', 
CASE WHEN C.Gender ='M' THEN 'Masculino' ELSE 'Feminino'END as 'Sexo',
C.EmailAddress, 
format(C.YearlyIncome,'C') FROM DimCustomer AS C
go


/*3. a) A partir da tabela DimStore, crie uma View que considera apenas as lojas ativas. Faça um SELECT de todas as colunas. Chame essa View de vwLojasAtivas.*/
CREATE VIEW vwLojasAtivas as
SELECT * FROM DimStore AS D
WHERE D.Status='on'
go
SELECT * FROM vwLojasAtivas
go
/*b) A partir da tabela DimEmployee, crie uma View de uma tabela que considera apenas os funcionários da área de Marketing. Faça um SELECT das colunas: FirstName, EmailAddress e DepartmentName. Chame essa de vwFuncionariosMkt.*/
CREATE VIEW vwFuncionariosMkt as
SELECT  FirstName as 'Nome', EmailAddress as 'Email', DepartmentName FROM DimEmployee
WHERE DepartmentName='Marketing'
go
SELECT * FROM vwFuncionariosMkt
GO
/*c) Crie uma View de uma tabela que considera apenas os produtos das marcas Contoso e Litware. Além disso, a sua View deve considerar apenas os produtos de cor Silver. Faça um SELECT de todas as colunas da tabela DimProduct. Chame essa View de vwContosoLitwareSilver.*/
CREATE VIEW vwContosoLitwareSilver AS
SELECT * FROM DimProduct AS P
WHERE P.BrandName IN ('Contoso','Litware')
and P.ColorName='Silver'
GO
SELECT * FROM vwContosoLitwareSilver
GO
/*4. Crie uma View que seja o resultado de um agrupamento da tabela FactSales. Este agrupamento deve considerar o SalesQuantity (Quantidade Total Vendida) por Nome do Produto. Chame esta View de vwTotalVendidoProdutos.
OBS: Para isso, você terá que utilizar um JOIN para relacionar as tabelas FactSales e DimProduct.*/
CREATE VIEW vwTotalVendidoProdutos AS
SELECT P.ProductName AS 'PRODUTO', SUM(S.SalesQuantity) AS 'QTD' FROM FactSales AS s
JOIN DimProduct AS P
ON P.ProductKey=s.ProductKey
GROUP BY P.ProductName
GO
SELECT * FROM vwTotalVendidoProdutos
GO
/*5. Faça as seguintes alterações nas tabelas da questão 1.
a. Na View criada na letra a da questão 1, adicione a coluna de BrandName.*/
ALTER  VIEW vwProdutos as
SELECT 
ProductName, ColorName, UnitPrice, UnitCost, BrandName
FROM
DimProduct
GO
SELECT * from vwProdutos
/*b. Na View criada na letra b da questão 1, faça um filtro e considere apenas os funcionários do sexo feminino.*/
ALTER VIEW vwFuncionarios as
select 
FirstName, BirthDate, 
DepartmentName
from DimEmployee
WHERE Gender='F'
go
SELECT * FROM vwFuncionarios GO
/*c. Na View criada na letra c da questão 1, faça uma alteração e filtre apenas as lojas ativas.*/
ALTER VIEW vwLojas as
SELECT 
StoreKey, StoreName, 
OpenDate
FROM
DimStore
WHERE Status='ON'
GO
SELECT * FROM vwLojas
GO
/*6. a) Crie uma View que seja o resultado de um agrupamento da tabela DimProduct. O resultado esperado da consulta deverá ser o total de produtos por marca. Chame essa View de vw_6a.*/
CREATE VIEW vw_6a AS
SELECT P.BrandName AS 'MARCA',COUNT(*)  AS 'QTD' FROM DimProduct AS P
GROUP BY P.BrandName
GO 
SELECT * FROM vw_6a
GO
/*b) Altere a View criada no exercício anterior, adicionando o peso total por marca. Atenção: sua View final deverá ter então 3 colunas: Nome da Marca, Total de Produtos e Peso Total.*/
ALTER VIEW vw_6a AS
SELECT P.BrandName AS 'MARCA',COUNT(*)  AS 'QTD',SUM(P.Weight) AS 'PESO' FROM DimProduct AS P
GROUP BY P.BrandName
GO 
SELECT * FROM vw_6a

/*c) Exclua a View vw_6a.*/
DROP VIEW vw_6a