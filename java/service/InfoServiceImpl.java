package org.example.goSeoul.service;

import org.example.goSeoul.dao.MemberMapper;
import org.example.goSeoul.model.JoinMemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class InfoServiceImpl{

	@Autowired
	 private MemberMapper mapper;
	  
	/*
	 * @Override public List<MemberBean> getInfo() { return mapper.getInfo(); }
	 */

		public JoinMemberBean getInfo(String id) {
			return mapper.getInfo(id);
		}

		public int delete(String id) {
			return mapper.delete(id);
		}

		public int postEdit(JoinMemberBean dto) {
			return mapper.postEdit(dto);
		}

		public JoinMemberBean getEdit(String id) {
			JoinMemberBean dto = mapper.getInfo(id);
			return dto;
		}

	/*
	 * @Override public int edit(MemberBean dto) { return mapper.edit(dto); }
	 * 
	 * @Override public MemberBean edit(int no) { MemberBean dto = mapper.edit(no);
	 * return dto; }
	 */

	    
	    
	    
	 
}

/*
 * @Log4j
 * 
 * @Service
 * 
 * @AllArgsConstructor public class BoardServiceImpl implements BoardService{
 * private BoardMapper mapper;
 * 
 * @Override public void register(BoardVO board) { log.info("register......." +
 * board); mapper.insertSelectKey(board); }
 * 
 * @Override public List<BoardVO> getList() { log.info("getList.......");
 * 
 * return mapper.getList(); }
 * 
 * @Override public BoardVO get(Long bno) { log.info("get......" + bno);
 * 
 * return mapper.read(bno); }
 * 
 * @Override public boolean modify(BoardVO board) { log.info("modify......." +
 * board);
 * 
 * return mapper.update(board) == 1; }
 * 
 * @Override public boolean remove(Long bno) { log.info("remover......." + bno);
 * 
 * return mapper.delete(bno) == 1; } }
 */