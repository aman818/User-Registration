package com.aman.servlet;

import jakarta.servlet.ServletException;
/*import jakarta.servlet.annotation.WebServlet;*/
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.aman.dao.User;
import com.aman.dao.UserDao;
import com.aman.dao.UserDaoImpl;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static UserDao userDao = new UserDaoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String address = request.getParameter("address");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setCity(city);       // Set city value
        user.setState(state);     // Set state value
        user.setAddress(address); // Set address value

       
		//UserDao userDao = new UserDaoImpl();
        if (userDao.addUser(user)) {
            response.sendRedirect("login.jsp?registration=success");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }

}
