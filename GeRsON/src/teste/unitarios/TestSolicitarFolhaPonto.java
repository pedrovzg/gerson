package teste.unitarios;

import static org.easymock.EasyMock.createMock;
import static org.easymock.EasyMock.createNiceMock;
import static org.easymock.EasyMock.expect;
import static org.easymock.EasyMock.replay;
import static org.easymock.EasyMock.verify;
import static org.junit.Assert.assertNotNull;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Before;
import org.junit.Test;

import controller.logicas.SolicitarFolhaPonto;

public class TestSolicitarFolhaPonto {
	SolicitarFolhaPonto folha = new SolicitarFolhaPonto();
	
	@Before
	public void testSolicitarFolhaPonto() {
		assertNotNull(folha);
	}

	@Test
	public void testExecuta() throws Exception {
		HttpServletRequest requestMock = requestMock();  
        folha.executa(requestMock, responseMock());  
        verify(requestMock);
	}
	private HttpServletRequest requestMock() {  
        HttpServletRequest requestMock = createMock(HttpServletRequest.class);  
        expect(requestMock.getParameter("ano")).andReturn("2013");  
        expect(requestMock.getParameter("mes")).andReturn("7");  
        expect(requestMock.getRequestDispatcher("/index.jsp?item=13&situacao=2")).  
            andReturn(requestDispatcher());  
        replay(requestMock);  
        return requestMock;  
    }
  
    private RequestDispatcher requestDispatcher() {  
        RequestDispatcher dispatcherMock = createNiceMock(RequestDispatcher.class);  
        replay(dispatcherMock);  
        return dispatcherMock;  
    }  
  
    private HttpServletResponse responseMock() throws Exception {  
        HttpServletResponse responseMock = createMock(HttpServletResponse.class);  
        replay(responseMock);  
        return responseMock;  
    }

}
