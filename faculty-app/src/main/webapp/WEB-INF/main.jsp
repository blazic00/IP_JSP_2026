<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Layout</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">

    
    <style>
        .card {
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-title {
            font-size: 1.2rem;
        }

        .card-text {
            font-size: 0.9rem;
        }

        .btn {
            width: 100%;
        }

        .container {
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="container">
<div class="row">
    <div class="col s12 right-align">
        <a href="logout"
           class="btn-floating light-blue lighten-2 waves-effect waves-light">
            <i class="material-icons">logout</i>
        </a>
    </div>
</div>
    <div class="row">
        
        <div class="col s12 m6 l3">
            <div class="card hoverable">
                <div class="card-content">
                    <span class="card-title">Company Management</span>
                </div>
                <div class="card-action">
                    <a href="companies" class="btn waves-effect waves-light">Action</a>
                </div>
            </div>
        </div>

       
        <div class="col s12 m6 l3">
            <div class="card hoverable">
                <div class="card-content">
                    <span class="card-title">View Internship Posts</span>
                </div>
                <div class="card-action">
                    <a href="internship-posts" class="btn waves-effect waves-light">Action</a>
                </div>
            </div>
        </div>

      
        <div class="col s12 m6 l3">
            <div class="card hoverable">
                <div class="card-content">
                    <span class="card-title">Student Management</span>
                </div>
                <div class="card-action">
                    <a href="student" class="btn waves-effect waves-light">Action</a>
                </div>
            </div>
        </div>

       
        <div class="col s12 m6 l3">
            <div class="card hoverable">
                <div class="card-content">
                    <span class="card-title">Evaluate Student</span>
                </div>
                <div class="card-action">
                    <a href="evaluate" class="btn waves-effect waves-light">Action</a>
                </div>
            </div>
        </div>
    </div>
</div>

<% String message = (String) request.getAttribute("message"); %>
<script>
    const message = "<%= message %>";
    if (message === "password_update") {
        alert("Password has been updated!");
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
