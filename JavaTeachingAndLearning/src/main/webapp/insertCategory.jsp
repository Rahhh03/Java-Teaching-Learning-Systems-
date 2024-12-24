<%-- 
    Document   : insertCategory
    Created on : 28 Jun 2024, 04:03:54
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Category</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
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
        <h1>New Category</h1>
        <form name="frmAddCategory" action="CategoryController" method="POST">
            <div class="form-group">
                <label for="titlecg">Title</label>
                <input type="text" class="form-control" id="titlecg" name="titlecg" required>
            </div>
            <div class="form-group">
                <label for="desccg">Description</label>
                <input type="text" class="form-control" id="desccg" name="desccg">
            </div>
            <div class="form-group">
                <label for="datecg">Date</label>
                <input type="date" class="form-control" id="datecg" name="datecg" required>
            </div>
            <input type="hidden" name="action" value="insert">
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
