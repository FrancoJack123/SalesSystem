<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="../_layout/head.jsp" />
    <title>Producto - SB Admin</title>
</head>
<body class="sb-nav-fixed">

<jsp:include page="../_layout/navbar.jsp" />

<div id="layoutSidenav">
    <jsp:include page="../_layout/sidenav.jsp" />
    <div id="layoutSidenav_content">

        <%--CONTENIDO--%>
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Productos</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<c:url value='/producto' />">Productos</a></li>
                    <li class="breadcrumb-item active"><c:out value="${item.id}"/></li>
                </ol>
                <div>
                    <form action="<c:url value="/producto"/>" method="post">
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="id" value="<c:out value="${item.id}"/>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<c:out value="${item.nombre}"/>" placeholder="Laptop LG 12° Gen 15.6" required>
                        </div>
                        <div class="mb-3">
                            <label for="descripcion" class="form-label">Descripcion</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" rows="3" required><c:out value="${item.descripcion}"/></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio</label>
                            <input type="text" class="form-control" id="precio" name="precio" value="<c:out value="${item.precio}"/>" placeholder="$ 67.99" required>
                        </div>
                        <div class="mb-3">
                            <label for="stock" class="form-label">Stock</label>
                            <input type="number" class="form-control" id="stock" name="stock" value="<c:out value="${item.stock}"/>" placeholder="12" required>
                        </div>
                        <div class="mb-3">
                            <label for="category" class="form-label">Categorias</label>
                            <select class="form-select" id="category" name="category" required>
                                <c:forEach items="${categorias}" var="category">
                                    <option value="<c:out value='${category.id}'/>"
                                            <c:if test="${category.id == item.category.id}">
                                            selected
                                            </c:if>
                                    >
                                        <c:out value="${category.nombre}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="tag" class="form-label">Tags</label>
                            <select class="form-select" id="tag" name="tag" multiple required>
                                <c:forEach items="${tags}" var="tag">
                                    <c:set var="isSelected" value="false"/>
                                    <c:forEach items="${item.tags}" var="tagItem">
                                        <c:if test="${tag.id == tagItem.id}">
                                            <c:set var="isSelected" value="true"/>
                                        </c:if>
                                    </c:forEach>
                                    <option value="<c:out value='${tag.id}'/>" <c:if test="${isSelected}">selected</c:if>>
                                        <c:out value="${tag.nombre}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-nawijo">Submit</button> | <a href="<c:url value='/producto' />" class="btn btn-nawijo">Regresar</a>
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