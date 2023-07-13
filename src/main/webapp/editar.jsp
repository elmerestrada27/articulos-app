<%@ page import="ar.com.codoacodo.oop.Articulo" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp" />
<body>
    <jsp:include page="navbar.jsp" />
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
                            <label for="nombre" class="form-label">Nombre</label>
                            <input name="nombre" 
                                type="text" 
                                class="form-control" 
                                id="nombre"
                                maxlength="50"
                                value="<%=articulo.getTitulo()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Precio</label>
                            <input name="precio" 
                                type="number" 
                                class="form-control" 
                                id="precio"
                                value="<%=articulo.getPrecio()%>">
                        </div>
                        <div class="mb-3">
                            <label for="imagen" class="form-label">Im&aacute;gen</label>
                            <input name="imagen" 
                                type="file" 
                                class="form-control" 
                                id="imagen"
                                value="<%=articulo.getImagen()%>">
                        </div>
                        <div class="mb-3">
                            <label for="codigo" class="form-label">C&oacute;digo</label>
                            <input name="codigo" 
                                type="text" 
                                disabled
                                readonly
                                class="form-control" 
                                id="codigo" 
                                maxlength="7"
                                value="<%=articulo.getCodigo()%>">
                        </div>
                        <div class="mb-3">
                            <label for="autor" class="form-label">Autor</label>
                            <input name="autor" 
                                type="text" 
                                class="form-control" 
                                id="autor" 
                                maxlength="50"
                                value="<%=articulo.getAutor()%>">
                        </div>
                        <button class="btn btn-primary"> Modificar</button>
                    </form>
                </section>
            </div>
        </div>
	</div>
</body>

</html>