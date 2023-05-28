package org.example.goSeoul.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.example.goSeoul.MailUtil;
import org.example.goSeoul.model.KakaoVo;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.KakaoService;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private KakaoService kakaoService;
	
	MemberBean memberBean = new MemberBean();

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	// 로그인 폼 뷰
	@RequestMapping("MemberLogin.do")
	public String memberLogin() {

		// member폴더의 memberLogin.jsp 뷰 페이지 실행
		return "member/memberLogin";
	}

	// 로그인 처리
	@RequestMapping("MemberLoginOk.do")
	public String memberLoginOk(@RequestParam("id") String id, @RequestParam("pass") String pass,
								HttpSession session, Model model) throws Exception {

		System.out.println("memberLoginOk");

		int result = 0;
		MemberBean memberBean = memberService.checkLogin(id);

		if (memberBean == null) { // 등록되지 않은 회원 일때
			result = 1;
			model.addAttribute("result", result);

			return "member/loginResult";
		} else { // 등록된 회원 일때
			if (memberBean.getPass().equals(pass)) {

				session.setAttribute("id", id);

				return "main";
			} else {
				result = 2;
				model.addAttribute("result", result);

				return "member/loginResult";
			}
		}
	}

	@RequestMapping("findid.do")
	public String findId() throws Exception{
		return "member/findID";
	}

	@RequestMapping("result.do")
	public String result(@ModelAttribute MemberBean memberBean, Model model) throws Exception {
		MemberBean dto = memberService.findMemberId(memberBean);

		if (dto == null) {
			return "member/case1";
		} else {
			model.addAttribute("bonobono", dto);
			return "member/case2";
		}
	}

    // 카카오 로그인
    // 1번 카카오톡에 사용자 코드 받기(memberLogin.jsp의 a태그 href에 경로 있음)
    @RequestMapping("kakaoLogin.do")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) throws Throwable {

        //토큰 발급 받기
        String access_Token = kakaoService.getAccessToken(code);

        // System.out.println("code:" + code);
        // System.out.println("access_Token: "+access_Token);

        //사용자 정보 가지고 오기
        KakaoVo kakaoVo = kakaoService.kakaoUserInfo(access_Token);

        //세션 형성 + request 내장 객체 가지고 오기
        session = request.getSession();

        System.out.println("accessToken: " + access_Token);
        System.out.println("code:" + code);
        System.out.println("Common Controller:" + kakaoVo);
        System.out.println("nickname: " + kakaoVo.getNickname());
        System.out.println("email: " + kakaoVo.getEmail());
        System.out.println("gender: " + kakaoVo.getGender());

        //세션에 담기
        if (kakaoVo.getNickname() != null) {
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("id", kakaoVo.getId());
            session.setAttribute("nickname", kakaoVo.getNickname());
            session.setAttribute("email", kakaoVo.getEmail());
            session.setAttribute("gender", kakaoVo.getGender());
        }
        return "main";
    }
	
	@RequestMapping("finduserpwd.do")
	public String findpw() {
		return "member/FindPwd";
	}

	// @ResponseBody를 사용하면 해당 메소드가 반환하는
	// 데이터를 뷰를 통해 출력하는 것이 아니라, HTTP 응답 데이터에 직접 쓰여지게 됩니다.
	// 보통 JSON, XML, 문자열, 파일 등의 형태로 데이터를 반환할 때 사용됩니다.
	@RequestMapping(value = "find.do", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String findPw(@ModelAttribute MemberBean memberBean) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;

		// 회원정보 불러오기
		MemberBean dto = memberService.searchPwd(memberBean);
		System.out.println(dto);

		if(dto != null) {
			System.out.println("1");

			String FE = memberService.concat(memberBean);
			String tempPw = UUID.randomUUID().toString().replace("-", "");// -를 제거
			tempPw = tempPw.substring(0, 10);// tempPw를 앞에서부터 10자리 잘라줌
			dto.setPass(tempPw);// 임시 비밀번호 담기
			MailUtil mail = new MailUtil(); // 메일 전송하기
			mail.sendEmail(dto, FE);
			memberService.updatePass(dto);//이메일이랑 도메인을 더해주는 서비스
			String securePw = encoder.encode(dto.getPass());// 회원 비밀번호를 암호화하면 dto객체에 다시 저장
			dto.setPass(securePw);

			result = "true";

		} else {
			result = "false";
		}

		return result;
	}
}
