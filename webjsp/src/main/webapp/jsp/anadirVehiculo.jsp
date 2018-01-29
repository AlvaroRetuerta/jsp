<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>A�adir Vehiculo</title>
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
				
		%>

		<div class="row">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Bienvenido
						<%=((Usuario) session.getAttribute("usuLogeado")).getNombre()%>
				</a></li>
				<li class="breadcrumb-item"><a href="principalUsu.jsp">Pincipal
						Usuario</a></li>
				<li class="breadcrumb-item">A�adir Vehiculo</li>
				<li class="breadcrumb-item active"><a href="../CerrarSesion">Cerrar
						Sesi�n</a></li>
			</ol>
		</div>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../AnadirVehiculo"> <!-- enctype="multipart/form-data" -->
						<h3>Editar Vehiculo</h3>
						<div class="form-group">
							<label for="marca">Marca</label> <input type="text"
								name="marca" id="marca" class="form-control">
						</div>
						<div class="form-group">
							<label for="modelo">Modelo</label> <input type="text" name="modelo"
								id="modelo" class="form-control">
						</div>
						<div class="form-group">
							<label for="matricula">Matricula</label> <input type="text" name="matricula"
								id="matricula" class="form-control">
						</div>
						<div class="form-group">
							<label for="pais">Pais</label> <input type="text" name="pais"
								id="pais" class="form-control">
						</div>
						<div class="form-group">
							<label for="anyo">A�o</label> <input type="number" name="anyo"
								id="anyo" class="form-control">
						</div>
						<!-- <div class="form-group">
							<label for="imagen">Imagen</label> 
							<input type="file"
								class="form-control" id="imagen" name="imagen">
						</div>
 -->						<div class="form-group">
							<input type="submit" value="enviar" class="form-control btn btn-primary">
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