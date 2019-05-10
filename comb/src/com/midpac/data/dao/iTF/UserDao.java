package com.midpac.data.dao.iTF;


import com.midpac.model.User;

public interface UserDao {
    boolean addUser(User user);
    boolean deleteUser(User user);
    boolean updateUser(User user);
    User getUser(User user);
    User getUserByNameAndPass(User user);
}
