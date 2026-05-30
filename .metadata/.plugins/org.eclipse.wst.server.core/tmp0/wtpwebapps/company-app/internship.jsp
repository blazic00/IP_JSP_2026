<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Internship" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Internship Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">

    <style>
        .container { margin-top: 30px; }
        .card { transition: transform 0.3s ease-in-out; }
        .card:hover { transform: translateY(-5px); }
        .btn { margin-top: 5px; }
        table th, table td { font-size: 0.9rem; }
    </style>
</head>


<script>
<%
String error = (String) request.getAttribute("errorMessage");
if (error != null) {
%>
    alert("<%= error %>");
<%
}
%>

</script>
<body>

<%
    // Data from servlet
    List<Internship> internships = (List<Internship>) request.getAttribute("internships");
    Internship internship = (Internship) request.getAttribute("internship"); // for edit
%>

<div class="container">

	<div class="row">
	    <div class="col s12">
	        <a href="main" 
	           class="btn grey darken-2 waves-effect waves-light">
	            ←
	        </a>
	    </div>
	</div>
    <!-- CREATE / UPDATE FORM -->
    <div class="row">
        <div class="col s12">
            <div class="card hoverable">
                <div class="card-content">
                    <span class="card-title">
                        <%= (internship != null) ? "Edit Internship" : "Create Internship" %>
                    </span>

					<form action="internships" method="post">
				    <% if(internship != null){ %>
				        <input type="hidden" name="id" value="<%= internship.getId() %>">
				        <input type="hidden" name="_method" value="put">
				    <% } %>
                        <div class="input-field">
                            <input id="description" name="description" type="text" required
                                   value="<%= internship != null ? internship.getDescription() : "" %>">
                            <label class="active">Description</label>
                        </div>

                        <div class="input-field">
                            <input id="technologies" name="technologies" type="text" required
                                   value="<%= internship != null ? internship.getTechnologies() : "" %>">
                            <label class="active">Technologies</label>
                        </div>

                        <div class="row">
                            <div class="input-field col s12 m6">
                                <input type="date" name="startDate"
                                       value="<%= internship != null ? internship.getStartDate() : "" %>">
                                <label class="active">Start Date</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input type="date" name="endDate"
                                       value="<%= internship != null ? internship.getEndDate() : "" %>">
                                <label class="active">End Date</label>
                            </div>
                        </div>

                        <div class="input-field">
                            <textarea name="requirements" class="materialize-textarea"><%= internship != null ? internship.getRequirements() : "" %></textarea>
                            <label class="active">Additional Requirements</label>
                        </div>

                        <div class="input-field">
                            <textarea name="constraints" class="materialize-textarea"><%= internship != null ? internship.getConstraints() : "" %></textarea>
                            <label class="active">Constraints</label>
                        </div>

                        <button type="submit" class="btn green waves-effect waves-light">
                            Save
                        </button>
                        <a href="internships" class="btn grey waves-effect waves-light">
                            Clear
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- READ / DELETE CARDS -->
<div class="row">
    <div class="col s12">
        <div class="card hoverable">
            <div class="card-content">
                <span class="card-title">Existing Internships</span>

                <div class="row">

                    <% if (internships != null) {
                           for (Internship i : internships) { %>

                        <div class="col s12 m6 l4">
                            <div class="card blue-grey lighten-5 hoverable small">

                                <div class="card-content">
                                    <span class="card-title" style="font-size:1.2rem;">
                                        <%= i.getDescription() %>
                                    </span>

                                    <p>
                                        <strong>Technologies:</strong><br>
                                        <%= i.getTechnologies() %>
                                    </p>

                                    <br>

                                    <p>
                                        <strong>Period:</strong><br>
                                        <%= i.getStartDate() %> – <%= i.getEndDate() %>
                                    </p>

                                    <% if(i.getRequirements() != null &&
                                          !i.getRequirements().isEmpty()) { %>

                                        <br>

                                        <p>
                                            <strong>Requirements:</strong><br>
                                            <%= i.getRequirements() %>
                                        </p>

                                    <% } %>

                                    <% if(i.getConstraints() != null &&
                                          !i.getConstraints().isEmpty()) { %>

                                        <br>

                                        <p>
                                            <strong>Constraints:</strong><br>
                                            <%= i.getConstraints() %>
                                        </p>

                                    <% } %>
                                </div>

                                <div class="card-action">
                                    <a href="internships?edit=<%= i.getId() %>"
                                       class="btn-small blue waves-effect waves-light">
                                        Edit
                                    </a>

                                    <a href="internships?delete=<%= i.getId() %>"
                                       class="btn-small red waves-effect waves-light"
                                       onclick="return confirm('Delete this internship?')">
                                        Delete
                                    </a>
                                </div>

                            </div>
                        </div>

                    <%   }
                       } %>

                </div>

            </div>
        </div>
    </div>
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    M.AutoInit();
</script>

</body>
</html>
