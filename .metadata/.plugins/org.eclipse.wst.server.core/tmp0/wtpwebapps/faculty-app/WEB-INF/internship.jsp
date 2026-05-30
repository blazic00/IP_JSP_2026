<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Internship" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Internships</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">

    <style>
        .container { margin-top: 30px; }
        .card { transition: transform 0.3s ease-in-out; }
        .card:hover { transform: translateY(-5px); }
        .btn { margin-top: 5px; }
        .card {
	    border-radius: 12px;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	    height: 100%;
	}
	
	.card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
	}
	
	.card-content p {
	    margin-bottom: 10px;
	}
	
	.card-title {
	    font-weight: 600;
	}
    </style>
</head>
<body>

<%
    // Data from servlet
    List<Internship> internships = (List<Internship>) request.getAttribute("internships");
    Internship internship = (Internship) request.getAttribute("internship"); // for edit
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
          
   <!-- INTERNSHIP CARDS -->
<div class="row">
    <% if (internships != null) {
           for (Internship i : internships) { %>

        <div class="col s12 m6 l4">
            <div class="card hoverable">

                <div class="card-content">
                    <span class="card-title">
                        <%= i.getCompany().getName() %>
                    </span>

                    <p>
                        <strong>Description:</strong><br>
                        <%= i.getDescription() %>
                    </p>

                    <br>

                    <p>
                        <strong>Technologies:</strong><br>
                        <%= i.getTechnologies() %>
                    </p>

                    <br>

                    <p>
                        <strong>Period:</strong><br>
                        <%= i.getStartDate() %> – <%= i.getEndDate() %>
                    </p>
                </div>

            </div>
        </div>

    <%   }
       } %>
</div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    M.AutoInit();
</script>

</body>
</html>
