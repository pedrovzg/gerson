package controller.business;

import java.util.List;

import dao.PesquisaDAO;
import model.funcionarios.pf.PessoaFisica;
import model.funcionarios.pj.PessoaJuridica;

public class BusinessController {
	private List<PessoaFisica> listaPessoasFisicas;
	private PessoaFisica[] pessoasFisicas = {};
	private PessoaJuridica[] pessoasJuridicas = {};
	private String cargo;

	public BusinessController() {

	}

	public String getCargo() {
		return cargo;
	}

	public PessoaFisica[] getPessoasFisicas() {
		return pessoasFisicas;
	}

	public void setPessoasFisicas(PesquisaDAO pesquisa) {
		this.pessoasFisicas = pesquisa.getPessoasFisicas();
	}

	public PessoaJuridica[] getPessoasJuridicas() {
		return pessoasJuridicas;
	}

	public void setPessoasJuridicas(PesquisaDAO pesquisa) {
		this.pessoasJuridicas = pesquisa.getPessoasJuridicas();
	}

	// Método para pegar o id de uma pessoa física
	public PessoaFisica idPessoaFisica(int id) {
		PesquisaDAO pesquisa = new PesquisaDAO();
		return pesquisa.getIdPessoaFisica(id);
	}

	// Método para pegar o id de uma pessoa jurídica
	public PessoaJuridica idPessoaJuridica(int id) {
		PesquisaDAO pesquisa = new PesquisaDAO();
		return pesquisa.getIdpessoaJuridica(id);
	}
	
	//Método para verificar se o login está correto
	public int verificarLogin(String matricula, String senha) {
		PesquisaDAO pesquisa = new PesquisaDAO();
		listaPessoasFisicas = pesquisa.buscarTodasPessoasFisicas();

		for (PessoaFisica pessoa : listaPessoasFisicas) {
			if(pessoa.getMatricula().equals(matricula) && pessoa.getSenha().equals(senha)){
				this.cargo = pessoa.getCargo();
				return 0;
			}
			else if(pessoa.getMatricula().equals(matricula)){
				return -1;
			}	
		}
		return -2;
	}
}
