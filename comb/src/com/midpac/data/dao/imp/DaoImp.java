package com.midpac.data.dao.imp;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;

@Component
public class DaoImp <T> {
    @Resource
   private HibernateTemplate hibernateTemplate;

   public boolean addT(T t){
       try {
           hibernateTemplate.save(t);
           return true;
       } catch (DataAccessException e) {
           e.printStackTrace();
       }
       return false;
   }

    public boolean deleteT(T t) {
       try {
           hibernateTemplate.delete(t);
           return true;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return false;
   }

    public boolean updateT(T t) {
       try {
           hibernateTemplate.update(t);
           return true;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return false;
   }

    public T getT(Class<T> t,int id){
       try {

           return hibernateTemplate.get(t, id);
       } catch (Exception e) {
           e.printStackTrace();
       }
       return null;
   }

}
