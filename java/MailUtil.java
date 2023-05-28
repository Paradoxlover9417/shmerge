package org.example.goSeoul;

import org.apache.commons.mail.HtmlEmail;
import org.example.goSeoul.model.MemberBean;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletResponse;

public class MailUtil {
    public void sendEmail(MemberBean dto,String FE) throws Exception {

        String charSet = "utf-8";
        String hostSMTP = "smtp.naver.com"; // SMTP 서버명
        String hostSMTPid = "sksksk96"; // 아이디
        String hostSMTPpwd = "Rladn851!"; // 비밀번호​
        // 보내는 사람
        String fromEmail = "sksksk96@naver.com";
        String fromName = "관리자";

        String subject = "hello"; // 메일 제목
        String msg = "";

        msg += "<div align='left'";
        msg += "<h3>";
        msg += "회원님의 임시 비밀번호입니다. <br>로그인 후 비밀번호를 변경해 주세요</h3>";
        msg += "<p>임시 비밀번호:";
        msg += dto.getPass() + "</p></div>";

        // email전송
        String mailRecipient = FE;// 받는 사람 이메일 주소
        try {
            // 객체 선언
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(587);
            mail.setAuthentication(hostSMTPid, hostSMTPpwd);
            mail.setStartTLSEnabled(true);
            mail.addTo(mailRecipient, charSet);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(msg);
            mail.send();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void findPw(HttpServletResponse response, @ModelAttribute MemberBean memberBean) throws Exception {
        response.setContentType("text/html;charset=utf-8");
    }
}
