/*1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7*/

declare @valor1 int = 10,
@valor2 int = 5,
@valor3 float = 34,
@valor4 float = 7

select @valor1

/*a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame 
essa vari�vel de soma.*/
declare @soma int= @valor1 + @valor2
select @soma

/*b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4. 
Chame essa vari�vel de subtracao.*/
declare @subtracao int= @valor3 - @valor4
select @subtracao

/*c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o 
valor4. Chame essa vari�vel de multiplicacao*/
declare @multiplicacao int= @valor1 * @valor4
select @multiplicacao

/*d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame 
essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.*/
declare @divisao float= @valor3 / @valor4
select @divisao

/*d) Arredonde o resultado da letra d) para 2 casas decimais.*/
declare @divisaoRound float= round(@valor3 / @valor4,2)
select @divisaoRound

/*2. Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser 
especificado.
a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12. 
c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre 
�quantidade� e �preco�. 
e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.*/DECLARE @produto varchar(30) ='Celular',		@quantidade int =12,		@preco float=9.99,		@faturamento float 		set @faturamento= @quantidade  * @precoselect @produto,@quantidade,@preco,@faturamento/*3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de 
usu�rios. Em resumo, esses dados s�o:
- Nome do usu�rio
- Data de nascimento
- Quantidade de pets que aquele usu�rio possui
Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este 
usu�rio. Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e 
num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.
O resultado final a ser alcan�ado � mostrado no print abaixo:
Dica: voc� precisar� utilizar as fun��es CAST e FORMAT para chegar no resultado.*/

DECLARE @nome varchar(30)='Andr�',
		@data date ='10/02/1998',
		@pets int = 2

print('Meu nome � ' + @nome + ' nasci em ' + Format(@data,'dd/MM/yyyy') +' e tenho ' + cast(@pets as varchar)+ ' pets.')

/*4. Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as 
lojas da empresa. 
A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a 
empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio � descobrir 
o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e 
mapear planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura:
�As lojas fechadas no ano de 2008 foram: � + nome_das_lojas*/
declare @nomeLoja Varchar(80) ='Nome teste'


select @nomeLoja = @nomeLoja + StoreName + ', ' from DimStore 
where format(CloseDate, 'yyyy') =2008;
print('As lojas fechadas no ano de 2008 foram: ' + @nomeLoja)

/*5. Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
uma subcategoria espec�fica: �Lamps�.
Utilize o conceito de vari�veis para chegar neste resultado*/
DECLARE @PRODUTOS varchar(255)='';

SELECT  @PRODUTOS= @PRODUTOS + P.ProductName +', ' FROM DimProduct AS P
JOIN DimProductSubcategory AS S 
ON S.ProductSubcategoryKey =P.ProductSubcategoryKey
WHERE S.ProductSubcategoryName='Lamps'

select @PRODUTOS