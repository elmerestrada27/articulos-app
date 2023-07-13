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
	     <form class="d-flex" role="search" method="GET" action="<%=request.getContextPath()%>/BuscadorController">
	       <input class="form-control me-sm-2" name="clave" type="search" placeholder="Buscar en Articulos">
	       <button class="btn btn-secondary my-2 my-sm-0" type="submit">Buscar</button>
	     </form>
	   </div>
	</div>
</nav>