<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" import="java.io.*" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../_layout/head.jsp" />
    <title>404 Error - SB Admin</title>
</head>
<body>
<div id="layoutError">
    <div id="layoutError_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center mt-4">
                            <img class="mb-4 img-error" src="<c:url value='/resources/assets/img/error-404-monochrome.svg' />"/>
                            <p class="lead">This requested URL was not found on this server.</p>
                            <a href="<c:url value='dashboard' />">
                                Return to Dashboard
                            </a>
                            <hr/>
                            <p class="lead"><c:out value="${err_msg}"/></p>
                            <p class="lead"><c:out value="${pageContext.errorData.statusCode}"/></p>
                            <p class="lead"><c:out value="${pageContext.errorData.throwable.message}"/></p>
                            <p class="lead"><c:out value="${pageContext.exception.message}"/></p>
                            <p class="lead"><c:out value="${pageContext.exception}"/></p>
                            <c:forEach var="trace" items="${pageContext.errorData.throwable.stackTrace}">
                                <p><c:out value="${trace}"/></p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
