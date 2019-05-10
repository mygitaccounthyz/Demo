package com.midpac.data.dao.iTF;

import com.midpac.model.Comment;

import java.util.List;

public interface CommentDao {
    boolean addComment(Comment comment);
    boolean deleteComment(Comment comment);
    boolean updateComment(Comment comment);
    Comment getComment(Comment comment);
    List getComments();

    List getCommentsByUid(int uid);
    List getCommentsByGid(int gid);
}
