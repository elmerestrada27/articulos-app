<%@ page import="ar.com.codoacodo.oop.Articulo" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Articulos</title>
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
      Articulo articulo = (Articulo)request.getAttribute("producto");
     %>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <section>
                    <h1>Editar Articulo id=<%=articulo.getId()%></h1>
                    <form method="post" action="<%=request.getContextPath()%>/EditarController?id=<%=articulo.getId()%>">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" 
                                class="form-label">Nombre</label>
                            <input name="nombre" 
                                type="text" 
                                class="form-control" 
                                id="exampleFormControlInput1"
                                placeholder="Nombre"
                                maxlength="50"
                                value="<%=articulo.getTitulo()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" 
                                class="form-label">Precio
                            </label>
                            <input name="precio" 
                                type="number" 
                                class="form-control" 
                                id="exampleFormControlTextarea1"
                                value="<%=articulo.getPrecio()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" 
                                class="form-label">Im&aacute;gen
                            </label>
                            <input name="imagen" 
                                type="file" 
                                class="form-control" 
                                id="exampleFormControlTextarea1"
                                value="<%=articulo.getImagen()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" 
                                class="form-label">C&oacute;digo
                            </label>
                            <input name="codigo" 
                                type="text" 
                                disabled
                                readonly
                                class="form-control" 
                                id="exampleFormControlTextarea1" 
                                maxlength="7"
                                value="<%=articulo.getCodigo()%>">
                        </div>
                        <div class="mb-3">
                            <label for="autor" 
                                class="form-label">Autor
                            </label>
                            <input name="autor" 
                                type="text" 
                                class="form-control" 
                                id="autor" 
                                maxlength="50"
                                value="<%=articulo.getAutor()%>">
                        </div>
                        <button class="btn btn-primary">
                            Modificar
                        </button>
                    </form>
                </section>
            </div>
        </div>
	</div>
</body>

</html>