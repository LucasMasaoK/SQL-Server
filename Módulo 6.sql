/*1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa 
an�lise considerando a tabela FactSales.*/
SELECT 
	SUM(F.SalesQuantity) AS 'QTD VENDIDA',
	SUM(F.ReturnQuantity) AS 'QTD DEVOLVIDA',
	SUM(F.SalesQuantity) - SUM(F.ReturnQuantity) AS 'DIFEREN�A'
FROM
	FactSales AS F

/*2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse 
resultado*/
SELECT 
	AVG(C.YearlyIncome)
FROM 
	DimCustomer as C
WHERE
	C.Occupation='Professional'

/*3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na 
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:
a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?*/
SELECT 
	TOP(1)
	S.EmployeeCount,
	S.StoreName
	
FROM
	DimStore AS S
ORDER BY 
	S.EmployeeCount DESC
/*c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?*/
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


/*4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade 
total de funcion�rios do sexo Masculino e do sexo Feminino. 
a) Descubra essas duas informa��es utilizando o SQL.*/
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
/*b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as 
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/
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

/*5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes 
informa��es:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, voc� pode fazer isso em uma mesma consulta.*/
SELECT
	COUNT(DISTINCT (P.ColorID)) AS CORES,
	COUNT(DISTINCT(P.BrandName)) AS MARCAS,
	COUNT(DISTINCT(P.ClassID)) AS CLASSES
FROM
	DimProduct AS P
