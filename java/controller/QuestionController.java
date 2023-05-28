package org.example.goSeoul.controller;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.QuestionBean;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    @Autowired
    private MemberService memberService;

    // 자주묻는 질문 페이지
    @RequestMapping("q_board.do")
    public String q_board() {

        System.out.println("q_board");
        return "question/q_board";
    }

    // 문의글 폼
    @RequestMapping("q_form.do")
    public String q_form(HttpSession session, Model model) throws Exception {
        String id = (String)session.getAttribute("id");
        MemberBean memberBean = memberService.checkLogin(id);
        model.addAttribute("user", memberBean);

        System.out.println("q_form");
        return "question/q_form";
    }

    // 문의글 작성
    @RequestMapping("q_formResult.do")
    public String q_formResult(@ModelAttribute QuestionBean qb, Model model) throws Exception {

        System.out.println("q_formResult");

        int result = questionService.questionInsert(qb);
        model.addAttribute("result",result);

        return "question/q_formResult";
    }
}
