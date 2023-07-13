<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp" />
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <div class="row">
            <div class="col-12">
                <section>
                    <h1>Alta Articulo</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/AltaArticuloController">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input name="nombre" 
                                type="text" 
                                class="form-control" 
                                id="nombre"
                                maxlength="50" required>
                        </div>
                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio</label>
                             <input name="precio"
                             	type="number" 
                             	step="0.01" 
                             	class="form-control" 
                             	id="precio" required>
                        </div>
                        <div class="mb-3">
                            <label for="imagen" class="form-label">Im&aacute;gen</label>
                            <input name="imagen" 
                                type="file" 
                                class="form-control" 
                                id="imagen">
                        </div>
                        <div class="mb-3">
                            <label for="codigo" class="form-label">C&oacute;digo</label>
                            <input name="codigo" 
                                type="text" 
                                class="form-control" 
                                id="codigo" 
                                maxlength="7">
                        </div>
                        <div class="mb-3">
                            <label for="autor" class="form-label">Autor</label>
                            <input name="autor" 
                                type="text" 
                                class="form-control" 
                                id="autor" 
                                maxlength="50">
                        </div>
                        <button class="btn btn-primary"> Dar de alta</button>
                    </form>
                </section>
            </div>
        </div>
	</div>
</body>

</html>