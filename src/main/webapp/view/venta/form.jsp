<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="../_layout/head.jsp" />
    <title>Registrar Venta - SB Admin</title>
</head>
<body class="sb-nav-fixed">

<jsp:include page="../_layout/navbar.jsp" />

<div id="layoutSidenav">
    <jsp:include page="../_layout/sidenav.jsp" />
    <div id="layoutSidenav_content">

        <%--CONTENIDO--%>
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Registrar Venta</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<c:url value='/categoria' />">Ventas</a></li>
                    <li class="breadcrumb-item active">Registrar Venta</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-shopping-basket me-1"></i>
                        Detalle Venta
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="input-group">
                                    <span class="input-group-text">Tipo de Documento</span>
                                    <select class="form-select">
                                        <option selected>Open this select menu</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group">
                                    <span class="input-group-text">Fecha de Venta</span>
                                    <input type="date" class="form-control" value="" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex gap-3">
                    <div class="card mb-4" style="flex: 1;">
                        <div class="card-header">
                            <i class="fas fa-user me-1"></i>
                            Detalle Empleado
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <label for="nombreEmpleado" class="form-label">Nombre</label>
                                    <input type="text" id="nombreEmpleado" class="form-control" readonly>
                                </div>
                                <div class="col">
                                    <label for="apellidoEmpleado" class="form-label">Apellido</label>
                                    <input type="text" id="apellidoEmpleado" class="form-control" readonly>
                                </div>
                                <div class="col">
                                    <label for="correoEmpleado" class="form-label">Correo</label>
                                    <input type="text" id="correoEmpleado" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex gap-3">
                    <div class="card mb-4" style="flex: 1;">
                        <div class="card-header">
                            <i class="fas fa-users me-1"></i>
                            Detalle Cliente
                        </div>
                        <div class="card-body">
                            <div class="d-flex gap-3 mb-3">
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Numero Documento</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Telefono</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                                <div>
                                    <div class="mt-0">
                                        <br class="d-jk-none">
                                        <button class="btn mt-2" style="background-color: #e9ecef; border: 1px solid #ced4da;" type="button"
                                                id="inputGroupFileAddon04">
                                            Buscar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex gap-3">
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Nombres</label>
                                    <input type="text" class="form-control" placeholder="First name" aria-label="First name" readonly>
                                </div>
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Direccion</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4" style="flex: 1;">
                        <div class="card-header">
                            <i class="fas fa-box me-1"></i>
                            Detalle Producto
                        </div>
                        <div class="card-body">
                            <div class="d-flex gap-3 mb-3">
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Codigo</label>
                                    <input type="text" class="form-control" placeholder="First name" aria-label="First name" readonly>
                                </div>
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                                <div style="flex: 2;">
                                    <label for="inputEmail4" class="form-label">Descripcion</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                                <div>
                                    <div class="mt-0">
                                        <br class="d-jk-none">
                                        <button class="btn mt-2" style="background-color: #e9ecef; border: 1px solid #ced4da;" type="button"
                                                id="inputGroupFileAddon04">
                                            Buscar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex gap-3">
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Stock</label>
                                    <input type="text" class="form-control" placeholder="First name" aria-label="First name" readonly>
                                </div>
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Precio</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" readonly>
                                </div>
                                <div style="flex: 1;">
                                    <label for="inputEmail4" class="form-label">Cantidad</label>
                                    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name">
                                </div>
                                <div>
                                    <div class="mt-0">
                                        <br class="d-jk-none">
                                        <button class="btn mt-2" style="background-color: #e9ecef; border: 1px solid #ced4da;" type="button"
                                                id="inputGroupFileAddon04">
                                            Agregar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <%--FIN CONTENIDO--%>

        <jsp:include page="../_layout/footer.jsp" />
    </div>
</div>

<jsp:include page="../_layout/script.jsp" />
</body>
</html>