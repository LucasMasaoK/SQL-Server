/*1. a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal 
de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity, 
em ordem decrescente.*/
SELECT TOP(100) * FROM FactSales

SELECT 
	C.ChannelName,
	SUM(S.SalesQuantity)
FROM
	FactSales AS S
JOIN
	DimChannel AS C
	ON C.ChannelKey= S.channelKey
GROUP BY
	C.ChannelName
ORDER BY 
	SUM(S.SalesQuantity) DESC
	

/*b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e 
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas 
(StoreName).*/
SELECT
	C.ChannelName,
	SUM(S.SalesQuantity) AS 'QTD VENDIDA',
	SUM(S.ReturnQuantity) AS 'QTDE RETORNADA'
FROM
	FactSales AS S
JOIN
	DimChannel AS C
	ON C.ChannelKey=S.channelKey
GROUP BY
	C.ChannelName

/*c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s 
(CalendarMonthLabel) e ano (CalendarYear).*/
SELECT TOP(100) * FROM FactSales

SELECT 
	D.CalendarMonthLabel,
	D.CalendarYear,
	SUM(S.SalesAmount)
FROM
	FactSales AS S
JOIN
	DimDate AS D
	ON D.Datekey=S.DateKey
GROUP BY
	D.CalendarMonthLabel,
	D.CalendarYear,
	D.CalendarMonth
ORDER BY
	D.CalendarMonth

/*4. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o nome completo 
do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).*/
SELECT TOP(1)
	C.CustomerKey,
	C.FirstName,
	SUM(S.SalesQuantity)
FROM
	FactOnlineSales AS S
JOIN
	DimCustomer AS C
	ON C.CustomerKey=S.CustomerKey
WHERE C.CustomerType='PERSON'
GROUP BY
	C.CustomerKey,
	C.FirstName
ORDER BY 
	SUM(S.SalesQuantity) DESC


/*b) Feito isso, fa�a um agrupamento de produtos e descubra quais foram os top 10 produtos mais 
comprados pelo cliente da letra a, considerando o nome do produto.*/SELECT TOP(10) 	P.ProductName,	COUNT(P.ProductKey)FROM 	FactOnlineSales AS FJOIN 	DimProduct AS P	ON P.ProductKey=F.ProductKeyWHERE 	F.CustomerKey=7665GROUP BY	P.ProductName,	P.ProductKeyORDER BY	COUNT(P.ProductKey) DESC/*5. Fa�a um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes.*/SELECT	C.Gender AS 'SEXO',	SUM(S.SalesQuantity) AS 'QTD VENDIDA'FROM 	FactOnlineSales AS SJOIN 	DimCustomer AS C	ON C.CustomerKey=S.CustomerKeyWHERE 	C.Gender IS NOT NULLGROUP BY 	C.Gender/*6. Fa�a uma tabela resumo mostrando a taxa de c�mbio m�dia de acordo com cada CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100.*/SELECT 	C.CurrencyDescription,	AVG(F.AverageRate) AS 'MEDIA'FROM 	FactExchangeRate AS FJOIN 	DimCurrency AS C	ON C.CurrencyKey= F.CurrencyKeyGROUP BY	F.CurrencyKey,	C.CurrencyDescriptionHAVING 	AVG(F.AverageRate) BETWEEN 10 AND 100 /*7. Calcule a SOMA TOTAL de AMOUNT referente � tabela FactStrategyPlan destinado aos cen�rios: Actual e Budget.*/SELECT 	S.ScenarioDescription,	SUM(F.Amount) FROM 	FactStrategyPlan F JOIN 	DimScenario AS S 	ON 	S.ScenarioKey=F.ScenarioKey WHERE 	S.ScenarioDescription IN ('Actual','Budget')GROUP BY 	S.ScenarioDescription/*8. Fa�a uma tabela resumo mostrando o resultado do planejamento estrat�gico por ano.*/SELECT 	D.CalendarYear,	SUM(S.Amount) AS '$'FROM 	FactStrategyPlan AS SJOIN 	DimDate AS D	ON D.Datekey=S.DatekeyGROUP BY 	D.CalendarYear/*9. Fa�a um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em considera��o em sua an�lise apenas a marca Contoso e a cor Silver.*/SELECT 	S.ProductSubcategoryName,	COUNT(*) FROM DimProduct AS PJOIN 	DIMPRODUCTSUBCATEGORY AS S	ON S.ProductSubcategoryKey=P.ProductSubcategoryKeyWHERE 	P.BrandName='CONTOSO'		AND P.ColorName='SILVER'GROUP BY	S.ProductSubcategoryName/*10. Fa�a um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. A tabela final dever� ser ordenada de acordo com a coluna BrandName.*/SELECT		BrandName,	ProductSubcategoryName,	COUNT(*)FROM	DimProduct AS PJOIN 	DIMPRODUCTSUBCATEGORY AS S	ON S.ProductSubcategoryKey=P.ProductSubcategoryKeyGROUP BY 	BrandName,	ProductSubcategoryNameORDER BY 	BrandName