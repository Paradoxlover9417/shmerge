package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.QuestionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao {

    @Autowired
    private SqlSession sqlSession;


    public int questionInsert(QuestionBean qb) {
        return sqlSession.insert("questionInsert",qb);
    }
}
