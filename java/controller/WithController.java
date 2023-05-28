package org.example.goSeoul.controller;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class WithController {

    @Autowired
    private WithService withService;
    @Autowired
    private MemberService memberService;

    // 동행글 작성 폼
    @RequestMapping("withWrite.do")
    public String withWrite(HttpSession session, Model model) throws Exception {
        System.out.println("withWrite");

//        String id = (String)session.getAttribute("id");
//        JoinMemberBean joinMemberBean = memberService.checkLogin(id);
//        model.addAttribute("user",joinMemberBean);

        //로그인 상태 확인
        if (session.getAttribute("id") == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
            // 유저 정보 가져오기
            String id = (String)session.getAttribute("id");
            MemberBean joinMemberBean = memberService.checkLogin(id);
            model.addAttribute("user",joinMemberBean);

            // 로그인된 상태일 경우 글 작성 폼으로 이동
            return "with/withWrite";
        }
        //return "with/withWrite";
    }

    // 동행글 작성
    @RequestMapping("withWriteResult.do")
    public String withWriteResult(@ModelAttribute WithBean wb,
                                  @RequestParam("with_filename1") MultipartFile mf,
                                  HttpServletRequest request,
                                  Model model) throws Exception {

        System.out.println("withWriteResult");
        System.out.println("mf:" + mf);
        System.out.println("tag:" + wb.getWith_tag());

//        int result = withService.insertCheck(wb);
//        model.addAttribute("result", result);

        // 파일 업로드 처리
        if (!mf.isEmpty()) {
            String uploadPath = request.getRealPath("upload"); // 업로드 디렉토리 경로를 설정합니다

            System.out.println("path: " + uploadPath);

            // UUID를 사용하여 고유한 파일명 생성
            String originalFilename = mf.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = UUID.randomUUID().toString() + extension;

            // 파일을 업로드 디렉토리에 저장합니다
            String filePath = uploadPath + File.separator + newFilename;
            mf.transferTo(new File(filePath));

            wb.setWith_filename(newFilename);
        }
        int result = withService.insertCheck(wb);
        model.addAttribute("result", result);

        return "with/withWriteResult";
    }

    // 동행 리스트
    @RequestMapping("with_list.do")
    public String list(HttpServletRequest request, Model model) throws Exception {
        List<WithBean> withlist = new ArrayList<WithBean>();

        int page = 1;
        int limit = 8;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // 게시물 총 개수 구하기
        int listcount = withService.getListCount();

        withlist = withService.getWithList(page);

        // 총 페이지
        int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

        int startpage = ((page - 1) / 10) * 10 + 1; 		// 1, 11, 21..
        int endpage = startpage + 10 - 1; 			   		// 10, 20, 30..

        if (endpage > maxpage)
            endpage = maxpage;

        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("listcount", listcount);
        model.addAttribute("withlist", withlist);

        return "with/withList";
    }

    // 동행 상세페이지
    @RequestMapping("with_detail.do")
    public String with_detail(int with_no, int page, String state, Model model) throws Exception{
        if (state.equals("detail")) {
            withService.hit(with_no);
        }

        WithBean with = withService.getWithDetail(with_no);

        model.addAttribute("with", with);
        model.addAttribute("page", page);

        return "with/withDetail";
    }

    // 동행 예약
    @RequestMapping("with_reserve.do")
    public String with_reserve(@ModelAttribute ReserveBean rb, int with_no, HttpSession session) throws Exception {
        String id = (String)session.getAttribute("id");
        MemberBean mb = memberService.checkLogin(id);

        rb.setWith_no(with_no);
        rb.setUser_no(mb.getUser_no());
        withService.insert(rb);

        return "with/withReserve";
    }
}
