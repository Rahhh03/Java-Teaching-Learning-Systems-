<%-- 
    Document   : listUser.jsp
    Created on : 27 Jun 2024, 17:13:54
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="Style.css"/>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #0056b3;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ced4da;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #e9ecef;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .action-buttons a {
            text-decoration: none;
            color: #fff;
            padding: 8px 12px;
            margin-right: 5px;
            border-radius: 5px;
            font-size: 14px;
        }
        .edit {
            background-color: #007bff;
        }
        .delete {
            background-color: #dc3545;
        }
        .add-new {
            display: block;
            width: 150px;
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            margin: 20px auto;
        }
        .add-new:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    
        <jsp:include page="Header.jsp"/>
    
    <div class="container">
        <h1>List of Users</h1>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Username</th>  
                    <th>Role</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="counter" value="1" scope="page" />
                <c:forEach items="${users}" var="user">
                    <tr> 
                        <td>${counter}</td> 
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.phoneNum}" /></td>
                        <td><c:out value="${user.username}" /></td> 
                        <td><c:out value="${user.role}" /></td> 
                        <td class="action-buttons">
                            <a href="UserController?action=edit&userID=${user.userId}" class="btn btn-sm btn-primary edit">Update</a>
                            <a href="UserController?action=delete&userID=${user.userId}" class="btn btn-sm btn-danger delete" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>
                    </tr>
                    <c:set var="counter" value="${counter + 1}" scope="page" />
                </c:forEach>
            </tbody>
        </table> 
        <a href="UserController?action=insert" class="btn btn-primary add-new">Add New User</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl9HybVDfbd0O3Fx6Lkz6lb7/J9gu5l8b6U4y51U9MRXlne2Dx6vXa5l5b4" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgP1NxT2lggKnBvjLRNT+9swbx5eZl8btNjFET2xwC8AaIbb4gC" crossorigin="anonymous"></script>
</body>
</html>
