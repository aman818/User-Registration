<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.aman.dao.User"%>
<%@ page import="com.aman.dao.UserDao"%>
<%@ page import="com.aman.dao.UserDaoImpl"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>


<body>
	<%
	// Retrieve the session object
	HttpSession session1 = request.getSession(false);

	// Check if the session is not null and the username attribute is set
	if (session1 != null && session1.getAttribute("username") != null) {
		// Get the username from the session
		String username = (String) session1.getAttribute("username");

		// Fetch user data from the database
		UserDao userDao = new UserDaoImpl();
		List<User> userList = userDao.getAllUsers();
		List<User> userList1 = userList.stream().filter(P -> P.getUsername() != username).collect(Collectors.toList());
	%>

	<div class="container">
		<h1>
			Welcome,
			<%=username%>!
		</h1>

		<table border="1">
			<tr>
				<th>Username</th>
				<!-- <th>Email</th>
				<th>Password</th> -->
				<th>City</th>
				<th>State</th>
				<th>Address</th>
			</tr>

			<%-- <% 
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/mytable";
                String usernameDB = "root";
                String passwordDB = "admin";

                try {
                    // Establish the database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(url, usernameDB, passwordDB);

                    // Create and execute the SQL query
                    Statement statement = connection.createStatement();
                    String query = "SELECT * FROM mytable";
                    ResultSet resultSet = statement.executeQuery(query);

                    // Iterate through the result set and display data in the table
                    while (resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getString("username") %></td>
                            <td><%= resultSet.getString("email") %></td>
                            <td><%= resultSet.getString("password") %></td>
                        </tr>
            <%
                    }

                    // Close resources
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table> 

        You can <a href="logout.jsp">LOGOUT</a> securely.
    </div>--%>
			<%
			UserDao userDao1 = new UserDaoImpl();
			List<User> userList2 = userDao1.getAllUsers();
			System.out.println("User List Size: " + userList.size());
			%>
			<%
			for (User user : userList1) {
				if (user.getUsername().equals(username)) {

				} else {
			%>
			<tr>
				<td><%=user.getUsername()%></td>
				<%-- <td><%=user.getEmail()%></td>
				<td><%=user.getPassword()%></td> --%>
				<td><%=user.getCity()%></td>
				<td><%=user.getState()%></td>
				<td><%=user.getAddress()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>

		You can <a href="logout.jsp">LOGOUT</a> securely.
	</div>

	<%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>

</body>
</html>
