<%@page import="model.funcionarios.pf.PessoaFisica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<%
	if (session.getAttribute("funcionario") == null)
		response.sendRedirect("index.jsp?item=0");
	else {
		PessoaFisica pessoaFisica = (PessoaFisica) session.getAttribute("funcionario");
%>

<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="content-language" content="pt-br" />
<meta name="description" content="GeRsON - Ger�ncia de Recursos On-line" />
<meta name="keywords"
	content="cadastro de cliente, controle de almoxarifado" />
<link rel="stylesheet" type="text/css" href="css/formulario.css">

<title>GeRsON</title>
</head>
<body>

	<div id="layout">
		<div id="main">
			<!-- Itens associados a pessoa Pessoa fisica -->
			<h2>F�rias</h2>
			<p>&nbsp;</p>
		<%
			if(!pessoaFisica.getCargo().equals("Gerente")){
			
		%>
			<ul>
				<li><a href="index.jsp?item=21&situacao=2">Pedir F�rias</a></li>
				<li><a href="index.jsp?item=25&situacao=2">Verificar Pedido de F�rias</a></li>
			</ul>
		<%
			}
		%>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
		</div>
	</div>
</body>
<%
	}
%>
</html>