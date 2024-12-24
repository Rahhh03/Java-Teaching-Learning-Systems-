<%-- 
    Document   : welcomeLoggedIn
    Created on : 28 Jun 2024, 11:29:20
    Author     : User
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.Model.User" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css"/>
        <title>Welcome Page</title>
    </head>
    <body>
        
        <jsp:include page="Header.jsp"/>
        
        <div class="container mt-4">
          <h2>Welcome, <c:out value="${user.name}" />!</h2>
          <p>You are logged in as <c:out value="${user.role}" />.</p>

          <div class="mt-3">
              <a href="KnowledgeController?action=home" class="btn btn-primary">Go to Homepage</a> 
          </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl9HybVDfbd0O3Fx6Lkz6lb7/J9gu5l8b6U4y51U9MRXlne2Dx6vXa5l5b4" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js" integrity="sha384-DtrM8cXrK5y7YLop0+a43TZiBxWQW8ClxriUJxBxUqF1RI1Ennl55XewQ2c7RnDf" crossorigin="anonymous"></script>
    </body>
</html>
