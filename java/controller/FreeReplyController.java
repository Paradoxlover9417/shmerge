package org.example.goSeoul.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.FreeReply;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.FreeReplyService;
import org.example.goSeoul.service.FreeService;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeReplyController {
	@Autowired
	private FreeReplyService rbs;
	@Autowired
	private FreeService bs;	
	@Autowired
	private MemberService memberService;

	// 댓글 목록 구하기
	@RequestMapping("slist.do")
	public String slist(int num, Model model) throws Exception {
		FreeBean freeBean = bs.numSelect(num);				// 부모글 상세정보
		List<FreeReply> slist = rbs.list(num);		// 댓글목록 구해오기
		model.addAttribute("slist", slist);
		model.addAttribute("freeBean", freeBean);
		
		// slist.jsp 파일에 출력되는 결과가 callback함수로 리턴된다.
		return "free/freeReplyList";
	}
	
	// 댓글 작성
	@RequestMapping("sInsert.do")
	public String sInsert(FreeReply rb, Model model, HttpSession session) throws Exception{
		System.out.println("sInsert.do 진입");
//		System.out.println(rb.getFreereply_nick());
		
		String id = (String)session.getAttribute("id");
		
		MemberBean memberBean = memberService.checkLogin(id);
		
		rb.setFreereply_nick(memberBean.getNick());		
		
		rbs.insert(rb);
		
		// 댓글을 insert한 후에 댓글목록을 요청한다.
		return "redirect:slist.do?num=" + rb.getFree_no();
	}

	// 댓글 삭제
	@RequestMapping("repDelete.do")
	public String delete(FreeReply rb, Model model) {
		System.out.println("repDelete.do 진입");
		System.out.println("freereply_no:"+ rb.getFreereply_no());
		System.out.println("free_no:"+ rb.getFree_no());
		
		rbs.delete(rb.getFreereply_no());				// 댓글 delete sql문 실행

		// 댓글을 delete 한후에 댓글목록을 요청한다.
		return "redirect:slist.do?num=" + rb.getFree_no();
	}

	// 댓글 수정
	@RequestMapping("repUpdate.do")
	public String repUpdate(FreeReply rb, Model model) {
		System.out.println("repUpdate.do 진입");
		rbs.update(rb);			// 댓글 update SQL문 실행
		
		// 댓글을 update한 후에 댓글목록을 요청한다.
		return "redirect:slist.do?num=" + rb.getFree_no();
	}
	
	
	
	
	
	
	
	
	
}