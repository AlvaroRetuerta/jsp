<%@page import="es.altair.bean.Vehiculo"%>
<%@page import="es.altair.dao.VehiculoDAOImplHibernate"%>
<%@page import="es.altair.dao.VehiculoDAO"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libros del Usuario</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>
<body>
	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n");
			} else {
				VehiculoDAO vDAO = new VehiculoDAOImplHibernate();
				List<Vehiculo> vehiculos =vDAO.listar((Usuario) session.getAttribute("usuLogeado"));
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido 
					<%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%>
					</a>
				</li>	
				<li class="breadcrumb-item">Pincipal Usuario</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar Sesi�n</a></li>		
			</ol>
		</div>

		<div class="row col-md-8 col-md-offset-2">
			<table class="table table-striped">
				<thead>
					<a href="anadirVehiculo.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b>
						A�adir Vehiculo</a>
					<tr>
						<th>T�tulo</th>
						<th>Autor</th>
						<th>ISBN</th>
						<th>Portada</th>
						<th></th>
					</tr>
				</thead>
				<%
					for (Vehiculo v : vehiculos) {
				%>
				<tr>
					<td><%=v.getMarca()%></td>
					<td><%=v.getModelo()%></td>
					<td><%=v.getA�o()%></td>
					<td><img alt="Portada"
						src="image.jsp?imag=<%=v.getId()%>" class="img-thumbnail"
						width="50" height="50"></td>
					<td>
						<button type="button" class="btn btn-default"
							onclick="location.href='editarLibro.jsp?uuid=<%=v.getId()%>'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrarLibro<%=v.getId()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						<div class="modal fade" id="borrarLibro<%=v.getId()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Vehiculo</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										�Desea borrar el
										<%=v.getModelo()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarLibro?uuid=<%=v.getId()%>'">S�</button>
									</div>
								</div>
							</div>
						</div>

					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>


		<%
			}
		%>



	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>