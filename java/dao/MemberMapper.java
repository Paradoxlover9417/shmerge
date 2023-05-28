package org.example.goSeoul.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public JoinMemberBean getInfo(String id) {
		return sqlSession.selectOne("getInfo", id);
	};

	public int delete(String id) {
		return sqlSession.delete("delete", id);
	};

	public int postEdit(JoinMemberBean dto) {
		return sqlSession.update("postEdit",dto);
	};

	
	/*
	 * public MembeBean edit(int no);
	 * 
	 * public int edit(int no);
	 */


}
