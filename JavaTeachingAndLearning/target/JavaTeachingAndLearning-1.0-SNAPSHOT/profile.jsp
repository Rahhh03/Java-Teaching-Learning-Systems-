<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
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
        .profile-info {
            margin-bottom: 20px;
        }
        .profile-info label {
            font-weight: bold;
            display: block;
        }
        .profile-info p {
            margin: 0;
            padding: 0;
        }
        .button-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .button-group a, .button-group form {
            margin: 0 10px;
        }
        .edit-button a, .logout-button button {
            background-color: #0056b3;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            border: none;
        }
        .edit-button a:hover, .logout-button button:hover {
            background-color: #004494;
        }
    </style>
</head>
<body>
    
        <jsp:include page="Header.jsp"/>

    <div class="container">
        <h2>User Profile</h2>
        <div class="profile-info">
            <label>Name:</label>
            <p>${user.name}</p>
        </div>
        <div class="profile-info">
            <label>Email:</label>
            <p>${user.email}</p>
        </div>
        <div class="profile-info">
            <label>Phone Number:</label>
            <p>${user.phoneNum}</p>
        </div>
        <div class="profile-info">
            <label>Username:</label>
            <p>${user.username}</p>
        </div>
        <div class="profile-info">
            <label>Role:</label>
            <p>${user.role}</p>
        </div>
        <div class="button-group">
            <div class="edit-button">
                <a href="UserController?action=edit&userID=${user.userId}">Edit Profile</a>
            </div>
            <div class="logout-button">
                <form action="UserController?action=logout" method="post">
                    <button type="submit">Logout</button>
                </form>
            </div>
        </div>
    </div>

    <footer class="footer mt-auto py-3 bg-light">
        <div class="container">
            <span class="text-muted">Knowledge Management System &copy; 2024</span>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script>
        feather.replace();
    </script>
</body>
</html>
