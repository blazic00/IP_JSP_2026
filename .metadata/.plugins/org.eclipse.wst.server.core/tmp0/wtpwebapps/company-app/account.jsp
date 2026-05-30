<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Account</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Materialize CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
<!-- BACK BUTTON -->
    <div class="row">
        <div class="col s12">
            <a href="main"
               class="btn grey darken-2 waves-effect waves-light" style="margin-top: 20px">
                ←
            </a>
        </div>
    </div>
   
    <!-- Account Settings Tab -->
    <div id="accountSettings" class="card" style="margin-top: 30px;">
        <div class="card-content">
            <span class="card-title" style="text-align: center;">Account Settings</span>

            <!-- Change Password -->
            <h6>Change Password</h6>
            <form action="account" id="passwordForm" method="post">
                <div class="input-field">
                    <input type="password" name="currentPassword" id="currentPassword" required>
                    <label for="currentPassword">Current Password</label>
                </div>
                <div class="input-field">
                    <input type="password" name="newPassword" id="newPassword" required>
                    <label for="newPassword">New Password</label>
                </div>
                <div class="input-field">
                    <input type="password" id="confirmPassword" required>
                    <label for="confirmPassword">Confirm New Password</label>
                </div>
                <button class="btn waves-effect waves-light" type="submit">Submit</button>
            </form>

            <div class="divider" style="margin: 30px 0;"></div>
        </div>
    </div>

</div>

<% String error = (String) request.getAttribute("error"); %>

<!-- JavaScript -->
<script>

    const error = "<%= error %>";
    if (error === "invalid_password") {
        alert("Pogrešna trenutna lozinka. Pokušajte ponovo.");
    }

    async function hash(string) {
        const utf8 = new TextEncoder().encode(string);
        const hashBuffer = await crypto.subtle.digest('SHA-256', utf8);
        const hashArray = Array.from(new Uint8Array(hashBuffer));
        return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
    }

    document.getElementById("passwordForm").addEventListener("submit", async function (event) {
        event.preventDefault();
        const currentPassword = document.getElementById("currentPassword").value;
        const newPassword = document.getElementById("newPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        if (newPassword !== confirmPassword) {
            alert("Passwords are not matching");
            return;
        }

        document.getElementById("currentPassword").value = await hash(currentPassword);
        document.getElementById("newPassword").value = await hash(newPassword);
        this.submit();
    });

</script>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
