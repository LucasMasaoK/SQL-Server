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