package ar.com.codoacodo;

import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo.dao.impl.MySQLDAOImpl;
import ar.com.codoacodo.oop.Articulo;

@WebServlet("/EditarController")
public class EditarController extends HttpServlet {

	private static final long serialVersionUID = 8152267149645204712L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        DAO dao = new MySQLDAOImpl();

        try {
        	
            Articulo producto = dao.getById(Long.parseLong(id));
            req.setAttribute("producto",producto);
            
        } catch (Exception e) {
            req.setAttribute("error", "No se puede editar el articulo en este momento.");
            getServletContext().getRequestDispatcher("/ListadoArticuloController").forward(req, resp);
        }
        getServletContext().getRequestDispatcher("/editar.jsp").forward(req, resp);
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String id = req.getParameter("id");
        String titulo = req.getParameter("nombre");
        String imagen = "img";
        double precio = Double.parseDouble(req.getParameter("precio"));
        String autor  = req.getParameter("autor");
        String codigo  = req.getParameter("codigo");
        LocalDateTime fechaCreacion = LocalDateTime.now();

        Articulo nuevo = new Articulo(Long.parseLong(id), titulo, imagen, autor, precio, false, codigo, fechaCreacion);
        
        DAO dao = new MySQLDAOImpl();
        
        try {
            dao.update(nuevo);
            resp.sendRedirect(req.getContextPath() + "/ListadoArticuloController");
        } catch (Exception e) {
            getServletContext().getRequestDispatcher("/editar.jsp").forward(req, resp);
            e.printStackTrace();
        }
    }
    
}
