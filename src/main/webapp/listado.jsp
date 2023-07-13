<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo.oop.Articulo" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp" />
<body>
    <jsp:include page="navbar.jsp" />
    <% 
     ArrayList<Articulo> listado = (ArrayList<Articulo>)request.getAttribute("listado");
     String error = (String)request.getAttribute("error");
     String success = (String)request.getAttribute("success");
    %>
    <% if(error!=null) {  %>
	    <div class="alert alert-danger" role="alert">
	      <%=error%>
	    </div>
    <% } %>
    <% if(success != null) { %>
	    <div class="alert alert-success" role="alert">
	      <%=success%>
	    </div>
    <% } %>
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