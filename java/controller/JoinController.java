package org.example.goSeoul.controller;

import javax.servlet.http.HttpServletRequest;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JoinController {

    @Autowired
    private JoinService service;
    //  회원가입
    @RequestMapping("/member_form.do")
    public String member_form() {
        return "member/member_form";
    }

   //  ID 중복검사;	// method = requestmethod." post " ( get은 list만 )
    @RequestMapping(value="/member_idcheck.do", method = RequestMethod.POST)
    public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception{

        int result = service.checkMemberId(id);
        model.addAttribute("result", result);
        return "member/idcheckResult";
    }

    //  Nick 중복검사
    @RequestMapping(value="/member_nickcheck.do", method = RequestMethod.POST)
    public String member_nickcheck(@RequestParam("memnick") String nick, Model model) throws Exception{

        int result = service.checkMemberNick(nick);
        model.addAttribute("result", result);
        return "member/nickcheckResult";
    }
    
    //  회원정보저장
    @RequestMapping(value = "/member_join_ok.do", method= RequestMethod.POST)
    public String member_join(@ModelAttribute MemberBean member,
    							Model model, HttpServletRequest request) throws Exception {

        System.out.println("member:"+member);
      
		String[] i = request.getParameterValues("interests"); 
		String interests = ""; //
		//String h = "공부-게임-등산-"; 
		for(String i1 : i){ 
			interests += i1 + "-"; }
		
		member.setInterests(interests);

        service.insert(member);
        return "member/memberLogin";
    }
}
