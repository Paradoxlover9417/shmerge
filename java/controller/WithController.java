package org.example.goSeoul.controller;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.ReserveBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.model.WithReplyBean;
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
import java.util.*;

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

    // 동행 수정 폼
    @RequestMapping("withUpdate.do")
    public String withUpdate(int with_no, int page, Model model) throws Exception {


        WithBean with = withService.getWithDetail(with_no);
        model.addAttribute("with", with);
        model.addAttribute("page", page);

        // 로그인된 상태일 경우 둥행수정 폼으로 이동
        return "with/withUpdate";

    }

    // 동행 수정글 작성
    @RequestMapping("withUpdateResult.do")
    public String withUpdateResult(@ModelAttribute WithBean wb,
                                   @RequestParam("with_filename1") MultipartFile mf,
                                   HttpServletRequest request,
                                   Model model) throws Exception {

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

        WithBean with = withService.getWithDetail(wb.getWith_no());

        if(mf.isEmpty()) {
            wb.setWith_filename(with.getWith_filename());
        }

        int result = withService.withUpdate(wb);
        model.addAttribute("result", result);

        return "with/withUpdateResult";
    }

    // 동행 리스트
    @RequestMapping("with_list.do")
    public String list(HttpServletRequest request, Model model) throws Exception {
        List<WithBean> withlist = new ArrayList<WithBean>();

        int page = 1;
        int limit = 8;
        int listcount = 0;
        String search = null;
        String keyword = null;

        Map<String,Object> countMap = new HashMap<String,Object>();
        Map<String,Object> searchMap = new HashMap<String,Object>();

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        searchMap.put("page", page);

        if (request.getParameter("search") != null) {
            search = request.getParameter("search");
            countMap.put("search", search);
            searchMap.put("search", search);
        }

        if (request.getParameter("keyword") != null) {
            keyword = request.getParameter("keyword");
            countMap.put("keyword", keyword);
            searchMap.put("keyword", keyword);
        }

        // 게시물 리스트 구하기
        if (search == null && keyword == null) {
            listcount = withService.getListCount();
            withlist = withService.getWithList(page);
        } else {
            listcount = withService.getSearchCount(countMap);
            System.out.println("searchlistcount: " + listcount);
            withlist = withService.getSearchList(searchMap);
            System.out.println("withlist: " + withlist);
        }

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
        model.addAttribute("search", search);
        model.addAttribute("keyword", keyword);

        return "with/withList";
    }

    // 동행 상세페이지
    @RequestMapping("with_detail.do")
    public String with_detail(int with_no, int page, String state, HttpSession session, Model model) throws Exception{
    	String id = (String)session.getAttribute("id");
    	
    	if (state.equals("detail")) {
            withService.hit(with_no);
        }

        WithBean with = withService.getWithDetail(with_no);

        List<WithReplyBean> replyList = withService.getReplyList(with_no);

        model.addAttribute("id", id);
        model.addAttribute("with", with);
        model.addAttribute("page", page);
        model.addAttribute("replyList", replyList);

        return "with/withDetail";
    }

    // 동행 예약
    @RequestMapping("with_reserve.do")
    public String with_reserve(@ModelAttribute ReserveBean rb, int with_no, int page, String state,
                               HttpSession session, Model model) throws Exception {
        String id = (String)session.getAttribute("id");
        
        Map<String,Object> reserveMap = new HashMap<String,Object>();
        reserveMap.put("id", id);
        reserveMap.put("with_no", with_no);

        if (id == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
        	int count =  withService.getReserveList(reserveMap);
        	if (count == 1) {
        		return "with/withReserveDone";
        	} else {
        		MemberBean mb = memberService.checkLogin(id);

                rb.setWith_no(with_no);
                rb.setUser_no(mb.getUser_no());
                rb.setReserve_id(mb.getId());
                rb.setReserve_nick(mb.getNick());
                withService.insert(rb);

                withService.updateCurNo(with_no);

                model.addAttribute("with_no", with_no);
                model.addAttribute("page", page);
                model.addAttribute("state", state);

                return "with/withReserve";
        	}
        }
    }

    // 동행 댓글 작성
    @RequestMapping("with_reply.do")
    public String with_reply(@ModelAttribute WithReplyBean wrb, int with_no, int page, String state, HttpSession session, Model model) throws Exception {
        String id = (String)session.getAttribute("id");

        if (id == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
            MemberBean mb = memberService.checkLogin(id);

            wrb.setWith_no(with_no);
            wrb.setUser_no(mb.getUser_no());
            wrb.setWithreply_id(mb.getId());
            wrb.setWithreply_nick(mb.getNick());
            withService.insertReply(wrb);

            model.addAttribute("with_no", with_no);
            model.addAttribute("page", page);
            model.addAttribute("state", state);

            return "redirect:with_detail.do";
        }
    }
    
    // 동행 댓글 삭제
    @RequestMapping("withReplyDelete.do")
    public String withReplyDelete(int withreply_no, int with_no, int page, String state, Model model) throws Exception {
    	int result = withService.withReplyDelete(withreply_no);
    	
    	model.addAttribute("result", result);
    	model.addAttribute("with_no", with_no);
    	model.addAttribute("page", page);
    	model.addAttribute("state", state);
    	
    	return "with/withReplyDelete";
    }
    
    // 동행 글 삭제
    @RequestMapping("withDelete.do")
    public String withDelete(int with_no, Model model) throws Exception {
    	int result = withService.withDelete(with_no);
    	
    	model.addAttribute("result", result);
    	
    	return "with/withDelete";
    }
}
