<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Rol - SB Admin</title>
    <jsp:include page="../_layout/head.jsp" />
</head>
<body class="sb-nav-fixed">

<jsp:include page="../_layout/navbar.jsp" />

<div id="layoutSidenav">
    <jsp:include page="../_layout/sidenav.jsp" />
    <div id="layoutSidenav_content">

        <%--CONTENIDO--%>
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Roles</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<c:url value='/rol' />">Roles</a></li>
                    <li class="breadcrumb-item active"><c:out value="${item.id}"/></li>
                </ol>
                <div>
                    <form action="<c:url value="/rol"/>" method="post">
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="id" value="<c:out value="${item.id}"/>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<c:out value="${item.nombre}"/>" placeholder="Administrador" required>
                        </div>
                        <button type="submit" class="btn btn-nawijo">Submit</button> | <a href="<c:url value='/rol' />" class="btn btn-nawijo">Regresar</a>
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