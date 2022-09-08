<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/styles.css">
	<title>로그인</title>
</head>
<body>
	<header>
		<div class="form-title">
				<h1>소모임</h1>
		</div>
	</header>
	<section class="form-section">
		<div class="form-container">
			<c:url var="loginUrl" value="/login"/>
			<form class="login-form" action="${loginUrl}" method="post" >
				<input class="login-form__input" name="memberId" type="text" placeholder="Username"  />
			    <input class="login-form__input" name="password" type="password" placeholder="Password" />
			    <span>
			    	<input class="login-form__checkbox" type="checkbox" value="" />
			       	로그인 상태 유지
			    </span>
			    <input class="login-form__btn btn-green" type="submit" value="로그인"  />
			</form>
			<div class="link-row">
				<a onclick="popId();">아이디 찾기</a>
				|
				<a onclick="popPw();">비밀번호 찾기</a>
				|
				<a onclick="popJoin();">회원가입</a>
			</div>
			<div class="hr-sect">또는</div>
			<div class="social-login">
				<button class="social-login__btn btn-green"><img src="${path}/resources/img/logos/naver-logo.png" /><span>네이버 계정으로 로그인</span></button>
				<button class="social-login__btn btn-white"><img src="${path}/resources/img/logos/google-logo.png" /><span>구글 계정으로 로그인</span></button>
				<button class="social-login__btn btn-yellow" onclick="location.href='/home/login/kakao'"><img src="${path}/resources/img/logos/kakao-logo.png" /><span>카카오톡 계정으로 로그인</span></button>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var id;
	var pw;
	var join;
function popId(){
 if (!id){       //최초 클릭이면 팝업을 띄운다
	 let popUrl = "findId";	
	Clip =window.open(popUrl, '_blank', 'width=500, height=600, location=no');
	id = true;
 }
 else{           //최초 클릭이 아니면
  if(!Clip.closed && Clip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
   Clip.focus();                        
  }
  else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
	  let popUrl = "findId";	
	  Clip =window.open(popUrl, '_blank', 'width=500, height=600');
   id = true;
  }
 }
};
function popPw(){
 if (!pw){       //최초 클릭이면 팝업을 띄운다
	 let popUrl = "findPw";	
	Clip =window.open(popUrl, '_blank', 'width=500, height=600 ');
  pw = true;
 }
 else{           //최초 클릭이 아니면
  if(!Clip.closed && Clip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
   Clip.focus();                        
  }
  else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
	 let popUrl = "findPw";	
	  Clip =window.open(popUrl, '_blank', 'width=500, height=600');
   pw = true;
  }
 }
};
function popJoin(){
 if (!join){       //최초 클릭이면 팝업을 띄운다
	 let popUrl = "join";	
	Clip =window.open(popUrl, '_blank', 'width=550, height=920');
  join = true;
 }
 else{           //최초 클릭이 아니면
  if(!Clip.closed && Clip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
   Clip.focus();                        
  }
  else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
	 let popUrl = "join";	
	  Clip =window.open(popUrl, '_blank', 'width=550, height=920');
	  join = true;
  }
 }
};


</script>
</html>