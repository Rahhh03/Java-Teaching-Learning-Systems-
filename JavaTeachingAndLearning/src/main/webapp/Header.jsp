<%-- 
    Document   : Header
    Created on : 30 Jun 2024, 13:44:55
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">
                <img id="Logo" src="Images/Logo.png" alt="logo"/>
                <input type="hidden" name="action" value="home">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link  "  href="CategoryController?action=listCategory"   role="button"  aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a> 
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="KnowledgeController?action=listKnowledge">Knowledge</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    <c:choose>
                        <c:when test="${not empty user}">
                            <a href="profile.jsp" class="btn btn-outline-primary my-2 my-sm-0 ml-2"><c:out value="${user.username}" /></a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Login</a>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </nav>
    </body>
</html>
