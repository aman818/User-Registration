<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
		<h1>Register</h1>
		<form action="RegisterServlet" method="post">
			<label for="username">Username:</label> <input type="text"
				id="username" name="username" required><br> <label
				for="email">Email:</label> <input type="text" id="username"
				name="email" required><br> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required><br>
			<label for="city">City:</label> <input type="text" id="city"
				name="city" required><br> <label for="state">State:</label>
			<input type="text" id="state" name="state" required><br>

			<label for="address">Address:</label> <input type="text" id="address"
				name="address" required><br>

			<button type="submit">Register</button>

		</form>

		<p>
			<a href="index.html">Back to Home</a>
		</p>

		<%-- Display error message if registration fails --%>
		<%
		String error = request.getParameter("error");
		if (error != null && error.equals("1")) {
		%>
		<p style="color: red;">Registration failed. Please try again.</p>
		<%
		}
		%>
	</div>

</body>

</html>