package es.altair.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.altair.bean.Alquiler;
import es.altair.bean.Usuario;
import es.altair.bean.Vehiculo;
import es.altair.dao.AlquilerDAO;
import es.altair.dao.AlquilerDAOImplHibernate;
import es.altair.dao.VehiculoDAO;
import es.altair.dao.VehiculoDAOImplHibernate;

/**
 * Servlet implementation class AlquilarVehiculo
 */
public class AlquilarVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlquilarVehiculo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//int id= Integer.parseInt(request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession sesion = request.getSession();
		VehiculoDAO vDAO = new VehiculoDAOImplHibernate();
		Vehiculo v = vDAO.obtener(id);
		AlquilerDAO aDAO = new AlquilerDAOImplHibernate();
		List<Alquiler> alquileres = aDAO.alquileresActuales();
		
		
		
		for (Alquiler a : alquileres) {
			
			if(a.getVehiculo().getId()==v.getId()) {
				response.sendRedirect("jsp/principal.jsp?mensaje=El vehiculo ya esta alquilado");
			}
			
		}
		Date currentDate = new Date();
		Calendar c = new GregorianCalendar();
		c.add(GregorianCalendar.DAY_OF_MONTH, 7);
        
		Alquiler a = new Alquiler(((Usuario)sesion.getAttribute("usuLogeado")), v, currentDate, c.getTime() );
        aDAO.save(a);
        response.sendRedirect("jsp/principal.jsp?mensaje=El alquiler expirará en una semana");
		
		
	}

}
