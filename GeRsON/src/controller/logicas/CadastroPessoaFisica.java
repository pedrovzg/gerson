package controller.logicas;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.funcionarios.pf.PessoaFisica;
import controller.interfaces.Logica;
import dao.CadastroDAO;
import dao.PesquisaDAO;

public class CadastroPessoaFisica implements Logica {

    public CadastroPessoaFisica() {
        
    }

	public void executa(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		//Testar se não está tentando cadastrar uma matrícula já existente
		String testeMatricula = request.getParameter("matricula");
		PesquisaDAO pesquisa = new PesquisaDAO();
		List<PessoaFisica> pessoas = pesquisa.buscarTodasPessoasFisicas();
		
		for (PessoaFisica pessoa : pessoas) {
			if(pessoa.getMatricula().equalsIgnoreCase(testeMatricula)) {
				String erroMatricula = "Já existe um funcionário com essa matrícula";
				request.getSession().setAttribute("erroMatricula", erroMatricula);
				RequestDispatcher dispache = request.getRequestDispatcher("/index.jsp?item=3&situacao=2");
				dispache.forward(request, response);
				return;
			}
		}
		
		PessoaFisica pessoaFisica = new PessoaFisica();

		//Recebendo os dados da �rea e validando se o campo est� fazio
		String area = request.getParameter("area");
		if ((area == null) || (area.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setArea(request.getParameter("area"));
		}
		
		//Recebendo os dados da matrícula e validando se o campo está fazio
		String matricula = request.getParameter("matricula");
		if ((matricula == null) || (matricula.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setMatricula(request.getParameter("matricula"));
		}
		
		String dataAdmissaoTexto = request.getParameter("dataAdmissao");
		Date dataAdmissao;
		//validando a data de Admiss�o
		try {
			dataAdmissao = new SimpleDateFormat("dd/MM/yyyy").parse(dataAdmissaoTexto);
			pessoaFisica.setDataAdmissao(dataAdmissao);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String dataDesligamentoTexto = request.getParameter("dataDesligamento");
		Date dataDesligamento;
		try {
			dataDesligamento = new SimpleDateFormat("dd/MM/yyyy").parse(dataDesligamentoTexto);
			pessoaFisica.setDataDesligamento(dataDesligamento);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		pessoaFisica.setStatus_2(Boolean.parseBoolean(request.getParameter("status_2")));
		
		//Recebendo os dados de salario e validando se o campo está fazio
		String salario = request.getParameter("salario");
		if ((salario == null) || (salario.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setSalario(Double.parseDouble(request.getParameter("salario")));
		}
		
		pessoaFisica.setEnderecoFuncional(request.getParameter("enderecoFuncional"));	
		pessoaFisica.setTelefoneComercial(request.getParameter("telefoneComercial"));
		pessoaFisica.setTipoFuncionario("Pessoa F�sica");
		
		//Recebendo os dados no nome e validando se o campo est� preenchido
		String nome = request.getParameter("nome");
		if ((nome == null) || (nome.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setNome(request.getParameter("nome"));	
		}
		
		//Recebendo os dados de CPF e validando se o campo está fazio
		String CPF_CNPJ = request.getParameter("CPF_CNPJ");
		if ((CPF_CNPJ == null) || (CPF_CNPJ.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCPF_CNPJ(request.getParameter("CPF_CNPJ"));
		}
		
		//Recebendo os dados de email e validando se o campo está fazio
		String email = request.getParameter("email");
		if ((email == null) || (email.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setEmail(request.getParameter("email"));
		}
		
		//Recebendo os dados de senha e validando se o campo está fazio
		String senha = request.getParameter("senha");
		if ((senha == null) || (senha.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setSenha(request.getParameter("senha"));
		}
		
		pessoaFisica.setCEPFuncional(request.getParameter("CEPFuncional"));
		pessoaFisica.setCidadeFuncional(request.getParameter("cidadeFuncional"));
		pessoaFisica.setUFCidadeFuncional(request.getParameter("UFCidadeFuncional"));
		
		//Recebendo os dados do cargo e validando se o campo est� preenchido
		String cargo = request.getParameter("cargo");
		if ((cargo == null) || (cargo.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCargo(request.getParameter("cargo"));	
		}
		
		pessoaFisica.setTotalHoraSemanal(Integer.parseInt(request.getParameter("totalHoraSemanal")));
		
		//Recebendo os dados de RG e validando se o campo está preenchido
		String RG = request.getParameter("RG");
		if ((RG == null) || (RG.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setRG(request.getParameter("RG"));	
		}
		
		//Recebendo os dados do �rg�o emissor e validando se o campo est� preenchido
		String orgaoEmissor = request.getParameter("orgaoEmissor");
		if ((orgaoEmissor == null) || (orgaoEmissor.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setOrgaoEmissor(request.getParameter("orgaoEmissor"));	
		}
		//validando data de expedi��o
		String dataExpedicaoTexto = request.getParameter("dataExpedicao");
		Date dataExpedicao;
		try{
			dataExpedicao = new SimpleDateFormat("dd/MM/yyyy").parse(dataExpedicaoTexto);
			pessoaFisica.setDataExpedicao(dataExpedicao);
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		//Recebendo os dados de CTPS e validando se o campo está preenchido
		String CTPS = request.getParameter("CTPS");
		if ((CTPS == null) || (CTPS.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCTPS(request.getParameter("CTPS"));	
		}
		
		pessoaFisica.setPIS(request.getParameter("PIS"));
		
		//Validando data de Nascimento
		String dataNascimentoTexto = request.getParameter("dataNascimento");
		Date dataNascimento;
		try{
			dataNascimento = new SimpleDateFormat("dd/MM/yyyy").parse(dataNascimentoTexto);
			pessoaFisica.setDataNascimento(dataNascimento);
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		pessoaFisica.setTelefoneCelular(request.getParameter("telefoneCelular"));
		pessoaFisica.setTelefoneResidencial(request.getParameter("telefoneResidencial"));
		
		//Recebendo os dados do estado civil e validando se o campo est� preenchido
		String estadoCivil = request.getParameter("estadoCivil");
		if ((estadoCivil == null) || (estadoCivil.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setEstadoCivil(request.getParameter("estadoCivil"));
		}
		
		//Recebendo os dados da nacionalidade e verificando se o campo foi preenchido
		String nacionalidade = request.getParameter("nacionalidade");
		if ((nacionalidade == null) || (nacionalidade.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setNacionalidade(request.getParameter("nacionalidade"));
		}
		
		//Recebendo os dados da naturalidade e verificando se o campo foi preenchido
		String naturalidade = request.getParameter("naturalidade");
		if ((naturalidade == null) || (naturalidade.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setNaturalidade(request.getParameter("naturalidade"));
		}
		
		//Recebendo os dados da altura e verificando se o campo foi preenchido
		String altura = request.getParameter("altura");
		if ((altura == null) || (altura.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setAltura(Double.parseDouble(request.getParameter("altura")));
		}
		
		//Recebendo os dados do peso e verificando se o campo foi preenchido
		String peso = request.getParameter("peso");
		if ((peso == null) || (peso.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setPeso(Double.parseDouble(request.getParameter("peso")));
		}
		
		//Recebendo os dados da cor do cabelo e verificando se o campo foi preenchido
		String corCabelo = request.getParameter("corCabelo");
		if ((corCabelo == null) || (corCabelo.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCorCabelo(request.getParameter("corCabelo"));
		}			
		//Recebendo os dados da cor dos olhos e verificando se o campo foi preenchido
		String corOlhos = request.getParameter("corOlhos");
		if ((corOlhos == null) || (corOlhos.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCorOlhos(request.getParameter("corOlhos"));
		}		
		//Recebendo os dados da raça e verificando se o campo foi preenchido
		String racaCor = request.getParameter("racaCor");
		if ((racaCor == null) || (racaCor.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setRacaCor(request.getParameter("racaCor"));
		}		
		
		pessoaFisica.setDeficienteFisico(Boolean.parseBoolean(request.getParameter("deficienteFisico")));
		pessoaFisica.setSinaisParticulares(request.getParameter("sinaisParticulares"));
		pessoaFisica.setNomeMae(request.getParameter("nomeMae"));
		pessoaFisica.setNomePai(request.getParameter("nomePai"));
		pessoaFisica.setNacionalidadeMae(request.getParameter("nacionalidadeMae"));
		pessoaFisica.setNacionalidadePai(request.getParameter("nacionalidadePai"));
		
		//Recebendo os dados da serie da CTPS e verificando se o campo foi preenchido
		String serieCTPS = request.getParameter("serieCTPS");
		if ((serieCTPS == null) || (serieCTPS.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setSerieCTPS(request.getParameter("serieCTPS"));
		}
		
		//validando data de emissao da CTPS
		String emissaoCTPSTexto= request.getParameter("emissaoCTPS");
		Date emissaoCTPS;
		try{
			emissaoCTPS = new SimpleDateFormat("dd/MM/yyyy").parse(emissaoCTPSTexto);
			pessoaFisica.setEmissaoCTPS(emissaoCTPS);
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		pessoaFisica.setUFCTPS(request.getParameter("UFCTPS"));
		
		//Recebendo os dados do titulo eleitoral e verificando se o campo foi preenchido
		String tituloEleitoral = request.getParameter("tituloEleitoral");
		if ((tituloEleitoral == null) || (tituloEleitoral.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setTituloEleitoral(request.getParameter("tituloEleitoral"));
		}
		
		//Recebendo os dados da zona do titulo eleitoral e verificando se o campo foi preenchido
		String zonaTitulo = request.getParameter("zonaTitulo");
		if ((zonaTitulo == null) || (zonaTitulo.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setZonaTitulo(request.getParameter("zonaTitulo"));
		}

		//Recebendo os dados da seção do titulo eleitoral e verificando se o campo foi preenchido
		String secaoTitulo = request.getParameter("secaoTitulo");
		if ((secaoTitulo == null) || (secaoTitulo.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setSecaoTitulo(request.getParameter("secaoTitulo"));
		}
		
		pessoaFisica.setCNH(request.getParameter("CNH"));
		pessoaFisica.setReservista(request.getParameter("reservista"));
		
		//Recebendo os dados do grau de instrução e verificando se o campo foi preenchido
		String grauInstrucao = request.getParameter("grauInstrucao");
		if ((grauInstrucao == null) || (grauInstrucao.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setGrauInstrucao(request.getParameter("grauInstrucao"));
		}
		
		pessoaFisica.setNomeConjuge(request.getParameter("nomeConjuge"));
		pessoaFisica.setNacionalidadeConjuge(request.getParameter("nacionalidadeConjuge"));
		//dependentes - o recebimento dos dados dos dependentes está funcionando, porém o envio para o banco não
		/*String[] nomeDependentes = request.getParameterValues("nomeDependente[]");
		String[] parentescos = request.getParameterValues("parentesco[]");
		for(int i = 0; i<nomeDependentes.length; i++)
		{
			pessoaFisica.criarDependentes();
			pessoaFisica.getDependentes()[i].setNomeDependente(nomeDependentes[i]);
			pessoaFisica.getDependentes()[i].setParentesco(parentescos[i]);
			
			String dataNascimentoDependenteTexto= request.getParameterValues("dataNascimentoDependente[]")[i];
			Date dataNascimentoDependente;
			try{
				dataNascimentoDependente = new SimpleDateFormat("dd/MM/yyyy").parse(dataNascimentoDependenteTexto);
				pessoaFisica.getDependentes()[i].setDataNascimentoDependente(dataNascimentoDependente);
			} catch(ParseException e) {
				e.printStackTrace();
			}
			
			pessoaFisica.getDependentes()[i].setIRRF(Boolean.parseBoolean(request.getParameterValues("IRRF[]")[i]));
			pessoaFisica.getDependentes()[i].setSalarioFamilia(Boolean.parseBoolean(request.getParameterValues("salarioFamilia[]")[i]));
			
		}
		for(int i=0; i<nomeDependentes.length; i++)
		{
			System.out.println(pessoaFisica.getDependentes()[i].getNomeDependente() + 
					" " + pessoaFisica.getDependentes()[i].getParentesco() +
					" " + pessoaFisica.getDependentes()[i].getDataNascimentoDependente() +
					" " + pessoaFisica.getDependentes()[i].isIRRF() +
					" "+pessoaFisica.getDependentes()[i].isSalarioFamilia());
		}*/
		//Recebendo os dados do hor�rio de trabalho e verificando se o campo foi preenchido
		String horarioTrabalho = request.getParameter("horarioTrabalho");
		if ((horarioTrabalho == null) || (horarioTrabalho.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setHorarioTrabalho(request.getParameter("horarioTrabalho"));
		}
		//Recebendo os dados do endere�o residencial e verificando se o campo foi preenchido
		String enderecoResidencial = request.getParameter("enderecoResidencial");
		if ((enderecoResidencial == null) || (enderecoResidencial.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setEnderecoResidencial(request.getParameter("enderecoResidencial"));
		}
		//Recebendo os dados da cidade residencial e verificando se o campo foi preenchido
		String cidadeResidencial = request.getParameter("cidadeResidencial");
		if ((cidadeResidencial == null) || (cidadeResidencial.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCidadeResidencial(request.getParameter("cidadeResidencial"));
		}		
		
		//Recebendo os dados da cidade residencial e verificando se o campo foi preenchido
		String UFResidencial = request.getParameter("UFResidencial");
		if ((UFResidencial == null) || (UFResidencial.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setUFResidencial(request.getParameter("UFResidencial"));
		}	
		
		//Recebendo os dados do CEP residencial e verificando se o campo foi preenchido
		String CEPResidencial = request.getParameter("CEPResidencial");
		if ((CEPResidencial == null) || (CEPResidencial.equals(""))){
			throw new RuntimeException();
		}else{
			pessoaFisica.setCEPResidencial(request.getParameter("CEPResidencial"));
		}
		
		CadastroDAO cadastro = new CadastroDAO();
		cadastro.cadastrarPessoaFisica(pessoaFisica);
		
		request.setAttribute("pessoaFisica", pessoaFisica);
		RequestDispatcher dispache = request.getRequestDispatcher("/index.jsp?item=5&situacao=2");
		dispache.forward(request, response);
	}

}