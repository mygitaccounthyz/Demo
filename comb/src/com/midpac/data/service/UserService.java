package com.midpac.data.service;


import com.midpac.data.dao.imp.UserDaoImp;
import com.midpac.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService {
    @Resource
    private  UserDaoImp userDaoImp;

    
    public boolean addUser(User user) {
        if (user==null||user.getPass()==null||user.getName()==null)return false;
        return userDaoImp.addUser(user);
    }

    
    public boolean deleteUser(User user) {
        if (user==null||user.getUid()<1)return false;
        return userDaoImp.deleteUser(user);
    }

    
    public boolean updateUser(User user) {
        if (user==null||user.getUid()<1)return false;
        return userDaoImp.updateUser(user);
    }

    public User getUser(User user){
        if (user==null||user.getUid()<1)return null;
        return userDaoImp.getUser(user);
    }

    
    public User getUserByNameAndPass(User user) {
        if (user==null||user.getPass()==null||user.getName()==null)return null;
        return userDaoImp.getUserByNameAndPass(user);
    }

    public User getUserByName(String name){
        if (name==null)return null;
        return userDaoImp.getUserByName(name);
    }
}
