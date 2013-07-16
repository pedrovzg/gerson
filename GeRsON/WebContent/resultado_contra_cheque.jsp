<%@page import="java.text.DecimalFormat"%>
<%@page import="controller.business.BusinessSalario"%>
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
BusinessSalario salario = (BusinessSalario)session.getAttribute("salario");
%>

<body>
	<div id="layout">
	<div id="main">
	
	<h3>Contra-Cheque - <%=pessoaFisica.getNome() %></h3>
	<p>Referencia: <%=request.getParameter("mes") %> de <%=request.getParameter("ano") %></p>
	<table>
	<tr>
	<td colspan="2">Empresa: Fields Comunica��o</td>
	</tr>
	
	<tr>
	<td>Funcion�rio: <%=pessoaFisica.getNome() %></td>
	<td>Matricula: <%=pessoaFisica.getMatricula() %></td>
	</tr>
	
	<tr>
	<td>RG: <%=pessoaFisica.getRG() %></td>
	<td>CPF: <%=pessoaFisica.getCPF_CNPJ() %></td>
	</tr>
	</table>
	
	<table>
	<tr>
	<td>Descri��o</td>
	<td>Valores</td>
	</tr>
	
	<%
	DecimalFormat form = new DecimalFormat("0.00");
	
	String salariHorasTrabalhadas = form.format(salario.getSalarioHorasTrabalhadas());
	String INSS = form.format(salario.getINSS());
	String impostoRenda = form.format(salario.getImpostoRenda());
	String outrosImpostos = form.format(salario.getOutrosImpostos());
	String planoSaude = form.format(salario.getPlanoSaude());
	String descontos = form.format(salario.getDescontos());
	String salarioLiquido = form.format(salario.getSalarioLiquido());
	double acrescimoHorasExtras = salario.getSalarioHorasTrabalhadas() - pessoaFisica.getSalario();
	
	if(acrescimoHorasExtras<0)
		acrescimoHorasExtras = 0;
	%>
	<tr>
	<td>Sal�rio Bruto: </td>
	<td>R$ <%=form.format(pessoaFisica.getSalario()) %>
	</td>
	</tr>
	<tr>
	<td>Sal�rio pelas horas trabalhadas: </td>
	<td>R$ <%=salariHorasTrabalhadas %>
	</td>
	</tr>
	
	<tr>
	<td>Acr�scimo horas extras: </td>
	<td>R$ <%=form.format(acrescimoHorasExtras) %>
	</td>
	</tr>
	
	<tr>
	<td>INSS: </td>
	<td>R$ <%=INSS %>
	</td>
	</tr>
	
	<tr>
	<td>Imposto de Renda: </td>
	<td>R$ <%=impostoRenda	%>
	</td>
	</tr>
	
	<tr>
	<td>Outros Impostos: </td>
	<td>R$ <%=outrosImpostos %>
	
	</td>
	</tr>
	
	<tr>
	<td>Plano de Sa�de: </td>
	<td>R$ <%=planoSaude %>
	</td>
	</tr>
	</table>
	
	<table>
	<tr>
	<td>Total Descontos: </td>
	<td>R$ <%=descontos %></td>
	</tr>
	 
	<tr>
	<td>Sal�rio L�quido: </td>
	<td>R$ <%=salarioLiquido %></td>
	</tr>
	</table>
	
	<br><br><br>
	</div>
	</div>
</body>
	<%
	}
	%>
</html>