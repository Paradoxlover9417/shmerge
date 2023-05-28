package org.example.goSeoul.service;

import jdk.nashorn.internal.runtime.ECMAException;
import org.example.goSeoul.dao.MemberDao;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDao dao;

    public MemberBean checkLogin(String id) throws Exception {
        return dao.checkLogin(id);
    }

    public MemberBean findMemberId(MemberBean dto) throws Exception {
        return dao.findMemberId(dto);
    }
    public void updatePass(MemberBean dto) throws Exception {
        dao.updatePass(dto);
    }
    public MemberBean searchPwd(MemberBean dto) throws Exception {
        return dao.searchPwd(dto);
    }

    public String concat(MemberBean dto) throws Exception {
        return dao.concat(dto);
    }
}
