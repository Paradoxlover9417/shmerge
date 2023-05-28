package org.example.goSeoul.dao;

import jdk.nashorn.internal.runtime.ECMAException;
import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Autowired
    private SqlSession sqlSession;

    // 로그인 인증 체크
    public MemberBean checkLogin(String id) throws Exception {
        return sqlSession.selectOne("checkLogin", id);
    }

    public MemberBean findMemberId(MemberBean dto) throws Exception {
        return sqlSession.selectOne("findMemberId", dto);
    }

    public void updatePass(MemberBean dto) throws Exception {
        sqlSession.update("updatePass", dto);
    }

    public MemberBean searchPwd (MemberBean dto) throws Exception {
        return sqlSession.selectOne("searchPwd", dto);
    }

    public String concat(MemberBean dto) throws Exception {
        return sqlSession.selectOne("concat", dto);
    }
}