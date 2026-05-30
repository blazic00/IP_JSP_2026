<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Student" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Materialize -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    .container { margin-top: 30px; }
    .card:hover { transform: translateY(-5px); transition: 0.3s; }

    table {
        table-layout: fixed;
        width: 100%;
    }

    th, td {
        word-break: break-word;
    }

    th:nth-child(5), td:nth-child(5),
    th:nth-child(6), td:nth-child(6) {
        text-align: center;
    }

    .table-wrapper {
        max-height: 400px;
        overflow-y: auto;
        display: block;
    }

    .table-wrapper thead th {
        position: sticky;
        top: 0;
        background: white;
        z-index: 2;
    }
</style>

</head>
<body>

<%
List<Student> students = (List<Student>) request.getAttribute("students");
Student student = (Student) request.getAttribute("student");
%>

<div class="container">
<!-- BACK BUTTON -->
    <div class="row">
        <div class="col s12">
            <a href="main"
               class="btn grey darken-2 waves-effect waves-light">
                ←
            </a>
        </div>
    </div>

<!-- FORM -->
<div class="row">
    <div class="col s12">
        <div class="card hoverable">
            <div class="card-content">
                <span class="card-title">
                    <%= (student != null) ? "Edit Student" : "Create Student" %>
                </span>


                <form action="student" method="post" id="studentForm">

                    <% if (student != null) { %>
                        <input type="hidden" name="id" value="<%= student.getId() %>">
                    <% } %>

                    <div class="input-field">
                        <input name="username" type="text" required
                               value="<%= student != null ? student.getUsername() : "" %>">
                        <label class="active">Username</label>
                    </div>

                    <div class="input-field">
                        <input name="password" type="password" required>
                        <label class="active">Password</label>
                    </div>

                    <div class="input-field">
                        <input name="firstName" type="text" required
                               value="<%= student != null ? student.getFirstName() : "" %>">
                        <label class="active">First Name</label>
                    </div>

                    <div class="input-field">
                        <input name="lastName" type="text" required
                               value="<%= student != null ? student.getLastName() : "" %>">
                        <label class="active">Last Name</label>
                    </div>

                    <button class="btn green waves-effect waves-light" type="submit">
                        Save
                    </button>

                    <a href="student" class="btn grey waves-effect">Clear</a>

                </form>
            </div>
            <!-- CSV Upload -->
<div class="row">
    <div class="col s12">
        <div class="card hoverable">
            <div class="card-content">
                <span class="card-title">Upload CSV</span>

                <form action="student" method="post" enctype="multipart/form-data">

                    <div class="file-field input-field">
                        <div class="btn blue">
                            <span>CSV File</span>
                            <input type="file" name="csvFile" accept=".csv" required>
                        </div>

                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text"
                                   placeholder="Upload CSV file">
                        </div>
                    </div>
                    <% if (student != null) { %>
                        <input type="hidden" name="id" value="<%= student.getId() %>">
                    <% } %>
                    
                    <button type="submit"
                            name="action"
                            value="uploadCsv"
                            class="btn green waves-effect">
                        Upload
                    </button>

                </form>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>

<!-- TABLE -->
<div class="row">
    <div class="col s12">
        <div class="card hoverable">
            <div class="card-content">
                <span class="card-title">Students</span>

                <div class="table-wrapper">
                    <table class="highlight">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>

                        <tbody>
                        <% if (students != null) {
                               for (Student s : students) { %>
                            <tr>
                                <td><%= s.getUsername() %></td>
                                <td><%= s.getFirstName() %></td>
                                <td><%= s.getLastName() %></td>

                                <td>
                                    <a href="student?edit=<%= s.getId() %>"
                                       class="btn-small blue waves-effect">
                                       <i class="material-icons">edit</i>
                                    </a>
                                </td>

                                <td>
                                    <a href="student?delete=<%= s.getId() %>"
                                       class="btn-small red waves-effect"
                                       onclick="return confirm('Delete this student?');">
                                       <i class="material-icons">delete</i>
                                    </a>
                                </td>
                            </tr>
                        <%   }
                           } %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

</div>

<!-- Materialize JS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script>
    M.AutoInit();

    async function hash(string) {
		  const utf8 = new TextEncoder().encode(string);
		  const hashBuffer = await crypto.subtle.digest('SHA-256', utf8);
		  const hashArray = Array.from(new Uint8Array(hashBuffer));
		  const hashHex = hashArray
		    .map((bytes) => bytes.toString(16).padStart(2, '0'))
		    .join('');
		  return hashHex;
		}

    document.getElementById("studentForm").addEventListener("submit", async function(e) {

        e.preventDefault();
        let passwordField = document.querySelector("input[name='password']");
        let passwordHash = await hash(passwordField.value);
        passwordField.value = passwordHash;
        this.submit();
    });
    
    <%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
        alert("<%= error %>");
<%
    }
%>
    
</script>

</body>
</html>
