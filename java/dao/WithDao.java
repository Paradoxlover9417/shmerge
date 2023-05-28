package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WithDao {

    @Autowired
    private SqlSession session;

    // 동행글 저장
    public int insertCheck(WithBean wb) {
        System.out.println("WithDao_insertCheck");
        return session.insert("insertCheck", wb);
    }

    public int getListCount() throws Exception {
        int count = 0;
        count = ((Integer)session.selectOne("with_count")).intValue();
        return count;
    }

    public List<WithBean> getWithList(int page) throws Exception {
        List<WithBean> list = session.selectList("with_list", page);
        return list;
    }

    public void hit(int with_no) throws Exception {
        session.update("hit", with_no);
    }

    public WithBean getWithDetail(int with_no) throws Exception {
        return (WithBean) session.selectOne("with_detail", with_no);
    }

    public void insert(ReserveBean rb) throws Exception {
        session.insert("reserve", rb);
    }
}
