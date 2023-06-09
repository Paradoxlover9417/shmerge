package org.example.goSeoul.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.FreeService;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.PagingPgm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService;
    @Autowired
    private MemberService memberService;
    
    // 리스트
    @RequestMapping("freeList.do")
	public String list(String pageNum, FreeBean fb, Model model) {
		System.out.println("search:" + fb.getSearch());
		System.out.println("keyword:" + fb.getKeyword());

		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// int total = bs.getTotal();
		int total = freeService.getTotal(fb); // 검색
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		fb.setStartRow(startRow);
		fb.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;

		List<FreeBean> list = freeService.list(fb);
		/* System.out.println("list:" + list); */

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", fb.getSearch());
		model.addAttribute("keyword", fb.getKeyword());
		return "free/freeList";
	}

    // 상세페이지
    @RequestMapping("freeContent.do")
	public String freeContent(@ModelAttribute FreeBean fb, int num, String pageNum, Model model) throws Exception {
		freeService.freeHit(num);
		FreeBean freeBean = freeService.numSelect(num);
		
		model.addAttribute("freeBean", freeBean);
		model.addAttribute("num", num); 
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("상세 글번호 : "+ num);
		System.out.println("상세 페이지번호 : "+ pageNum);
		
		return "free/freeContent";
	}
    
    // 작성 폼
    @RequestMapping("freeWrite.do")
    public String freeWrite(@ModelAttribute FreeBean fb, 
    		HttpSession session, Model model) throws Exception {
        System.out.println("freeWrite");
        //로그인 상태 확인
        if (session.getAttribute("id") == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
            // 유저 정보 가져오기
            String id = (String)session.getAttribute("id");
            MemberBean memberBean = memberService.checkLogin(id);
            model.addAttribute("user",memberBean);
            fb.setFree_nick(memberBean.getNick()); 
            fb.setFree_id(memberBean.getId()); 
            System.out.println("닉네임: "+fb.getFree_nick());
            System.out.println("아이디: "+fb.getFree_id());
        }
        // 로그인된 상태일 경우 글 작성 폼으로 이동
        return "free/freeWrite";
    }

    // 작성
    @RequestMapping("freeWriteResult.do")
    public String freeWriteResult(@ModelAttribute FreeBean fb,
    		@RequestParam("free_filename1") MultipartFile mf,
    		HttpServletRequest request, Model model) throws Exception {
        System.out.println("freeWriteResult");
        System.out.println("tag: "+fb.getFree_tag());
        
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

            fb.setFree_filename(newFilename);
        }
        int result = freeService.freeInsert(fb);
        model.addAttribute("result", result);

        System.out.println("글작성결과 : "+result);
        return "free/freeWriteResult";
    }

    // 수정 폼
	@RequestMapping("freeUpdate.do")
	public String freeUpdate(@ModelAttribute FreeBean fb, int num, String pageNum,
			HttpServletResponse response,
			HttpSession session, Model model) throws Exception {
		FreeBean freeBean = freeService.numSelect(num);
		model.addAttribute("freeBean", freeBean);
		model.addAttribute("pageNum", pageNum);

		 //로그인 상태 확인
        if (session.getAttribute("id") == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else if (session.getAttribute("id").equals(freeBean.getFree_id())) {
        	System.out.println("로그인 확인");
            // 유저 정보 가져오기
        	String id = (String)session.getAttribute("id");
            MemberBean memberBean = memberService.checkLogin(id);
            model.addAttribute("user",memberBean);
            freeBean.setFree_id(memberBean.getId()); 
        } else { 
        	System.out.println("작성자가 아닙니다.");
        	response.setContentType("text/html; charset=utf-8");
             PrintWriter w = response.getWriter();
             w.write("<script>alert('"+"작성자가 아닙니다."+"');history.go(-1);</script>");
             w.flush();
             w.close();
        }
		return "free/freeUpdate";
	}

	// 수정
	@RequestMapping("freeUpdateResult.do")
	public String freeUpdateResult(@ModelAttribute FreeBean fb, String pageNum,
			  @RequestParam("free_filename1") MultipartFile mf,
	          HttpServletRequest request, Model model) throws Exception {
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

            fb.setFree_filename(newFilename);
        }
		
		int result = freeService.freeUpdate(fb);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		System.out.println(result);
		return "free/freeUpdateResult";
	}

	// 삭제 폼
	@RequestMapping("freeDelete.do")
	public String freeDelete(@ModelAttribute FreeBean fb, int num, String pageNum,
			HttpServletResponse response,
			HttpSession session, Model model) throws Exception {
		FreeBean freeBean = freeService.numSelect(num); 
		model.addAttribute("freeBean", freeBean);
		System.out.println("freeDelete");
		System.out.println("프리빈: "+freeBean);
		System.out.println("fb.프리no: "+freeBean.getFree_no());
		
		//로그인 상태 확인
		if (session.getAttribute("id") == null) {
			// 비로그인 상태일 경우 로그인 폼으로 이동
			return "redirect:MemberLogin.do";
		} else if (session.getAttribute("id").equals(freeBean.getFree_id())) {
			System.out.println("로그인 확인");
			// 유저 정보 가져오기
			String id = (String)session.getAttribute("id");
			MemberBean memberBean = memberService.checkLogin(id);
			model.addAttribute("user",memberBean);
			System.out.println("세션: "+id);
			System.out.println("프리빈: "+freeBean.getFree_id());
		} else {
			String id = (String)session.getAttribute("id");
			System.out.println("세션: "+id);
			System.out.println("프리빈: "+freeBean.getFree_id());
			System.out.println("작성자가 아닙니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('"+"작성자가 아닙니다."+"');history.go(-1);</script>");
			w.flush();
			w.close();
		}
		return "free/freeDelete";
	}
	
	// 삭제
	@RequestMapping("freeDeleteResult.do")
	public String freeDeleteResult(@ModelAttribute FreeBean fb, String pageNum,
	          HttpServletRequest request, Model model) throws Exception {
		System.out.println("freeDeleteResult");
		int result = freeService.freeDelete(fb);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		System.out.println(result);
		return "free/freeDeleteResult";
	}
	
	@RequestMapping("freeLikeUpdate.do")
	public String freeLike(int num, String pageNum, Model model) {
		System.out.println("num:" + num);
		System.out.println("pageNum:" + pageNum);

		int result = freeService.freeLikeUpdate(num);
		if (result == 1)
			System.out.println("좋아요 증가");

		return "redirect:freeContent.do?num="+num+"&pageNum="+pageNum;
	}

	@RequestMapping("freeDislikeUpdate.do")
	public String freeDislikeUpdate(int num, String pageNum, Model model) {
		System.out.println("num:" + num);
		System.out.println("pageNum:" + pageNum);

		int result = freeService.freeDislikeUpdate(num);
		if (result == 1)
			System.out.println(" 싫어요 증가");

		return "redirect:freeContent.do?num="+num+"&pageNum="+pageNum;
	}
}

