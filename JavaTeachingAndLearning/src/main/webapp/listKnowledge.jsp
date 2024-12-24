<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Knowledge List</title>
    <link rel="stylesheet" href="Style.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style> 
    </style>
</head>
<body>
    
        <jsp:include page="Header.jsp"/>
        

    <div class="container mt-5">
        <h2 class="mb-4">Knowledge List</h2>
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
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="knowledge" items="${knowledges}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td class="wrap-text">${knowledge.title}</td>
                        <td class="wrap-text">${knowledge.description}</td>
                        <td class="wrap-text">${knowledge.content}</td>
                        <td>${knowledge.category.titlecg}</td>
                        <td>${knowledge.user.name}</td>
                        <td>${knowledge.createdAt}</td>
                        <td>
                            <a href="KnowledgeController?action=edit&knowledgeID=${knowledge.knowledgeId}" class="btn btn-warning btn-sm ">Edit</a>
                        </td>
                        <td>
                            <a href="KnowledgeController?action=delete&knowledgeID=${knowledge.knowledgeId}" class="btn btn-danger btn-sm " onclick="return confirm('Are you sure you want to delete this knowledge?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="KnowledgeController?action=insert" class="btn btn-primary add-new">Add New Knowledge</a>
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
