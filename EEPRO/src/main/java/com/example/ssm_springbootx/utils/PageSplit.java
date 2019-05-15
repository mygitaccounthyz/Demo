package com.example.ssm_springbootx.utils;

import java.util.ArrayList;
import java.util.List;

public class PageSplit {

    public static List getPage(List list,int pagesize,int index){
        if (list==null||list.isEmpty()||pagesize<1)return new ArrayList();

        List res =new ArrayList();
        int size = list.size();
        int tp = (size + pagesize - 1) / pagesize;

        if (index<1)index=1;

        if (index>=tp){
            for (int i = (tp-1)*pagesize; i < list.size(); i++) {
                res.add(list.get(i));
            }
        }else {
            for (int i = (index-1)*pagesize; i < index*pagesize; i++) {
                res.add(list.get(i));
            }
        }
        return res;
    }
}
