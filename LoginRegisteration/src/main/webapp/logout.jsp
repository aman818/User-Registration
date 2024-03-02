<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout Page</title>
</head>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<body>
    <%
        // Retrieve the session object
        HttpSession currentSession = request.getSession(false);

        if(currentSession != null){
        	currentSession.invalidate();
        }
        
        response.sendRedirect("login.html");
    %>


</body>

</html>