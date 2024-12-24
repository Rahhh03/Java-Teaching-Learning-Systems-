<%-- 
    Document   : index
    Created on : 28 Jun 2024, 19:38:48
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - Knowledge Management</title>
    </head>
    <body>
        <jsp:forward page="KnowledgeController?action=home"/>
    </body>
</html>
