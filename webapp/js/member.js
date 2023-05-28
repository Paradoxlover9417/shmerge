var id_result = false; // 중복검사 버튼 안 눌렀을 때의 변수
var nick_result = false; // 중복검사 버튼 안 눌렀을 때의 변수

function check() {
    alert("check in");
    if ($.trim($("#id").val()) == "") {
        alert("회원아이디를 입력하세요!");
        $("#id").val("").focus();
        return false;
    }
    if ($.trim($("#pass").val()) == "") {
        alert("비밀번호를 입력하세요!");
        $("#pass").val("").focus();
        return false;
    }
    if ($.trim($("#pass2").val()) == "") {
        alert("비밀번호를 확인하세요!");
        $("#pass2").val("").focus();
        return false;
    }
    if ($.trim($("#pass").val()) != $.trim($("#pass2").val())) {
        //!=같지않다 연산. 비번이 다를 경우
        alert("비밀번호가 다릅니다!");
        $("#pass").val("");
        $("#pass2").val("");
        $("#pass").focus();
        return false;
    }
    if ($.trim($("#name").val()) == "") {
        alert("회원이름을 입력하세요!");
        $("#name").val("").focus();
        return false;
    }
    if ($.trim($("#nick").val()) == "") {
        alert("닉네임을 입력하세요!");
        $("#nick").val("").focus();
        return false;
    }
    if ($.trim($("#email").val()) == "") {
        alert("메일 아이디를 입력하세요!");
        $("#email").val("").focus();
        return false;
    }
    if ($.trim($("#domain").val()) == "") {
        alert("메일 주소를 입력하세요!");
        $("#domain").val("").focus();
        return false;
    }
    if ($.trim($("#birth").val()) == "") {
        alert("생년월일을 입력하세요!");
        $("#birth").val("").focus();
        return false;
    }
    if ($.trim($("#tel2").val()) == "") {
        alert("전화번호를 입력하세요!");
        $("#tel2").val("").focus();
        return false;
    }
    if ($.trim($("#tel3").val()) == "") {
        alert("전화번호를 입력하세요!");
        $("#tel3").val("").focus();
        return false;
    }
    if ($.trim($("#MBTI").val()) == "") {
        alert("MBTI를 입력하세요!");
        $("#MBTI").val("").focus();
        return false;
    }
    if ($.trim($("#region").val()) == "") {
        alert("선호하는 지역을 입력하세요!");
        $("#region").val("").focus();
        return false;
    }
    if ($("#male").is(":checked") == false && $("#female").is(":checked") == false && $("#none").is(":checked") == false) {
        alert("남.여 중에서 1개를 선택하세요");
        return false;
    }
    if ($("input:checkbox[name='interests']:checked").length < 2) {
        alert("관심사는 2개 이상 선택하세요");
        return false;
    }
    if ($("#intro").val().length > 100) {
        alert("자기소개를 100자 이내로 입력하세요");
        $("#intro").focus();
        return false;
    }
    if (id_result == false) {
        // 중복검사 버튼 안 눌렀을 때 false
        alert("ID중복검사 하세요");
        return false;
    }
    if (nick_result == false) {
        // 중복검사 버튼 안 눌렀을 때 false
        alert("닉네임 중복검사 하세요");
        return false;
    }

    /* $("#myform").submit();*/
}

/* 아이디 중복 체크*/
function id_check() {
    //  alert("in");

    $("#idcheck").hide(); //idcheck span 아이디 영역을 숨긴다.
    var memid = $("#id").val();
    //1.입력글자 길이 체크
    if ($.trim($("#id").val()).length < 4) {
        var newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
        $("#idcheck").text("");
        $("#idcheck").show();
        $("#idcheck").append(newtext); //span 아이디 영역에 경고문자 추가
        $("#id").val("").focus();
        return false;
    }
    if ($.trim($("#id").val()).length > 12) {
        var newtext = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
        $("#idcheck").text("");
        $("#idcheck").show();
        $("#idcheck").append(newtext); //span 아이디 영역에 경고문자 추가
        $("#id").val("").focus();
        return false;
    }
    //입력아이디 유효성 검사
    if (!validate_userid(memid)) {
        var newtext = '<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
        $("#idcheck").text(""); //문자 초기화
        $("#idcheck").show(); //span 아이디 영역을 보이게 한다.
        $("#idcheck").append(newtext);
        $("#id").val("").focus();
        return false;
    }

    //아이디 중복확인
    $.ajax({
        type: "POST",
        url: "member_idcheck.do",
        data: { memid: memid },
        success: function (data) {
            // 	alert("return success="+data);
            if (data == 1) {
                //중복 ID
                var newtext = '<font color="red">중복 아이디이거나 탈퇴한 회원입니다.</font>';
                $("#idcheck").text("");
                $("#idcheck").show();
                $("#idcheck").append(newtext);
                $("#id").val("").focus();
                return false;
            } else {
                //사용 가능한 ID
                var newtext = '<font color="blue">사용가능한 아이디입니다.</font>';
                $("#idcheck").text("");
                $("#idcheck").show();
                $("#idcheck").append(newtext);
                $("#pass").focus();

                id_result = true; // 중복검사 버튼 눌렀으면 true
            }
        },
        error: function (e) {
            alert("data error" + e);
        },
    }); //$.ajax
}

