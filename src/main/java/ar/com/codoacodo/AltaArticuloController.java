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

@WebServlet("/AltaArticuloController")
public class AltaArticuloController extends HttpServlet {

	private static final long serialVersionUID = -4975868919096448579L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request (req), es un objeto creado por Tomcat
        System.out.println("AltaArticuloController");

        String titulo = req.getParameter("nombre");
        String imagen = "img";
        double precio = Double.parseDouble(req.getParameter("precio"));
        String autor  = req.getParameter("autor");
        String codigo  = req.getParameter("codigo");
        LocalDateTime fechaCreacion = LocalDateTime.now();
        
        Articulo nuevo = new Articulo(titulo, imagen, autor, precio, false, codigo, fechaCreacion);
        
        //Interface nombre  = new ClaseQueImplementaLaIntarface();
        DAO dao = new MySQLDAOImpl();
        
        try {
            dao.create(nuevo);
            resp.sendRedirect(req.getContextPath() + "/ListadoArticuloController");
        } catch (Exception e) {
            getServletContext().getRequestDispatcher("/nuevo.jsp").forward(req, resp);
            e.printStackTrace();
        } 

    }
}