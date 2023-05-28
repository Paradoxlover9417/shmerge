package org.example.goSeoul.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberBean getInfo(String id) {
		return sqlSession.selectOne("getInfo", id);
	};

	public int delete(String id) {
		return sqlSession.delete("delete", id);
	};

	public int postEdit(MemberBean dto) {
		return sqlSession.update("postEdit",dto);
	};

	// 로그인 인증체크
	public MemberBean userCheck(String id) {
		return sqlSession.selectOne("login_check", id);
	}

	public List<Integer> getMyReserve(String id) {
		return sqlSession.selectList("getMyReserve", id);
	}


	
	/*
	 * public MembeBean edit(int no);
	 * 
	 * public int edit(int no);
	 */


}
