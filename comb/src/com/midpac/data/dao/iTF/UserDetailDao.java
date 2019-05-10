package com.midpac.data.dao.iTF;

import com.midpac.model.Userdetail;

import java.util.List;

public interface UserDetailDao {
    boolean addUserDetail(Userdetail userDetail);
    boolean deleteUserDetail(Userdetail userDetail);
    boolean updateUserDetail(Userdetail userDetail);
    Userdetail getUserDetail(Userdetail userDetail);
    List getUserDetailsByUId(int uid);
}
