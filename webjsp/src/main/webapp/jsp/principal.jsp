<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.dao.UsuarioDAOImplHibernate"%>
<%@page import="java.util.ArrayList"%><%@page import="es.altair.bean.Vehiculo"%><%@page import="es.altair.dao.VehiculoDAOImplHibernate"%><%@page import="es.altair.dao.VehiculoDAO"%><%@page import="java.util.List"%><%@page import="es.altair.bean.Usuario"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Principal</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
<link rel="stylesheet" href="../principalcss.css">
</head>
<body>
	<div class="container">
<div class="widget stacked widget-table action-table">
		<%
			boolean admin=false;
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				VehiculoDAO vDAO = new VehiculoDAOImplHibernate();
				List<Vehiculo> vehiculos = new ArrayList<Vehiculo>();
				
				if(((Usuario)session.getAttribute("usuLogeado")).getTipo() == 1){
				vehiculos = vDAO.listarTodos();
				admin=true;
				}
				else{
				vehiculos = vDAO.listarDisponibles();}
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido 
					<%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%>
					</a>
				</li>	
				<li class="breadcrumb-item">Pincipal Usuario</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar Sesión</a></li>		
			</ol>
		</div>

		<div class="row ">
			<table class="table table-striped table-bordered col-12">
				<thead>
					
					<tr>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Año</th>
						<th>Matricula</th>
						<th></th>
					</tr>
				</thead>
				<%
					for (Vehiculo v : vehiculos) {
				%>
				<tr>
					<td><%=v.getMarca()%></td>
					<td><%=v.getModelo()%></td>
					<td><%=v.getAnyo()%></td>
					<td><%=v.getMatricula() %></td>
					<td class="td-actions">
					<% if(((Usuario)session.getAttribute("usuLogeado")).getTipo() == 1){ %>
						<button type="button" class="btn btn-default"
							onclick="location.href='editarVehiculo.jsp?id=<%=v.getId()%>'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrar<%=v.getId()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						<div class="modal fade" id="borrar<%=v.getId()%>"
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
										¿Desea borrar el
										<%=v.getMarca() %> <%=v.getModelo()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarVehiculo?id=<%=v.getId()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>
						<%}
					else{%>
					<button type="button" class="btn btn-default"
							onclick="location.href='../AlquilarVehiculo?id=<%=v.getId()%>'">
							<i class="fas fa-check" aria-hidden="true"></i>
							Alquilar
						</button>
					<%} %>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>


		<%
			}
		if(admin){
		%>
<a href="anadirVehiculo.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b>
						Añadir Vehiculo</a>
						
						<% 
						UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
						List<Usuario> usuarios =  uDAO.listarTodos();%>
						
						
						<div class="row ">
			<table class="table table-striped table-bordered col-12">
				<thead>
					
					<tr>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Email</th>
						<th></th>
					</tr>
				</thead>
				<%
					for (Usuario u : usuarios) {
				%>
				<tr>
					<td><%=u.getNombre()%></td>
					<td><%=u.getApellidos()%></td>
					<td><%=u.getEmail()%></td>
					<td class="td-actions">
					<% if(((Usuario)session.getAttribute("usuLogeado")).getTipo() == 1){ %>
						<button type="button" class="btn btn-default"
							onclick="location.href='editarUsuario.jsp?id=<%=u.getIdUser()%>'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrar<%=u.getIdUser()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						<div class="modal fade" id="borrar<%=u.getIdUser()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Usuario</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar el
										<%=u.getNombre() %> <%=u.getApellidos()%> ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarUsuario?id=<%=u.getIdUser()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>
						<%} %>
					
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
						
						
						
						
						
						
						
						
						
						
						<%} %>
</div>

	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>