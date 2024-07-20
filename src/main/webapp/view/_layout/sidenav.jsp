<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="<c:url value='/dashboard' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                </a>

                <div class="sb-sidenav-menu-heading">Interface</div>

                <a class="nav-link" href="<c:url value='/rol' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-user-tag"></i></div>
                    Roles
                </a>
                <a class="nav-link" href="<c:url value='/usuario' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    Usuarios
                </a>
                <a class="nav-link" href="<c:url value='/cliente' />">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-users"></i></div>
                    Clientes
                </a>
                <a class="nav-link" href="<c:url value='/categoria' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i></div>
                    Categorias
                </a>
                <a class="nav-link" href="<c:url value='/tag' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-tags"></i></div>
                    Tags
                </a>
                <a class="nav-link" href="<c:url value='/producto' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
                    Productos
                </a>

                <div class="sb-sidenav-menu-heading">Addons</div>

                <a class="nav-link" href="<c:url value='/venta' />">
                    <div class="sb-nav-link-icon"><i class="fas fa-shopping-basket"></i></div>
                    Consultar Ventas
                </a>

                <a class="nav-link" href="<c:url value='/venta' />">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                    Registrar Venta
                </a>

            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Start Bootstrap
        </div>
    </nav>
</div>