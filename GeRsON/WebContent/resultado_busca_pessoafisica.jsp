<%@page import="model.funcionarios.pf.PessoaFisica"%>
<%@page import="controller.business.BusinessController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<%
	if(session.getAttribute("funcionario") == null)
		response.sendRedirect("index.jsp?item=0");
	else{
		
	
		PessoaFisica pessoaFisica = (PessoaFisica) session.getAttribute("funcionario");
		
		if(!pessoaFisica.getCargo().equalsIgnoreCase("gerente")){
			response.sendRedirect("index.jsp?situacao=2");
		}
	}
	%>
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="content-language" content="pt-br" />
<meta name="description" content="GeRsON - Ger�ncia de Recursos On-line" />
<meta name="keywords"
	content="cadastro de cliente, controle de almoxarifado" />
<link rel="stylesheet" type="text/css" href="css/screen.css">

<title>GeRsON</title>

<!-- Pegando o par�metro da servlet -->
<%
BusinessController business = (BusinessController)session.getAttribute("pesquisa");
%>

<body>
	<div id="layout">
		<div id="header">
			<h1 id="logo">
				<a href="#" title="#">GeRs<span>ON</span></a>
			</h1>
			<hr class="noscreen" />
			<div id="navigation"></div>
			<hr class="noscreen" />
		</div>
	</div>
	<div id="main">
	
	<h3>Resultado da Pesquisa - Funcion�rio: Pessoa F�sica </h3>
	
	<table>
	<tr>
	<td>Matricula</td>
	<td>Nome</td>
	<td>Cargo</td>
	<td>Editar</td>
	</tr>
	<%
	for(int i=0;i<business.getPessoasFisicas().length;i++){ 
	%>
		<tr>
		<td><%=business.getPessoasFisicas()[i].getMatricula() %></td>
		<td><%=business.getPessoasFisicas()[i].getNome() %></td>
		<td><%=business.getPessoasFisicas()[i].getCargo() %></td>
		<td><a href="atualiza_pessoafisica.jsp?id=<%=business.getPessoasFisicas()[i].getId() %>">Dados</a>
		<%
		if(!business.getPessoasFisicas()[i].getCargo().equalsIgnoreCase("Gerente")) {
		%>
			/ <a href="solicitar_folha_ponto_gerente.jsp?id=<%=business.getPessoasFisicas()[i].getId() %>">Pontos</a>
		<%} %>
		</td>
		</tr>
	<%} %>
	</table>
	<p>&nbsp;</p><input type='button' value='Fechar Janela' onclick='window.close() ' />
	</div>
</body>
</html>