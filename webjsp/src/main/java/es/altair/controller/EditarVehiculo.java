package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.VehiculoDAO;
import es.altair.dao.VehiculoDAOImplHibernate;

/**
 * Servlet implementation class EditarVehiculo
 */
@MultipartConfig
public class EditarVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarVehiculo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String marca=request.getParameter("marca");
		String modelo=request.getParameter("modelo");
		String matricula = request.getParameter("matricula");
		int anyo = Integer.parseInt(request.getParameter("anyo"));
		VehiculoDAO vDAO = new VehiculoDAOImplHibernate();
		vDAO.editar( id,  marca,  modelo,  matricula,  anyo);
		
		response.sendRedirect("jsp/principal.jsp");
		
		
		
	}

}
