package ar.com.codoacodo;

import java.io.IOException;
import java.util.ArrayList;

import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo.dao.impl.MySQLDAOImpl;
import ar.com.codoacodo.oop.Articulo;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuscadorController extends HttpServlet {
    
	private static final long serialVersionUID = -511826567687793337L;

	protected void dopost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String clave = req.getParameter("clave");
        DAO dao = new MySQLDAOImpl();

        try {
        	
            ArrayList<Articulo> listado = dao.findAllByTitle(clave);
            req.setAttribute("listado",listado);
            
        } catch (Exception e) {
            req.setAttribute("listado",new ArrayList());
        }
        getServletContext().getRequestDispatcher("listado.jsp").forward(req, resp);
    }
}