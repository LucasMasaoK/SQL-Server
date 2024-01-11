/*1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7*/

declare @valor1 int = 10,
@valor2 int = 5,
@valor3 float = 34,
@valor4 float = 7

select @valor1

/*a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame 
essa variável de soma.*/
declare @soma int= @valor1 + @valor2
select @soma

/*b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. 
Chame essa variável de subtracao.*/
declare @subtracao int= @valor3 - @valor4
select @subtracao

/*c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o 
valor4. Chame essa variável de multiplicacao*/
declare @multiplicacao int= @valor1 * @valor4
select @multiplicacao

/*d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame 
essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.*/
declare @divisao float= @valor3 / @valor4
select @divisao

/*d) Arredonde o resultado da letra d) para 2 casas decimais.*/
declare @divisaoRound float= round(@valor3 / @valor4,2)
select @divisaoRound

/*2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser 
especificado.
a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12. 
c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre 
‘quantidade’ e ‘preco’. 
e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.*/DECLARE @produto varchar(30) ='Celular',		@quantidade int =12,		@preco float=9.99,		@faturamento float 		set @faturamento= @quantidade  * @precoselect @produto,@quantidade,@preco,@faturamento/*3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de 
usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este 
usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e 
num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:
Dica: você precisará utilizar as funções CAST e FORMAT para chegar no resultado.*/

DECLARE @nome varchar(30)='André',
		@data date ='10/02/1998',
		@pets int = 2

print('Meu nome é ' + @nome + ' nasci em ' + Format(@data,'dd/MM/yyyy') +' e tenho ' + cast(@pets as varchar)+ ' pets.')

/*4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as 
lojas da empresa. 
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a 
empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir 
o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e 
mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas*/
declare @nomeLoja Varchar(80) ='Nome teste'


select @nomeLoja = @nomeLoja + StoreName + ', ' from DimStore 
where format(CloseDate, 'yyyy') =2008;
print('As lojas fechadas no ano de 2008 foram: ' + @nomeLoja)

/*5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado*/
DECLARE @PRODUTOS varchar(255)='';

SELECT  @PRODUTOS= @PRODUTOS + P.ProductName +', ' FROM DimProduct AS P
JOIN DimProductSubcategory AS S 
ON S.ProductSubcategoryKey =P.ProductSubcategoryKey
WHERE S.ProductSubcategoryName='Lamps'

select @PRODUTOS