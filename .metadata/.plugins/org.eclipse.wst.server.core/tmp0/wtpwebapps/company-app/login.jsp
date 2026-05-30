<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
		<div class="container">
        <div class="row">
            <div class="col s12 m8 offset-m2 l6 offset-l3">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align">Login</span>
                        <form id="loginForm" action="login" method="post">
                            <div class="input-field">
                                <input id="username" name="username" type="text" required>
                                <label for="username">Username</label>
                            </div>
                            <div class="input-field">
                                <input id="password" name="password" type="password" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light" type="submit">Login</button>
                            </div>           
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% String error = request.getParameter("error"); %>
   <script>
		  async function hash(string) {
		  const utf8 = new TextEncoder().encode(string);
		  const hashBuffer = await crypto.subtle.digest('SHA-256', utf8);
		  const hashArray = Array.from(new Uint8Array(hashBuffer));
		  const hashHex = hashArray
		    .map((bytes) => bytes.toString(16).padStart(2, '0'))
		    .join('');
		  return hashHex;
		}
		  
		  const error = "<%= error %>";
			 if (error === "invalid_credentials") {
			   alert("Wrong credentials! Try again.");
			 } 
		
		document.getElementById("loginForm").addEventListener("submit", async function(event) {
		  event.preventDefault(); // stop form submission temporarily
		  const passwordInput = document.getElementById("password").value;
		  const hashPass = await hash(passwordInput); // wait for the hash
		  console.log(hashPass);
		
		 
		  document.getElementById("password").value = hashPass;
		
		  this.submit(); // now submit the form
		});

	</script> 
</body>
</html>