package org.example.goSeoul.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.example.goSeoul.model.FreeReply;

@Repository
public class FreeReplyDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<FreeReply> list(int bno) {
		return sst.selectList("rbns.list", bno);
	}

	public void insert(FreeReply rb) {
		sst.insert("rbns.insert", rb);
	}

	public void delete(int rno) {
		sst.delete("rbns.delete", rno);
	}

	public void update(FreeReply rb) {
		sst.update("rbns.update", rb);
	}
}