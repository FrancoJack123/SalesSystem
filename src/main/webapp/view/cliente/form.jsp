<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="../_layout/head.jsp" />
    <title>Cliente - SB Admin</title>
</head>
<body class="sb-nav-fixed">

<jsp:include page="../_layout/navbar.jsp" />

<div id="layoutSidenav">
    <jsp:include page="../_layout/sidenav.jsp" />
    <div id="layoutSidenav_content">

        <%--CONTENIDO--%>
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Clientes</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<c:url value='/cliente' />">Clientes</a></li>
                    <li class="breadcrumb-item active"><c:out value="${item.id}"/></li>
                </ol>
                <div>
                    <form action="<c:url value="/cliente"/>" method="post">
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="id" value="<c:out value="${item.id}"/>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<c:out value="${item.nombre}"/>" placeholder="Juan Pérez" required>
                        </div>
                        <div class="mb-3">
                            <label for="dni" class="form-label">Dni</label>
                            <input type="text" class="form-control" id="dni" name="dni" value="<c:out value="${item.dni}"/>" placeholder="15754837" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<c:out value="${item.email}"/>" placeholder="ejemplo@correo.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<c:out value="${item.telefono}"/>" placeholder="(123) 456-7890" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value="<c:out value="${item.direccion}"/>" placeholder="Calle 123, Ciudad, País" required>
                        </div>
                        <button type="submit" class="btn btn-nawijo">Submit</button> | <a href="<c:url value='/cliente' />" class="btn btn-nawijo">Regresar</a>
                    </form>
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