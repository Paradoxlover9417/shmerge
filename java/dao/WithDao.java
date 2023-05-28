package org.example.goSeoul.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.model.WithReplyBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public int getSearchCount(Map<String, Object> countMap) throws Exception {
        int count = 0;
        System.out.println("countMap: " + countMap);
        count = ((Integer)session.selectOne("with_searchcount", countMap)).intValue();
        System.out.println("count: " + count);
        return count;
    }

    public List<WithBean> getWithList(int page) throws Exception {
        List<WithBean> list = session.selectList("with_list", page);
        return list;
    }

    public List<WithBean> getSearchList(Map<String, Object> searchMap) throws Exception {
        System.out.println("searchMap: " + searchMap);
        List<WithBean> searchList = session.selectList("with_searchlist", searchMap);
        return searchList;
    }

    public void hit(int with_no) throws Exception {
        session.update("hit", with_no);
    }

    public WithBean getWithDetail(int with_no) throws Exception {
        return (WithBean) session.selectOne("with_detail", with_no);
    }
    
    public int getReserveList(Map<String, Object> reserveMap) throws Exception {
    	return session.selectOne("reserveList", reserveMap);
    }

    public void insert(ReserveBean rb) throws Exception {
        session.insert("reserve", rb);
    }

    public void updateCurNo(int with_no) throws Exception {
        session.update("updateCurNo", with_no);
    }

    public void insertReply(WithReplyBean wrb) throws Exception {
        session.insert("insertReply", wrb);
    }

    public List<WithReplyBean> getReplyList(int with_no) throws Exception {
        List<WithReplyBean> replyList = session.selectList("with_replylist", with_no);
        return replyList;
    }
    
    public int withReplyDelete(int withreply_no) throws Exception {
    	return session.delete("withReplyDelete", withreply_no);
    }
    
    public int withUpdate(WithBean wb) throws Exception {
        return session.update("withUpdate", wb);
    }
    
    public int withDelete(int with_no) throws Exception {
    	return session.delete("withDelete", with_no);
    }
    
    //rb
    public WithBean getWithGo(Integer with_no) {
    	System.out.println(with_no);
		return session.selectOne("getWithGo", with_no);
	}
}
