<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date, java.text.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="model.funcionarios.pf.PessoaFisica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<%
	if(session.getAttribute("funcionario") == null)
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
<body onload="BuscarHora()">
<!-- Script para montar o relogio dinamico e mostrar -->
<script type="text/javascript">
function BuscarHora() 
{
	Data = new Date;
	HoraCompleta = showFilled(Data.getHours()) + ":" + showFilled(Data.getMinutes()) + ":" + showFilled(Data.getSeconds());
	document.getElementById("relogio").innerHTML = HoraCompleta;
	setTimeout("BuscarHora()",1000);
}
function showFilled(Value) 
{
	return (Value > 9) ? "" + Value : "0" + Value;
}
</script>

	<div id="layout">
		<div id="main">

			<form name="cadastrar_ponto"
				action="ServletController" method="post">
				<h2>Folha de Ponto - <%=pessoaFisica.getNome() %> </h2>
				
				<table>
					<tr>
						<td> 
						<%
						//Mostrando a data atual 
						int dia = Integer.parseInt((new SimpleDateFormat("dd")).format(new Date()));
				        int mes = Integer.parseInt((new SimpleDateFormat("M")).format(new Date()));
				        int ano = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));
				        switch (mes) {
				        case 1:
				        	out.println("Data: " + dia + " de Janeiro de " + ano);
				        break;
				        case 2:
				        	out.println("Data: " + dia + " de Fevereiro de " + ano);
				        break;
				        case 3:
					        out.println("Data: " + dia + " de Mar�o de " + ano);
					    break;
				        case 4:
					        out.println("Data: " + dia + " de Abril de " + ano);
					    break;
				        case 5:
					        out.println("Data: " + dia + " de Maio de " + ano);
					    break;
				        case 6:
					        out.println("Data: " + dia + " de Junho de " + ano);
					    break;
				        case 7:
					        out.println("Data: " + dia + " de Julho de " + ano);
					    break;
				        case 8:
					        out.println("Data: " + dia + " de Agosto de " + ano);
					    break;
				        case 9:
					        out.println("Data: " + dia + " de Setembro de " + ano);
					    break;
				        case 10:
					        out.println("Data: " + dia + " de Outubro de " + ano);
					    break;
				        case 11:
					        out.println("Data: " + dia + " de Novembro de " + ano);
					    break;
				        case 12:
					        out.println("Data: " + dia + " de Dezembro de " + ano);
					    break;					    
				        }
	
    %>
    <!-- Mostrando a hora/minuto/segundo din�mico -->
     - <b><font id="relogio" size="2" face="Trebuchet MS, Verdana, Arial, sans-serif" color="red"></font></b>

						</td>
					</tr>
					<tr>
					<%
					if(pessoaFisica.getTotalHoraSemanal()==40) {
					%>
						<td> Op��o: <select name="opcao">
								
								<option value="Entrada">Entrada</option>
								<option value="In�cio Almo�o">In�cio Almo�o</option>
								<option value="Fim Almo�o">Fim Almo�o</option>
								<option value="Saida">Sa�da</option>
						</select>
						<br>
						<br>
						</td>
					<%
					}
					else {
					%>
						<td> Op��o: <select name="opcao">
								
								<option value="Entrada">Entrada</option>
								<option value="Saida">Sa�da</option>
						</select>
						<br>
						<br>
						</td>
					<% 
					}
					%>
					</tr>

				</table>
				<input type="hidden" name="logica" value="CadastroPonto"/>
				<input type="submit" value="Bater Ponto" />
				<hr>
				
			</form>
		</div>
	</div>
</body>
	<%
	}
	%>
</html>
