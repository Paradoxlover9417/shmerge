package org.example.goSeoul.controller;

import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService service;

	@GetMapping("memberInfo.do")
	public String getInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		
		MemberBean dto = service.getInfo(id);
		// List<MemberBean> list = service.getInfo();
		model.addAttribute("info", dto);

		return "member/memberInfo";
	}

	@PostMapping("/delete")
	// 의미가 없지만 의미가 있다
	public String postdel(HttpSession session, String id) {
		service.delete(id);
		System.out.println("삭제성공");
		session.invalidate();
		return "main";
	}

	@GetMapping("/memberEdit.do")
	public String getEdit(String id, Model model) {
		MemberBean dto = service.getInfo(id);
		model.addAttribute("edit", dto);

		return "member/memberEdit";
	}

	@PostMapping("/memberEdit.do")
	public String postEdit(MemberBean dto, HttpSession session, Model model) {
		service.postEdit(dto);
		
		String id = (String)session.getAttribute("id");
		
		dto = service.getInfo(id);
		model.addAttribute("info", dto);
		return "member/memberInfo";
	}
}
