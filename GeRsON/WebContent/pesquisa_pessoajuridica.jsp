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
	<!-- Java Script utilizado para valida��o dos campos do formul�rio -->
	<script type="text/javascript">
		/*Campo CNPJ - permite somente valores numericos e monta a m�scara*/
		function mascaraCNPJ(e, campo) {

			var tecla = (window.event) ? event.keyCode : e.which;
			if ((tecla > 47 && tecla < 58)) {
				mascara(campo, '##.###.###/####-##');
				return true;
			} else {
				if (tecla != 8)
					return false;
				else
					return true;
			}
		}

		/*cria a mascara*/
		function mascara(src, mask) {
			var i = src.value.length;
			var saida = mask.substring(1, 2);
			var texto = mask.substring(i);
			if (texto.substring(0, 1) != saida) {
				src.value += texto.substring(0, 1);
			}
		}
	</script>
	<div id="layout">
		<div id="main">

			<form name="pesquisar_pessoafisica"
				action="ServletController" method="post" onsubmit="window.open('','pop_up','width=1000, height=800, resizeable=yes');" target="pop_up">
				<h2>Pesquisa Pessoa Jur�dica</h2>
				<h3>Dados para pesquisa</h3>
				<table>
					<tr>
						<td>Matr�cula: <input type="number" step="1" min="1"
							max="99999999" name="matricula" value="" size="20" maxlength="8" />
							�rea: <input type="text" name="area" value="" size="30"
							maxlength="40" />
						</td>
					</tr>
					<tr>
						<td>Empresa: <input type="text" name="empresa" value=""
							size="50" maxlength="50" /> CNPJ: <input type="text" name="cnpj"
							onkeypress="return mascaraCNPJ(event,this);return false;"
							value="" size="20" maxlength="18" />
						</td>
					</tr>
					<tr>
						<td>Responsavel: <input type="text" name="responsavel"
							value="" size="40" maxlength="50" />
						</td>
					</tr>
				</table>
				
				<input type="hidden" name="logica" value="BuscaPessoaJuridica"/>
				
				<input type="submit" value="Pesquisar">
				<h3><a href="javascript:window.history.go(-1)">Voltar para a p�gina anterior</a></h3>
				<p>&nbsp;</p>
			</form>
		</div>
	</div>
</body>
</html>
