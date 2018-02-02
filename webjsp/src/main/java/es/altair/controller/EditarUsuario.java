package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImplHibernate;
import es.altair.dao.VehiculoDAO;
import es.altair.dao.VehiculoDAOImplHibernate;

/**
 * Servlet implementation class EditarUsuario
 */
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuario() {
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
		int id = Integer.parseInt(request.getParameter("idUser"));
		String nombre=request.getParameter("nombre");
		String apellidos=request.getParameter("apellidos");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
		Usuario u = uDAO.obtener(id);
		u.setApellidos(apellidos);
		u.setNombre(nombre);
		u.setEmail(email);
		u.setUsername(username);
		uDAO.actualizar(u);
		
		response.sendRedirect("jsp/principal.jsp");
	}

}
