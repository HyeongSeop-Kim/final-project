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
				소모임
		</div>
	</header>
	<section class="form-section">
		<div class="form-container">
			<form class="login-form" action="">
				<input class="login-form__input" name="username" type="text" placeholder="Username"  />
			    <input class="login-form__input" name="password" type="password" placeholder="Password" />
			    <span>
			    	<input class="login-form__checkbox" type="checkbox" value="" />
			       	로그인 상태 유지
			    </span>
			    <input class="login-form__btn btn-green" type="submit" value="로그인"  />
			</form>
			<div class="link-row">
				<a href="#">아이디 찾기</a>
				|
				<a href="#">비밀번호 찾기</a>
				|
				<a href="${path}/join.jsp">회원가입</a>
			</div>
			<div class="hr-sect">또는</div>
			<div class="social-login">
				<button class="social-login__btn btn-green"><img src="${path}/resources/img/logos/naver-logo.png" /><span>네이버 계정으로 로그인</span></button>
				<button class="social-login__btn btn-white"><img src="${path}/resources/img/logos/google-logo.png" /><span>구글 계정으로 로그인</span></button>
				<button class="social-login__btn btn-yellow"><img src="${path}/resources/img/logos/kakao-logo.png" /><span>카카오톡 계정으로 로그인</span></button>
			</div>
		</div>
	</section>
</body>
</html>