<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="model.entity.InternshipApplication" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <!-- MOBILE -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Application Details</title>

    <!-- Materialize CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">

    <style>

        body {
            background-color: #f5f5f5;
        }

        .container {
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .card {
            border-radius: 12px;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            font-size: 1.2rem !important;
            font-weight: 600;
        }

        .card-content p {
            margin: 8px 0;
            word-wrap: break-word;
            word-break: break-word;
        }

        .status-badge {
            margin-top: 5px;
        }

        .card-action {
            display: flex;
            justify-content: flex-end;
        }

        .card-action .btn {
            width: 100%;
        }

        .back-button {
            margin-top: 15px;
            margin-left: 15px;
        }

        @media only screen and (max-width: 600px) {

            h4 {
                font-size: 1.8rem;
            }

            .container {
                padding: 0 10px;
            }

            .card-content {
                padding: 18px;
            }
        }

    </style>
</head>

<%
    List<InternshipApplication> applications =
            (List<InternshipApplication>) request.getAttribute("applications");
%>

<body>

<!-- BACK BUTTON -->
    <div class="back-button">
            <a href="main"
               class="btn grey darken-2 waves-effect waves-light">
                ←
            </a>
    </div>


<div class="container">

    <h4 class="center-align">Internship Applications</h4>

    <div class="row">

        <%
            for (InternshipApplication app : applications) {

                String status = app.getStatus();
                String colorClass = "";

                if ("ACCEPTED".equalsIgnoreCase(status)) {
                    colorClass = "green";
                } else if ("REJECTED".equalsIgnoreCase(status)) {
                    colorClass = "red";
                } else if ("PENDING".equalsIgnoreCase(status)) {
                    colorClass = "orange";
                }
        %>

        <div class="col s12 m6">

            <div class="card hoverable">

                <div class="card-content">

                    <!-- STATUS -->
                    <div class="right status-badge">
                        <span class="new badge <%= colorClass %>"
                              data-badge-caption="">
                            <%= status %>
                        </span>
                    </div>

                    <!-- STUDENT -->
                    <span class="card-title">
                        <%= app.getStudentName() %>
                    </span>

                    <!-- APPLICATION ID -->
                    <p>
                        <strong>Application ID:</strong>
                        <%= app.getId() %>
                    </p>

                    <!-- INTERNSHIP -->
                    <p>
                        <strong>Internship:</strong><br>
                        <%= app.getInternshipDescription() %>
                    </p>

                </div>

                <!-- ACTION -->
                <% if("ACCEPTED".equalsIgnoreCase(status)) { %>

                    <div class="card-action">

                        <button class="btn blue waves-effect waves-light"
                                onclick="reviewStudentInternship(<%= app.getStudentInternshipId() %>)">

                            Review

                        </button>

                    </div>

                <% } %>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script>

    function reviewStudentInternship(studentInternshipId) {

        window.location.href =
            "reviewStudentInternship?studentInternshipId="
            + studentInternshipId;
    }

</script>

</body>
</html>