package org.example.goSeoul.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.example.goSeoul.dao.FreeReplyDao;
import org.example.goSeoul.model.FreeReply;

@Service
public class FreeReplyService {
	@Autowired
	private FreeReplyDao rbd;

	public List<FreeReply> list(int num) {
		return rbd.list(num);
	}

	public void insert(FreeReply rb) {
		rbd.insert(rb);
	}

	public void delete(int rno) {
		rbd.delete(rno);
	}

	public void update(FreeReply rb) {
		rbd.update(rb);
	}
}