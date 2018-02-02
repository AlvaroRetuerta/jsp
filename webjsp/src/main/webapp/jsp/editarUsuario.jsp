<%@page import="es.altair.dao.UsuarioDAOImplHibernate"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Vehiculo</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>
<body>
	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
				String id = request.getParameter("id");
				int aux = Integer.parseInt(id);
				Usuario u = uDAO.obtener(aux);
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido
						<%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%>
				</a></li>
				<li class="breadcrumb-item"><a href="principal.jsp">Pincipal
						Usuario</a></li>
				<li class="breadcrumb-item">Editar Libro</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar
						Sesión</a></li>
			</ol>
		</div>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../EditarUsuario" method="post" role="form"
						enctype="multipart/form-data">
						<h3>Editar Vehiculo</h3>
						<input type="hidden" name="idUser" id="idUser" value="<%=u.getIdUser()%>">
						<div class="form-group">
							<label for="nombre">Nombre</label> <input type="text"
								name="nombre" id="nombre" class="form-control"
								value="<%=u.getNombre()%>">
						</div>
						<div class="form-group">
							<label for="apellidos">Apellidos</label> <input type="text" name="apellidos"
								id="apellidos" class="form-control" value="<%=u.getApellidos()%>">
						</div>
						<div class="form-group">
							<label for="username">Username</label> <input type="text" name="username"
								id="username" class="form-control" value="<%=u.getUsername()%>">
						</div>
						<div class="form-group">
							<label for="email">Pais</label> <input type="email" name="email"
								id="email" class="form-control" value="<%=u.getEmail()%>">
						</div>
						
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary">
						</div>
					</form>
				</div>
			</div>
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