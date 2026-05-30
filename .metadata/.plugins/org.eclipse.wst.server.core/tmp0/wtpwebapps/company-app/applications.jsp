<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.http.*, java.net.URI" %>
<%@ page import="com.fasterxml.jackson.databind.*" %>
<%@ page import="java.util.*" %>
<%@ page import="model.entity.InternshipApplication" %>
<%@ page import="model.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Details</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Materialize CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">

    <style>
    .container {
        margin-top: 20px;
    }

    .card {
        transition: transform 0.3s ease-in-out;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    table {
        width: 100%;
    }

    th, td {
        vertical-align: middle;
        font-size: 0.9rem;
    }

    .action-buttons {
        display: flex;
        gap: 6px;
        flex-wrap: wrap;
    }

    .badge {
        min-width: auto !important;
    }

    /* MOBILE CARD TABLE */
    @media only screen and (max-width: 600px) {

        .container {
            width: 95%;
        }

        .card-title {
            font-size: 1.4rem !important;
        }

        table,
        thead,
        tbody,
        th,
        td,
        tr {
            display: block;
            width: 100%;
        }

        thead {
            display: none;
        }

        tr {
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            margin-bottom: 15px;
            padding: 10px;
        }

        td {
            border: none;
            position: relative;
            padding: 8px 8px 8px 45%;
            text-align: left;
            min-height: 40px;
            word-break: break-word;
        }

        td:before {
            position: absolute;
            left: 10px;
            top: 8px;
            width: 40%;
            font-weight: bold;
            white-space: nowrap;
        }

        td:nth-of-type(1):before { content: "ID"; }
        td:nth-of-type(2):before { content: "Status"; }
        td:nth-of-type(3):before { content: "Student"; }
        td:nth-of-type(4):before { content: "Description"; }
        td:nth-of-type(5):before { content: "Actions"; }

        .action-buttons {
            flex-direction: column;
            gap: 8px;
        }

        .btn-small {
            width: 100%;
        }

        .new.badge {
            float: none !important;
        }
    }
</style>
</head>

<%
	User user = (User) request.getSession().getAttribute("user");
    String apiUrl = "http://localhost:8080/api/company/" +user.getId()+"/applications";

    List<InternshipApplication> applications = new ArrayList<>();

    try {
        HttpClient client = HttpClient.newHttpClient();

        HttpRequest httpRequest = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .GET()
                .build();

        HttpResponse<String> httpResponse =
                client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

        ObjectMapper mapper = new ObjectMapper();

        applications = Arrays.asList(
            mapper.readValue(httpResponse.body(), InternshipApplication[].class)
        );

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<body>

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

    <!-- CARD -->
    <div class="row">
        <div class="col s12">

            <div class="card hoverable">
                <div class="card-content">

                    <span class="card-title">
                        Internship Applications
                    </span>

                        <table class="highlight">

                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Status</th>
                                    <th>Student</th>
                                    <th>Description</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>

                            <%
                            int counter = 1;

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

                                <tr>

                                   <td>
									    <%= counter++ %>
									</td>

                                    <td>
                                        <span class="new badge <%= colorClass %>"
                                              data-badge-caption="">
                                            <%= status %>
                                        </span>
                                    </td>

                                    <td>
                                        <%= app.getStudentName() %>
                                    </td>

                                    <td>
                                        <%= app.getInternshipDescription() %>
                                    </td>

                                    <td>
                                        <div class="action-buttons">

                                            <button
                                                class="btn-small blue waves-effect"
                                                onclick="reviewApplication('<%= app.getId() %>')">
                                                Edit
                                            </button>

                                            <%
                                                if ("ACCEPTED".equalsIgnoreCase(status)) {
                                            %>

                                                <button
                                                    class="btn-small green waves-effect"
                                                    data-student-internship-id="<%= app.getStudentInternshipId() %>"
                                                    onclick="reviewStudentInternship(this)">
                                                    Review
                                                </button>

                                            <%
                                                }
                                            %>

                                        </div>
                                    </td>

                                </tr>

                            <%
                                }
                            %>

                            </tbody>

                        </table>


                </div>
            </div>

        </div>
    </div>

</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script>
    function reviewApplication(id) {
        window.location.href = "reviewApplication.jsp?id=" + id;
    }

    function reviewStudentInternship(btn) {
        const studentInternshipId = btn.dataset.studentInternshipId;

        window.location.href =
            "reviewStudentInternship.jsp?studentInternshipId=" +
            encodeURIComponent(studentInternshipId);
    }
</script>

</body>
</html>