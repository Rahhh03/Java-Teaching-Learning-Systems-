<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css"/>
        <title>Home - Knowledge Management</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="CategoryController?action=listCategory">
                                    <span data-feather="file-text"></span>
                                    Category <span class="sr-only">(current)</span>
                                </a>
                            </li>
                        </ul>
                        <div class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                            <span>Add New Category</span>
                            <a class="navbar-brand" href="CategoryController?action=insert">
                                <span data-feather="plus-circle"></span>
                            </a>
                        </div>
                        <ul class="nav flex-column justify-content-between align-items-center">
                            <c:forEach items="${categories}" var="category">
                                <li class="nav-item"><a href="#"><c:out value="${category.titlecg}"/></a></li>
                            </c:forEach>
                        </ul>
                        <br>
                        <ul class="nav flex-column mb-2">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file-text"></span>
                                    Knowledge
                                </a>
                                <div class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                                    <span>Add New Knowledge</span>
                                    <a href="KnowledgeController?action=insert">
                                        <span data-feather="plus-circle"></span>
                                    </a> 
                                </div>
                            </li>
                        </ul>
                        <ul class="nav flex-column justify-content-between align-items-center">
                            <c:forEach items="${knowledges}" var="knowledge" varStatus="status">
                                <li class="nav-item"><a href="KnowledgeController?action=viewKnowledge2&knowledgeID=${knowledge.knowledgeId}"><c:out value="${knowledge.title}"/></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h1 class="h2">Dashboard</h1>
                    </div>
                    <div class="container-fluid">
                        <section> 
                            <div class="row">
                                <div class="col">
                                    <c:choose>
                                        <c:when test="${not empty knowledges}">
                                            <table class="table table-bordered table-striped">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Title</th>
                                                        <th>Description</th>
                                                        <th>Content</th>
                                                        <th>Category</th>
                                                        <th>Created By</th>
                                                        <th>Created At</th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${knowledges}" var="knowledge" varStatus="status">
                                                        <tr>
                                                            <td>${status.index + 1}</td>
                                                            <td><c:out value="${knowledge.title}"/></td>
                                                            <td><c:out value="${knowledge.description}"/></td>
                                                            <td><c:out value="${knowledge.content}"/></td>
                                                            <td><c:out value="${knowledge.category.titlecg}"/></td>
                                                            <td><c:out value="${knowledge.user.name}"/></td>
                                                            <td><c:out value="${knowledge.createdAt}"/></td> 
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:when>
                                        <c:otherwise>
                                            <p>No knowledge items found.</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p><a href="KnowledgeController?action=insert" class="btn btn-primary">Add New Knowledge</a></p>
                                </div>
                            </div>
                        </section>
                    </div>
                </main>
            </div>
        </div>

        <footer class="footer mt-auto py-3 bg-light">
            <div class="container">
                <span class="text-muted">Knowledge Management System &copy; 2024</span>
            </div>
        </footer>
 
        <script src="https://unpkg.com/feather-icons"></script>
        <script>
            feather.replace();
        </script>
    </body>
</html>
