<%@page import="model.funcionarios.pf.PessoaFisica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
    <meta http-equiv="content-language" content="pt-br" />
    <meta name="description" content="GeRsON - Ger�ncia de Recursos On-line" />
    <meta name="keywords" content="cadastro de cliente, controle de almoxarifado" />
    <link rel="stylesheet" type="text/css" href="css/screen.css">


   <title>GeRsON</title>
  </head>
  <body>

    <div id="layout">
      
      <div id="header">
        
        <h1 id="logo"><a href="#" title="#">GeRs<span>ON</span></a></h1>
        <hr class="noscreen" />   
          
        <!-- Inicio do Menu de Navega��o que ser� ativo ap�s o login -->  
        <div id="navigation">
       
        <% 
		//Verificando se existe um resultado para a pesquisa de matricula e senha 
		if (request.getParameter("situacao") != null) {
			//Caso exista um resultado (situa��o), utiliza-se um case para identificar o tipo de menu ou o tipo de mensagem 
			int situacao = Integer.parseInt(request.getParameter("situacao"));
			switch(situacao) {
			case 0:
			//Situa��o onde a senha est� incorreta
				%>
				<p align="right"><font color="red" size=2 ><b>Senha incorreta! Tente novamente!&nbsp;&nbsp;</b></font></p>
				<%
			 break;
			 case 1:
			//Situa��o onde o usu�rio est� incorreto
				 %>
					<p align="right"><font color="red" size=2 ><b>Usu�rio incorreto! Tente novamente!&nbsp;&nbsp;</b></font></p>
					<%
			 break;
			 case 2:
			//Situa��o onde a matr�cula e a senha est� correta
			//Cargo Gerente: cria uma se��o para o gerente
			//Mostra o menu do Gerente
				if(session.getAttribute("funcionario") != null) {
				
					PessoaFisica pessoaFisica = (PessoaFisica) session.getAttribute("funcionario");
					if(pessoaFisica.getCargo().equalsIgnoreCase("gerente")){
					%>		
						<p align="right"><font color="red"> <b> | </b></font> <font color="white"> <b> <%=pessoaFisica.getNome() %> </b> </font><font color="grey"> - <%=pessoaFisica.getCargo() %>&nbsp;&nbsp; </font> </p>
						<ul>
						<li><a href="index.jsp?situacao=2">In�cio</a></li>
						<li><a href="index.jsp?item=1&situacao=2">Pessoa F�sica</a></li>
	          			<li><a href="index.jsp?item=2&situacao=2">Pessoa Jur�dica</a></li>
	          			<li><a href="index.jsp?item=23&situacao=2">Relat�rios</a></li><!-- mostra todos os relatorios -->
	          			<li><a href="logoff.jsp">Sair</a></li>
	 					</ul>
					<%
					}
					else{
						%>
						<p align="right"><font color="red"><b> | </b></font><font color="white"><b> <%=pessoaFisica.getNome() %> </b> - </font> <font color="grey"> <%=pessoaFisica.getCargo() %>&nbsp;&nbsp;</font></p>
						<ul>
						<li><a href="index.jsp?situacao=2">In�cio</a></li>
	       				<li><a href="index.jsp?item=19&situacao=2">Relat�rios</a></li><!-- Folha de Ponto, Contra-Cheque, Horas Extras -->
	       				<!-- mostra apenas relatorios dos funcion�rios-->
	       				<li><a href="index.jsp?item=10&situacao=2">Ponto</a></li>
	       				<li><a href="index.jsp?item=20&situacao=2">F�rias</a></li>
	       				<li><a href="logoff.jsp">Sair</a></li>
						</ul>
						<%
					}
			 		
				}
			break;
			};
		}
		%>
        </div>
        
        <!-- fim do menu de navega��o  -->
        <hr class="noscreen" />  
    
      </div>
      
<!-- In�cio do bloco central do sistema -->
<div id="main">

