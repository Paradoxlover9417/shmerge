package org.example.goSeoul.service;

import org.apache.ibatis.annotations.Param;
import org.example.goSeoul.dao.WithDao;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.model.WithReplyBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class WithService {

    @Autowired
    private WithDao withDao;

    // 동행글 저장
    public int insertCheck(WithBean wb) throws Exception {
        System.out.println("WithService_insertCheck");
        return withDao.insertCheck(wb);
    }

    public int getListCount() throws Exception {
        return withDao.getListCount();
    }

    public int getSearchCount(Map<String, Object> countMap) throws Exception {
        return withDao.getSearchCount(countMap);
    }

    public List<WithBean> getWithList(int page) throws Exception {
        return withDao.getWithList(page);
    }

    public List<WithBean> getSearchList(Map<String, Object> searchMap) throws Exception {
        return withDao.getSearchList(searchMap);
    }

    public void hit(int with_no) throws Exception {
        withDao.hit(with_no);
    }

    public WithBean getWithDetail(int with_no) throws Exception {
        WithBean with = withDao.getWithDetail(with_no);
        return with;
    }
    
    public int getReserveList(Map<String, Object> reserveMap) throws Exception {
    	return withDao.getReserveList(reserveMap);
    }

    public void insert(ReserveBean rb) throws Exception {
        withDao.insert(rb);
    }

    public void updateCurNo(int with_no) throws Exception {
        withDao.updateCurNo(with_no);
    }

    public void insertReply(WithReplyBean wrb) throws Exception {
        withDao.insertReply(wrb);
    }

    public List<WithReplyBean> getReplyList(int with_no) throws Exception {
        return withDao.getReplyList(with_no);
    }
    
    public int withReplyDelete(int withreply_no) throws Exception {
    	return withDao.withReplyDelete(withreply_no);
    }
    
    public int withUpdate(WithBean wb) throws Exception {
        return withDao.withUpdate(wb);
    }
    
    public int withDelete(int with_no) throws Exception {
    	return withDao.withDelete(with_no);
    }
    
    // rb
 	public WithBean getWithGo(Integer integer) {
 		return withDao.getWithGo(integer);
 	}
}
