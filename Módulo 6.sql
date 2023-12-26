/*1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa 
análise considerando a tabela FactSales.*/
SELECT 
	SUM(F.SalesQuantity) AS 'QTD VENDIDA',
	SUM(F.ReturnQuantity) AS 'QTD DEVOLVIDA',
	SUM(F.SalesQuantity) - SUM(F.ReturnQuantity) AS 'DIFERENÇA'
FROM
	FactSales AS F

/*2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse 
resultado*/
SELECT 
	AVG(C.YearlyIncome)
FROM 
	DimCustomer as C
WHERE
	C.Occupation='Professional'

/*3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na 
empresa. O seu gerente te pediu os seguintes números e informações:
a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?*/
SELECT 
	TOP(1)
	S.EmployeeCount,
	S.StoreName
	
FROM
	DimStore AS S
ORDER BY 
	S.EmployeeCount DESC
/*c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?*/
SELECT 
    TOP(1)
	MIN(S.EmployeeCount),
	S.StoreName
	
FROM
	DimStore AS S
WHERE
	S.EmployeeCount IS NOT NULL
GROUP BY 
	S.StoreName,S.EmployeeCount


/*4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade 
total de funcionários do sexo Masculino e do sexo Feminino. 
a) Descubra essas duas informações utilizando o SQL.*/
SELECT
	COUNT(E.EmployeeKey)
FROM
	DimEmployee AS E
WHERE 
	E.Gender='M'

SELECT
	COUNT(E.EmployeeKey)
FROM
	DimEmployee AS E
WHERE 
	E.Gender='F'
/*b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as 
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.*/
SELECT
	TOP(1)
	E.FirstName,
	E.EmailAddress,
	E.StartDate
FROM
	DimEmployee AS E
WHERE 
	E.Gender='M'
ORDER BY
	E.StartDate ASC

SELECT
	TOP(1)
	E.FirstName,
	E.EmailAddress,
	E.StartDate
FROM
	DimEmployee AS E
WHERE 
	E.Gender='F'
ORDER BY
	E.StartDate ASC

/*5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes 
informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta.*/
SELECT
	COUNT(DISTINCT (P.ColorID)) AS CORES,
	COUNT(DISTINCT(P.BrandName)) AS MARCAS,
	COUNT(DISTINCT(P.ClassID)) AS CLASSES
FROM
	DimProduct AS P