<!-- Conte�do do sistema -->
<% 
//Verificando se h� um item de menu ativo para redirecionar o conte�do central da p�gina
if (request.getParameter("item") != null) {
int item = Integer.parseInt(request.getParameter("item"));
switch(item)

{
case 0://inicio

//verificando a situacao para habilitar o login
	if (request.getParameter("situacao") != null ) {
		
		int situacao = Integer.parseInt(request.getParameter("situacao"));		
		if (situacao==0 || situacao==1) {
	%>
<%@ include file="login.jsp" %>
	
	<%
 }
 }else{
	 %>
<%@ include file="login.jsp" %>
		
		<%	 
 }
 
 %>
 
	<%@ include file="main.jsp" %>
	<%
break;
case 1://Op��es Pessoa F�sica
	%>
	<%@ include file="opcao_pessoafisica.jsp" %>
	<%
break;
case 2: //Op��es Pessoa Jur�dica
	%>
	<%@ include file="opcao_pessoajuridica.jsp" %>
	<%
break;
case 3: //Cadastrar Pessoa Pessoa F�sica
	%>
	<%@ include file="cadastro_pessoafisica.jsp" %>
	<%
break;
case 4: //Pesquisar/Alterar Pessoa Pessoa F�sica
	%>
	<%@ include file="pesquisa_pessoafisica.jsp" %>
	<%
break;
case 5: //Resultado Cadastro Pessoa Pessoa F�sica
	%>
	<%@ include file="resultado_pessoafisica.jsp" %>
	<%
break;
case 6: //Atualiza Pessoa Pessoa F�sica

break;
case 7: //Cadastra Pessoa Jur�dica
	%>
	<%@ include file="cadastro_pessoajuridica.jsp" %>
	<%
break;
case 8: //Pesquisa Pessoa Jur�dica
	%>
	<%@ include file="pesquisa_pessoajuridica.jsp" %>
	<%
break;
case 9: //Resultado Cadastro Pessoa Pessoa Juridica
	%>
	<%@ include file="resultado_pessoajuridica.jsp" %>
	<%
break;
case 10: //Resultado Cadastro Pessoa Pessoa Juridica

	%>
	<%@ include file="opcao_ponto.jsp" %>
	<%
break;
case 11: //Bater Ponto

	%>
	<%@ include file="cadastro_ponto.jsp" %>
	<%
break;
case 12: //Solicitar Folha de Ponto

	%>
	<%@ include file="solicitar_folha_ponto.jsp" %>
	<%
break;
case 13: //Exibir Folha de ponto

	%>
	<%@ include file="resultado_pontos.jsp" %>
	<%
break;
case 14: //Confirmacao do ponto cadastrado

	%>
	<%@ include file="confirmacao_ponto.jsp" %>
	<%
break;
case 15: //Solicitar o relat�rio de horas extras em um m�s

	%>
	<%@ include file="solicitar_hora_extra.jsp" %>
	<%
break;
case 16: //Visualizar hora extra

	%>
	<%@ include file="visualizar_hora_extra.jsp" %>
	<%
break;
case 17: //Solicitar o contra-cheque

	%>
	<%@ include file="solicitar_contra_cheque.jsp" %>
	<%
break;
case 18: //Visualizar o contra-cheque

	%>
	<%@ include file="resultado_contra_cheque.jsp" %>
	<%
break;
case 19: //Relat�rios para funcion�rio

	%>
	<%@ include file="relatorios_funcionario.jsp" %>
	<%
break;
case 20: //Op��o de f�rias

	%>
	<%@ include file="opcao_ferias.jsp" %>
	<%
break;
case 21: //Solicitar F�rias

	%>
	<%@ include file="pedir_ferias.jsp" %>
	<%
break;	
case 22: //Resultado Pedido

	%>
	<%@ include file="resultado_ferias.jsp" %>
	<%
break;	
case 23: //Relatorios de gerente

	%>
	<%@ include file="relatorios_gerente.jsp" %>
	<%
break;	
case 24: //Visualizar pedidos de f�rias
%>
<%@ include file="visualizar_pedidos_ferias.jsp" %>
<%
break;
case 25: //Verificar pedidos de f�rias
%>
<%@ include file="verificar_pedido.jsp" %>
<%
break;
case 26: //Verificar pedidos de f�rias
%>
<%@ include file="funcionarios_ferias.jsp" %>
<%
break;
case 27: //Verificar funcion�rio que ir�o tirar f�rias
%>
<%@ include file="funcionarios_tirar_ferias.jsp" %>
<%
break;
default:
%>
<%@ include file="main.jsp" %>
<%
};
} else {//Se n�o existir op��o de menu ativo abre o centro da p�gina - main b�sico
	//verificando a situacao para habilitar o formulario de login
		if (request.getParameter("situacao") != null ) {
			
			int situacao = Integer.parseInt(request.getParameter("situacao"));
			
			if (situacao==0 || situacao==1) {
		%>
		
<%@ include file="login.jsp" %>
		
		<%
	 }
	 }else{
		 %>
<%@ include file="login.jsp" %>
			
			<%	 
	 }
	 
	 %>
	<%@ include file="main.jsp" %>
	<%
};

%>
</div>
<!-- Final da Divis�o do bloco central do sistema -->

<!--In�cio da divis�o referente ao Rodap� -->
        <div id="footer">
        <div id="footer-inside">
        <p id="copyright">&copy; 2013 - <a href="index.jsp?item=0">GeRsON</a>
        </p>
        
               <p >Equipe de Trabalho  | GPP/MDS</p>
              <p align="center">
<%
						//Mostrando a data atual 
						int dia = Integer.parseInt((new SimpleDateFormat("dd")).format(new Date()));
				        int mes = Integer.parseInt((new SimpleDateFormat("M")).format(new Date()));
				        int ano = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));
				        switch (mes) {
				        case 1:
				        	out.println(dia + " de Janeiro de " + ano);
				        break;
				        case 2:
				        	out.println(dia + " de Fevereiro de " + ano);
				        break;
				        case 3:
					        out.println(dia + " de Mar�o de " + ano);
					    break;
				        case 4:
					        out.println(dia + " de Abril de " + ano);
					    break;
				        case 5:
					        out.println(dia + " de Maio de " + ano);
					    break;
				        case 6:
					        out.println(dia + " de Junho de " + ano);
					    break;
				        case 7:
					        out.println(dia + " de Julho de " + ano);
					    break;
				        case 8:
					        out.println(dia + " de Agosto de " + ano);
					    break;
				        case 9:
					        out.println(dia + " de Setembro de " + ano);
					    break;
				        case 10:
					        out.println(dia + " de Outubro de " + ano);
					    break;
				        case 11:
					        out.println(dia + " de Novembro de " + ano);
					    break;
				        case 12:
					        out.println(dia + " de Dezembro de " + ano);
					    break;					    
				        }
	
    %>
			</p>
        
        </div>
        <div style="clear: both;"> 
        </div>
        </div>
 <!-- Final da Divis�o referente ao Rodap� -->
        </div>
  </body>
</html>