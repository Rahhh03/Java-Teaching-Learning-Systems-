<%-- 
    Document   : editUser
    Created on : 27 Jun 2024, 18:06:05
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit User</title>
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
            max-width: 600px;
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
        label {
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn {
            width: 100px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    
        <jsp:include page="Header.jsp"/>

    <div class="container">
        <h1>Edit User</h1>
        <form name="frmEditUser" action="UserController" method="POST">
            <div class="form-group">
                <label for="userID">User ID:</label>
                <input type="text" class="form-control" id="userID" name="userID" value="${user.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label for="phoneNum">Phone Number:</label>
                <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${user.phoneNum}" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select class="form-control" id="role" name="role">
                    <option value="Staff" <c:if test="${user.role eq 'Staff'}">selected</c:if>>Staff</option>
                </select>
            </div>
            <input type="hidden" name="action" value="edit">
            <div class="form-group text-center">
                <input type="submit" value="Submit" class="btn btn-primary" name="submit">
                <input type="reset" value="Cancel" class="btn btn-secondary" name="cancel">
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
