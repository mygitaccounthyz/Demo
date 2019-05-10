package com.midpac.data.service;


import com.midpac.data.dao.imp.UserDetailDaoImp;
import com.midpac.model.Userdetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class UserDetailService {
    @Resource
    private UserDetailDaoImp userDetailDaoImp;

    
    public boolean addUserDetail(Userdetail userDetail) {
        if (userDetail==null)return false;
        return userDetailDaoImp.addUserDetail(userDetail);
    }

    
    public boolean deleteUserDetail(Userdetail userDetail) {
        if (userDetail==null||userDetail.getDid()<1)return false;
        return userDetailDaoImp.deleteUserDetail(userDetail);
    }

    
    public boolean updateUserDetail(Userdetail userDetail) {
        if (userDetail==null||userDetail.getDid()<1)return false;
        return userDetailDaoImp.updateUserDetail(userDetail);
    }

    public Userdetail getUserDetail(Userdetail userdetail){
        if (userdetail==null||userdetail.getDid()<1)return null;
        return userDetailDaoImp.getUserDetail(userdetail);
    }

    
    public List getUserDetailsByUId(Integer uid) {
        if (uid==null)return new ArrayList();
        return userDetailDaoImp.getUserDetailsByUId(uid);
    }
    
}
