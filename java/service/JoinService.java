package org.example.goSeoul.service;

import org.example.goSeoul.dao.JoinDao;
import org.example.goSeoul.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {

    @Autowired
    private JoinDao dao;
    
    public void insert(MemberBean member) throws Exception {
        dao.insert(member);
    }
    public int checkMemberId(String id) throws Exception{
        int result = dao.checkMemberId(id);
        return result;
    }
    public int checkMemberNick(String nick) throws Exception{
        int result = dao.checkMemberNick(nick);
        return result;
    }
}
