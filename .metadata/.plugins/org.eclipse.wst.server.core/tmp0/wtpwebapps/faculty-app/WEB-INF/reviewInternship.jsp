<%@page import="java.net.http.HttpClient"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.http.*, java.net.URI" %>
<%@ page import="com.fasterxml.jackson.databind.*" %>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Evaluation</title>

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
        transition: transform 0.3s ease-in-out;
        border-radius: 12px;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .worklog-container {
        max-height: 400px;
        overflow-y: auto;
        padding-right: 10px;
    }

    .worklog-item {
        border-bottom: 1px solid #e0e0e0;
        padding: 12px 0;
    }

    .worklog-item:last-child {
        border-bottom: none;
    }

    .title {
        font-weight: bold;
        font-size: 16px;
    }

    .week {
        color: gray;
        font-size: 13px;
        margin-bottom: 5px;
    }

    textarea {
        min-height: 140px;
    }

    .save-btn {
        margin-top: 10px;
    }

    .back-button {
        margin-bottom: 15px;
    }

    /* MOBILE */
    @media only screen and (max-width: 600px) {

        .container {
            width: 95%;
        }

        h4 {
            font-size: 1.7rem;
        }

        .card-title {
            font-size: 1.3rem !important;
        }

        .title {
            font-size: 15px;
        }

        .week {
            font-size: 12px;
        }

        .worklog-item p {
            font-size: 0.9rem;
        }

        textarea {
            min-height: 120px;
            font-size: 0.95rem;
        }

        .btn {
            width: 100%;
            font-size: 0.85rem;
        }

        .worklog-container {
            max-height: 350px;
            padding-right: 0;
        }
    }

</style>

</head>

<%
    InternshipStudentEvaluation studentInternship =
            (InternshipStudentEvaluation)
            request.getAttribute("studentInternship");

    String studentInternshipId =
            (String) request.getAttribute("studentInternshipId");
%>

<body>

<div class="container">

    <!-- BACK BUTTON -->
    <div class="back-button">

        <a href="evaluate"
           class="btn grey darken-2 waves-effect waves-light"
           style="display:inline-block;width:auto;padding:0 16px;">

            ←

        </a>

    </div>

    <!-- TITLE -->
    <h4 class="center-align">
        Student Internship Review
    </h4>

    <!-- WORKLOG CARD -->
    <div class="card hoverable">

        <div class="card-content">

            <span class="card-title">
                Work Logs
            </span>

            <div class="worklog-container">

                <%
                    if (studentInternship != null &&
                        studentInternship.getWorkLogList() != null &&
                        !studentInternship.getWorkLogList().isEmpty()) {

                        List<WorkLog> logs =
                                studentInternship.getWorkLogList();

                        logs.sort(
                            Comparator.comparing(
                                WorkLog::getWeek,
                                Comparator.nullsLast(
                                    Comparator.naturalOrder()
                                )
                            ).reversed()
                        );

                        for (WorkLog log : logs) {
                %>

                    <div class="worklog-item">

                        <div class="title">
                            <%= log.getTitle() %>
                        </div>

                        <div class="week">
                            Week: <%= log.getWeek() %>
                        </div>

                        <p>
                            <%= log.getDescription() %>
                        </p>

                    </div>

                <%
                        }

                    } else {
                %>

                    <p>No work logs found.</p>

                <%
                    }
                %>

            </div>

        </div>

    </div>

    <!-- COMPANY COMMENT CARD -->
    <div class="card hoverable">

        <div class="card-content">

            <span class="card-title">
                Evaluation Comment
            </span>

            <div class="input-field">

                <textarea
                    name="comment"
                    class="materialize-textarea"
                    disabled="disabled"
                    placeholder="Company evaluation..."><%=

                    studentInternship != null
                    ? (studentInternship.getCompanyEvaluation() != null
                        ? studentInternship.getCompanyEvaluation()
                        : "")
                    : ""

                %></textarea>

            </div>

        </div>

    </div>

    <!-- GRADE CARD -->
    <div class="card hoverable">

        <div class="card-content">

            <span class="card-title">
                Evaluation Grade
            </span>

            <form method="POST"
                  action="reviewStudentInternship">

                <div class="input-field">

                    <input
                        type="number"
                        name="grade"
                        min="5"
                        max="10"
                        step="1"

                        value="<%=

                            studentInternship != null
                            ? (studentInternship.getGrade() != null
                                ? studentInternship.getGrade()
                                : "")
                            : ""

                        %>"

                        placeholder="Enter grade (5-10)"

                        <% if(studentInternship == null){ %>
                            disabled="disabled"
                        <% } %>

                        required
                    >

                </div>

                <input
                    type="hidden"
                    name="studentInternshipId"
                    value="<%= studentInternshipId %>"
                />

                <div class="center-align">

                    <button
                        type="submit"
                        class="btn green waves-effect waves-light save-btn"

                        <% if(studentInternship == null){ %>
                            disabled="disabled"
                        <% } %>
                    >

                        Save Evaluation

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>