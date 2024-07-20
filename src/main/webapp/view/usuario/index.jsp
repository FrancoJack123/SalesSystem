<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="../_layout/head.jsp" />
    <title>Usuario - SB Admin</title>
</head>
<body class="sb-nav-fixed">

<jsp:include page="../_layout/navbar.jsp" />

<div id="layoutSidenav">
    <jsp:include page="../_layout/sidenav.jsp" />
    <div id="layoutSidenav_content">

        <%--CONTENIDO--%>
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Usuarios</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item active">Usuarios</li>
                </ol>
                <div class="row mb-1">
                    <div class="col-sm-12 col-md-6 text-center text-md-start">
                        <a class="btn btn-nawijo" href="<c:url value='/usuario?id=0' />">Agregar</a>
                        <a class="btn btn-nawijo ms-2"><i class="fas fa-file-pdf text-secondary"></i></a>
                    </div>
                    <div class="col-sm-12 col-md-6 mt-4 mt-md-0">
                        <form action="<c:url value="/usuario"/>" method="get">
                            <div class="input-group">
                                <span class="input-group-text">Buscar</span>
                                <input type="text" class="form-control" name="name" onchange="this.form.submit()" value="<c:out value="${name}"/>">
                                <button class="btn btn-nawijo" type="submit"><i class="fas fa-search text-secondary" style="color: #6c757d;"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="table-responsive-md">
                    <table class="table table-bordered align-middle" id="datatablesSimple">
                        <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Rol</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${items}" var="item">
                            <tr>
                                <td><c:out value="${item.id}"/></td>
                                <td><c:out value="${item.role.nombre}"/></td>
                                <td><c:out value="${item.nombre}"/></td>
                                <td><c:out value="${item.email}"/></td>
                                <td class="col-1">
                                    <div class="d-flex gap-1 justify-content-center">
                                        <a class="btn btn-nawijo" href="<c:url value='/usuario?id=${item.id}' />">
                                            <i class="fas fa-pen text-secondary"></i>
                                        </a>
                                        <form action="<c:url value="/usuario"/>" method="post" onsubmit="return confirm('Estas seguro de eliminar')">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<c:out value="${item.id}"/>">
                                            <button class="btn btn-nawijo" type="submit">
                                                <i class="fa-solid fa-trash text-secondary"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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