/*아이디 중복 체크 끝*/

/* 닉네임 중복 체크*/
function nick_check() {
    //  alert("닉네임 중복검사");

    $("#nickcheck").hide(); //nickcheck span 아이디 영역을 숨긴다.
    var memnick = $("#nick").val();
    //1.입력글자 길이 체크
    if ($.trim($("#nick").val()).length < 2) {
        var newtext = '<font color="red">닉네임은 2자 이상이어야 합니다.</font>';
        $("#nickcheck").text("");
        $("#nickcheck").show();
        $("#nickcheck").append(newtext); //span 아이디 영역에 경고문자 추가
        $("#nick").val("").focus();
        return false;
    }
    if ($.trim($("#nick").val()).length > 12) {
        var newtext = '<font color="red">닉네임은 12자 이하이어야 합니다.</font>';
        $("#nickcheck").text("");
        $("#nickcheck").show();
        $("#nickcheck").append(newtext); //span 아이디 영역에 경고문자 추가
        $("#nick").val("").focus();
        return false;
    }
    //입력아이디 유효성 검사
    if (!validate_usernick(memnick)) {
        var newtext = '<font color="red">닉네임은 영문소문자,숫자,_ 조합만 가능합니다.</font>';
        $("#nickcheck").text(""); //문자 초기화
        $("#nickcheck").show(); //span 아이디 영역을 보이게 한다.
        $("#nickcheck").append(newtext);
        $("#nick").val("").focus();
        return false;
    }

    //닉네임 중복확인
    $.ajax({
        type: "POST",
        url: "member_nickcheck.do",
        data: { memnick: memnick },
        success: function (data) {
            // 	alert("return success="+data);
            if (data == 1) {
                //중복 ID
                var newtext = '<font color="red">중복 닉네임입니다.</font>';
                $("#nickcheck").text("");
                $("#nickcheck").show();
                $("#nickcheck").append(newtext);
                $("#nick").val("").focus();
                return false;
            } else {
                //사용 가능한 닉네임
                var newtext = '<font color="blue">사용가능한 닉네임입니다.</font>';
                $("#nickcheck").text("");
                $("#nickcheck").show();
                $("#nickcheck").append(newtext);
                $("#email").focus();

                nick_result = true; // 중복검사 버튼 눌렀으면 true
            }
        },
        error: function (e) {
            alert("data error" + e);
        },
    }); //$.ajax
}

/*닉네임 중복 체크 끝*/

/*정규표현식 검사*/
function validate_userid(memid) {
    var pattern = new RegExp(/^[a-z0-9_]+$/);
    //영문 소문자,숫자 ,_가능,정규표현식
    return pattern.test(memid);
}

function validate_usernick(memnick) {
    var pattern = new RegExp(/^[a-z0-9_]+$/);
    //영문 소문자,숫자 ,_가능,정규표현식
    return pattern.test(memnick);
}

/* 이메일 도메인 */
$(function () {
    $("#mailid").change(function () {
        if ($("#mailid").val() == "directly") {
            $("#domain").attr("disabled", false);
            $("#domain").val("");
            $("#domain").focus();
        } else {
            $("#domain").val($("#mailid").val());
        }
    });
});
// 도메인 선택
/*$("#mailid").change(function(){
	if($("#mailid").val()==""){		// 직접 입력 선택
		$("#domain").attr("readOnly", false);
		$("#domain").val("").focus();
	}else{							// 도메인을 선택
		$("#domain").val($("#mailid").val());
		$("#domain").attr("readOnly","readOnly");
	}
});

*/
