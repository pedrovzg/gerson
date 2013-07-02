package teste;

import java.text.SimpleDateFormat;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.funcionarios.pf.PessoaFisica;

public class TesteHibernate {
	
//testar se hibernate esta mandando pro banco 
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("Banco");
		EntityManager em = factory.createEntityManager();
		
		PessoaFisica pessoa = em.find(PessoaFisica.class, 7);
		
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
		String dataFormatada = formatador.format(pessoa.getDataAdmissao());
		System.out.println(dataFormatada);
		
		System.out.println(pessoa.getNome());
		pessoa.setNome("Mudado");
		em.getTransaction().begin();
		em.persist(pessoa);
		em.getTransaction().commit();
		
		/*
		PessoaFisica p = new PessoaFisica();
		p.setMatricula("matricula");
		p.setArea("area1");
		p.setNome("nome1");
		p.setCPF_CNPJ("CPF_CNPJ1");
		p.setCargo("cargo1");
		
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		
		*/
		//Teste da listagem de todos os funcionários
		/*GerenteDAO dao = new GerenteDAO();
		
		for(int i=0;i<dao.getPessoasFisicas().length;i++){
			System.out.println(dao.getPessoasFisicas()[i].getNome());
		}*/
	}
}
