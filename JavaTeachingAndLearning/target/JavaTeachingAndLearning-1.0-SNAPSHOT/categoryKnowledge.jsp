<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css"/>
        <title>Knowledge by Category</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.jsp">
            <img id="Logo" src="Images/Logo.png" alt="logo"/>
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach items="${categories}" var="category">
                            <a class="dropdown-item" href="#"><c:out value="${category.titlecg}" /></a>
                        </c:forEach>
                    </div>
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
                        <a href="UserController?action=profile" class="btn btn-outline-primary my-2 my-sm-0 ml-2"><c:out value="${user.username}" /></a>
                    </c:when>
                    <c:otherwise>
                        <a href="login.jsp" class="btn btn-outline-primary my-2 my-sm-0 ml-2">Login</a>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </nav>
        
        <div class="container mt-5">
            <h2>Knowledge under <c:out value="${category.titlecg}"/></h2>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Content</th>
                        <th>Created By</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${knowledges}" var="knowledge" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><c:out value="${knowledge.title}"/></td>
                            <td><c:out value="${knowledge.description}"/></td>
                            <td><c:out value="${knowledge.content}"/></td>
                            <td><c:out value="${knowledge.user.name}"/></td>
                            <td><c:out value="${knowledge.createdAt}"/></td>
                            <td>
                                <a href="KnowledgeController?action=edit&knowledgeId=${knowledge.knowledgeId}" class="btn btn-warning btn-sm">Update</a>
                                <a href="KnowledgeController?action=delete&knowledgeId=${knowledge.knowledgeId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <footer class="footer mt-auto py-3 bg-light">
            <div class="container">
                <span class="text-muted">Knowledge Management System &copy; 2024</span>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl9HybVDfbd0O3Fx6Lkz6lb7/J9gu5l8b6U4y51U9MRXlne2Dx6vXa5l5b4" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgP1NxT2lggKnBvjLRNT+9swbx5eZl8btNjFET2xwC8AaIbb4gC" crossorigin="anonymous"></script>
    </body>
</html>
