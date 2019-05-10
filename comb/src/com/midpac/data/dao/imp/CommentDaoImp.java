package com.midpac.data.dao.imp;


import com.midpac.data.dao.iTF.CommentDao;
import com.midpac.model.Comment;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CommentDaoImp implements CommentDao {
    @Resource
    private DaoImp<Comment> daoImp;
    @Resource
    private HibernateTemplate hibernateTemplate;


    @Override
    public boolean addComment(Comment comment) {
        return daoImp.addT(comment);
    }

    @Override
    public boolean deleteComment(Comment comment) {
        return daoImp.deleteT(comment);
    }

    @Override
    public boolean updateComment(Comment comment) {
        return daoImp.updateT(comment);
    }

    @Override
    public Comment getComment(Comment comment) {
        return daoImp.getT(Comment.class,comment.getId());
    }

    @Override
    public List getComments() {
        try {

            String hql="from Comment";
            return hibernateTemplate.find(hql);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getCommentsByUid(int uid) {
        try {

            String hql="from Comment where uid =?";
            return hibernateTemplate.find(hql,uid);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getCommentsByGid(int gid) {
        try {

            String hql="from Comment where gid=?";

            return hibernateTemplate.find(hql,gid);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }
}
