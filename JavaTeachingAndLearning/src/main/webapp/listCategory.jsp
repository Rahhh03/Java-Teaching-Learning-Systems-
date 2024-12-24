<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Lists</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css"/>
    </head>
    <body>
        
        <jsp:include page="Header.jsp"/>
        
        
        <div class="container mt-5">
            <h1 class="mb-4">List of Categories</h1>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="counter" value="1" scope="page"/>
                    <c:forEach items="${categories}" var="category">
                        <tr>
                            <td>${counter}</td>
                            <td><c:out value="${category.titlecg}"/></td>
                            <td><c:out value="${category.desccg}"/></td>
                            <td><fmt:formatDate value="${category.datecg}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <a href="CategoryController?action=edit&categoryID=${category.categoryId}" class="btn btn-warning btn-sm">Update</a>
                            </td>
                            <td>
                                <a href="CategoryController?action=delete&categoryID=${category.categoryId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                            </td>
                        </tr>
                        <c:set var="counter" value="${counter + 1}" scope="page"/>
                    </c:forEach>
                </tbody>
            </table>
            <a href="CategoryController?action=insert" class="btn btn-primary">Add New Category</a>
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
