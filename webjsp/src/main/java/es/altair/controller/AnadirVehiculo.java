package es.altair.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import es.altair.bean.Vehiculo;
import es.altair.dao.VehiculoDAO;
import es.altair.dao.VehiculoDAOImplHibernate;

/**
 * Servlet implementation class AnadirVehiculo
 */
//@MultipartConfig
public class AnadirVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirVehiculo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matricula =request.getParameter("matricula");
		String marca=request.getParameter("marca");
		String modelo=request.getParameter("modelo");
		String pais=request.getParameter("pais");
		int anyo=Integer.parseInt(request.getParameter("anyo"));
		
//		//tratamiento de la imagen
//		Part filePart = request.getPart("imagen");
//		
//		InputStream inputS = null;
//		ByteArrayOutputStream os=null;
//		if(!getFileName(filePart).equals("")) {
//			inputS = filePart.getInputStream();
//			
//			//escalar imagen
//			BufferedImage imageBuffer = ImageIO.read(inputS);
//			Image tmp = imageBuffer.getScaledInstance(640, 640, BufferedImage.SCALE_FAST);
//			BufferedImage buffered = new BufferedImage(640, 640, BufferedImage.TYPE_INT_RGB);
//			buffered.getGraphics().drawImage(tmp, 0, 0, null);
//			
//			os=new ByteArrayOutputStream();
//			ImageIO.write(buffered, "jpg", os);
//		}
		HttpSession sesion = request.getSession();
		
		VehiculoDAO vDAO = new VehiculoDAOImplHibernate();

		Vehiculo v = new Vehiculo(matricula, marca, modelo, anyo, pais);
		
		vDAO.insertar(v);
		
		
		response.sendRedirect("jsp/principal");
	}

//	private String getFileName(Part filePart) {
//		for (String content : filePart.getHeader("content-disposition").split(";")) {
//			if(content.trim().startsWith("filename")) {
//				return content.substring(content.indexOf("=")+1).trim().replace("\"","");
//			}
//		}
//		return null;
//	}

}
