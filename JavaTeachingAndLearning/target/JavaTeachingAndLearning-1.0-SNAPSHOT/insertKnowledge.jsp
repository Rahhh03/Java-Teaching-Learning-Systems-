<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Knowledge</title>
    <link rel="stylesheet" href="Style.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #0056b3;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        form div {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 15px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #004494;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #0056b3;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
        <jsp:include page="Header.jsp"/>
    <div class="container">
        <h2>Insert New Knowledge</h2>
        
        <c:if test="${not empty error}">
            <div class="error">
                <p>${error}</p>
            </div>
        </c:if>
        
        <form action="KnowledgeController" method="post">
            <input type="hidden" name="action" value="insert">
            
            <div>
                <label for="categoryId">Category:</label>
                <select name="categoryId" id="categoryId">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.categoryId}">${category.titlecg}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div>
                <label for="createdBy">Created By:</label>
                <select name="createdBy" id="createdBy"> 
                        <option value="${user.userId}">${user.name}</option> 
                </select>
            </div>
            
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${knowledge.title}">
            </div>
            
            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description">${knowledge.description}</textarea>
            </div>
            
            <div>
                <label for="content">Content:</label>
                <textarea id="content" name="content">${knowledge.content}</textarea>
            </div>
            
            <div>
                <label for="createdAt">Created At:</label>
                <input type="date" id="createdAt" name="createdAt">
            </div>
            
            <div>
                <input type="submit" value="Insert Knowledge">
            </div>
        </form>
        
        <a href="KnowledgeController?action=listKnowledge">Back to List</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl9HybVDfbd0O3Fx6Lkz6lb7/J9gu5l8b6U4y51U9MRXlne2Dx6vXa5l5b4" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgP1NxT2lggKnBvjLRNT+9swbx5eZl8btNjFET2xwC8AaIbb4gC" crossorigin="anonymous"></script>
</body>
</html>
