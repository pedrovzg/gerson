<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.business.BusinessFerias"%>
<%@page import="model.funcionarios.pf.PessoaFisica"%>
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
<link rel="stylesheet" type="text/css" href="css/formulario.css">


<title>GeRsON</title>
</head>
<body>
	<div id="layout">
		<div id="main">

				<h2>Funcion�rios de F�rias</h2>
				<h3>Dados para pesquisa</h3>
				<table>
					<tr>
						<td>Matr�cula</td>
						<td>Nome</td>
						<td>Cargo</td>
						<td>Area</td>
						<td>Data das F�rias</td>
					</tr>
						<%
						BusinessFerias ferias2 = new BusinessFerias();
						ferias2.buscarFuncionariosFerias();
						
						SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
						
						for(int i=0;i<ferias2.getFuncionariosFerias().length;i++){ 
						%>
							<tr>
							<td><%=ferias2.getFuncionariosFerias()[i].getMatricula() %></td>
							<td><%=ferias2.getFuncionariosFerias()[i].getNome() %></td>
							<td><%=ferias2.getFuncionariosFerias()[i].getCargo() %></td>
							<td><%=ferias2.getFuncionariosFerias()[i].getArea() %></td>
							<%
								String ultimasFerias ="";
								if(ferias2.getFuncionariosFerias()[i].getUltimasFerias() != null){
									ultimasFerias = formato.format(ferias2.getFuncionariosFerias()[i].getUltimasFerias());
								}
							%>
							<td><%=ultimasFerias%></td>
							</tr>
						<%} %>
						
				</table>
				<p>&nbsp;</p>
		</div>
	</div>
</body>
</html>
