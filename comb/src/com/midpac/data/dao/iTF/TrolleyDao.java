package com.midpac.data.dao.iTF;

import com.midpac.model.Trolley;

import java.util.List;

public interface TrolleyDao {
    boolean addTrolley(Trolley trolley);
    boolean deleteTrolley(Trolley trolley);
    boolean updateTrolley(Trolley trolley);
    Trolley getTrolleyById(Trolley trolley);
    List getTrolleysByUid(int uid);
    List getTrolleys();

}
