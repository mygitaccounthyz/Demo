package com.midpac.data.service;


import com.midpac.data.dao.imp.CommentDaoImp;
import com.midpac.model.Comment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {
    @Resource
    private CommentDaoImp commentDaoImp;

    public boolean addComment(Comment comment){
        if (comment==null)return false;
        return commentDaoImp.addComment(comment);
    }
    public boolean deleteComment(Comment comment){
        if (comment==null||comment.getId()<1)return false;
        return commentDaoImp.deleteComment(comment);
    }
    public boolean updateComment(Comment comment){
        if (comment==null||comment.getId()<1)return false;
        return commentDaoImp.updateComment(comment);
    }
    public Comment getComment(Comment comment){
        if (comment==null||comment.getId()<1)return null;
        return commentDaoImp.getComment(comment);
    }
    public List getComments(){
        return commentDaoImp.getComments();
    }

    public List getCommentsByUid(int uid){
        if (uid<1)return new ArrayList();
        return commentDaoImp.getCommentsByUid(uid);
    }
    public List getCommentsByGid(int gid){
        if (gid<1)return new ArrayList();
        return commentDaoImp.getCommentsByGid(gid);
    }
}
