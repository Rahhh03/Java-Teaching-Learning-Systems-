<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="Style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
        <title>Edit Knowledge</title>
    </head>
    <body>
        
        <jsp:include page="Header.jsp"/>

        <div class="container main-content">
            <h2>Edit Knowledge</h2>
            <form action="KnowledgeController?action=edit" method="post">
                <input type="hidden" name="knowledgeID" value="${knowledge.knowledgeId}">
                <div class="form-group">
                    <label for="categoryId">Category</label>
                    <select class="form-control" id="categoryId" name="categoryId">
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.categoryId}" <c:if test="${category.categoryId == knowledge.category.categoryId}">selected</c:if>>${category.titlecg}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="${knowledge.title}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" required>${knowledge.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea class="form-control" id="content" name="content" required>${knowledge.content}</textarea>
                </div>
                <input type="hidden" name="createdBy" value="${knowledge.user.userId}">
                <div class="form-group">
                    <label for="createdAt">Created At</label>
                    <input type="date" class="form-control" id="createdAt" name="createdAt" value="${knowledge.createdAt}" required>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="KnowledgeController?action=listKnowledge" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
        <footer>
            <p>Knowledge Management System &copy; 2024</p>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
