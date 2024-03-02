package com.aman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aman.util.DBUtil;




public class UserDaoImpl implements UserDao {
	 @Override
	    public boolean addUser(User user) {
		 String query = "INSERT INTO users (username, email, password, city, state, address) VALUES (?, ?, ?, ?, ?, ?)";

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	            preparedStatement.setString(1, user.getUsername());
	            preparedStatement.setString(2, user.getEmail());
	            preparedStatement.setString(3, user.getPassword());
	            preparedStatement.setString(4, user.getCity());
	            preparedStatement.setString(5, user.getState());
	            preparedStatement.setString(6, user.getAddress());
	            int rowsAffected = preparedStatement.executeUpdate();

	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public boolean isValidUser(String username, String password) {
	        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
	    	 try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	            preparedStatement.setString(1, username);
	            preparedStatement.setString(2, password);

	            ResultSet resultSet = preparedStatement.executeQuery();

	            return resultSet.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public List<User> getAllUsers() {
	        List<User> userList = new ArrayList<>();
	        String query = "SELECT * FROM users";

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query);
	             ResultSet resultSet = preparedStatement.executeQuery()) {

	            while (resultSet.next()) {
	                User user = new User();
	                user.setUsername(resultSet.getString("username"));
	                user.setEmail(resultSet.getString("email"));
	                user.setPassword(resultSet.getString("password"));
	                user.setCity(resultSet.getString("city"));
	                user.setState(resultSet.getString("state"));
	                user.setAddress(resultSet.getString("address"));
	                userList.add(user);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return userList;
	    }
	}