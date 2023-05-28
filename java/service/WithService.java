package org.example.goSeoul.service;

import org.example.goSeoul.dao.WithDao;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<WithBean> getWithList(int page) throws Exception {
        return withDao.getWithList(page);
    }

    public void hit(int with_no) throws Exception {
        withDao.hit(with_no);
    }

    public WithBean getWithDetail(int with_no) throws Exception {
        WithBean with = withDao.getWithDetail(with_no);
        return with;
    }

    public void insert(ReserveBean rb) throws Exception {
        withDao.insert(rb);
    }
}
