<%-- 
    Document   : login
    Created on : 28 Jun 2024, 11:30:04
    Author     : User
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css"/>
        <title>Login Page</title>
        <style>
            .card-custom {
                border-radius: 1rem;
                width: 100%;
                max-width: 700px; /* Increase this value to make the card bigger */
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <section class="gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-10 col-lg-8 col-xl-7"> <!-- Adjusted columns to make the card larger -->
                        <div class="card bg-dark text-white card-custom">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <form name="frmLogin" action="UserController?action=login" method="POST">
                                        <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                        <div data-mdb-input-init class="form-outline form-white mb-4">
                                            <label class="form-label">Username</label>
                                            <input type="text" name="username" value="" required="" class="form-control form-control-lg">
                                        </div>
                                        <div data-mdb-input-init class="form-outline form-white mb-4">
                                            <label class="form-label">Password</label>
                                            <input type="password" name="password" value="" required="" class="form-control form-control-lg">
                                        </div>
                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
                                    </form>
                                </div>
                                <div>
                                    <p class="mb-0">Don't have an account? <a href="UserController?action=insert" class="text-white-50 fw-bold">Sign Up</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
