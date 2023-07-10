<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo.oop.Articulo" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Articulos</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
     <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
	 	<div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp">Home</a>
		    <div class="collapse navbar-collapse" id="navbarColor02">
		    	<ul class="navbar-nav me-auto">
			        <li class="nav-item">
			        	<a class="nav-link" aria-current="page" href="nuevo.jsp">Nuevo</a>
			        </li>
			        <li class="nav-item">
			        	<a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/ListadoArticuloController">Listado</a>
			        </li>
		    	</ul>
		      <form class="d-flex">
		        <input class="form-control me-sm-2" type="search" placeholder="Search">
		        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Buscar</button>
		      </form>
		    </div>
	 	</div>
     </nav>
    <% 
     /*codigo java*/
     ArrayList<Articulo> listado = (ArrayList<Articulo>)request.getAttribute("listado"); //esto es un array
    %>
    <!-- aca van los mensajes-->
    <%
      String error = (String)request.getAttribute("error");
      String success = (String)request.getAttribute("success");
    %>
    <%
      if(error!=null) {
    %>
    <div class="alert alert-danger" role="alert">
      <%=error%>
    </div>
    <%
      }
    %>
    <%
      if(success != null) {
    %>
    <div class="alert alert-success" role="alert">
      <%=success%>
    </div>
    <%
    }
    %>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <section>
                    <h1>Listado de Articulos</h1>
                    <table class="table table-striped table-bordered ">
                        <thead class="thead-dark">
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Título</th>
                            <th scope="col">Código</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% 
                        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                            for(Articulo unarticulo : listado) {
                            %>
                                <tr>
                                    <th scope="row"><%=unarticulo.getId()%></th>
                                    <td><%=unarticulo.getTitulo()%></td>
                                    <td><%=unarticulo.getCodigo()%></td>
                                    <td><%=unarticulo.getPrecio()%></td>
                                    <td><%=unarticulo.getFechaCreacion().format(formatter)%></td>
                                    <td>
                                        <a href="<%=request.getContextPath()%>/EditarController?id=<%=unarticulo.getId()%>" 
                                        	class="btn btn-warning">
                                          	Editar <i class="far fa-edit"></i></a>
                                        <a href="<%=request.getContextPath()%>/DeleteController?id=<%=unarticulo.getId()%>" 
                                        	class="btn btn-danger">
                                            Eliminar
                                        <i class='fas fa-trash-alt'></i></a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                      </table>
                </section>
            </div>
        </div>
    </div>
</body>

</html>