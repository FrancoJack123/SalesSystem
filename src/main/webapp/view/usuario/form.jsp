<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Usuario - SB Admin</title>
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
                <h1 class="mt-4">Usuarios</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<c:url value='/usuario' />">Usuarios</a></li>
                    <li class="breadcrumb-item active"><c:out value="${item.id}"/></li>
                </ol>
                <div>
                    <form action="<c:url value="/usuario"/>" method="post">
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="id" value="<c:out value="${item.id}"/>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<c:out value="${item.nombre}"/>" placeholder="Gustavo R." required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<c:out value="${item.email}"/>" placeholder="example@gamil.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="text" class="form-control" id="password" name="password" value="<c:out value="${item.password}"/>" placeholder="**************" required>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Rol</label>
                            <select class="form-select" id="category" name="role" required>
                                <c:forEach items="${roles}" var="rol">
                                    <option value="<c:out value='${rol.id}'/>"
                                            <c:if test="${rol.id == item.role.id}">
                                            selected
                                            </c:if>
                                    >
                                        <c:out value="${rol.nombre}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-nawijo">Submit</button> | <a href="<c:url value='/usuario' />" class="btn btn-nawijo">Regresar</a>
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