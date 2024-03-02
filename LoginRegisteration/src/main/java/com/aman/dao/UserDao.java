// UserDao.java
package com.aman.dao;

import java.util.List;

public interface UserDao {
    boolean addUser(User user);
    boolean isValidUser(String username, String password);
    List<User> getAllUsers();
}
