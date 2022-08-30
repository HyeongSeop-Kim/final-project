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
	<title>회원가입</title>
</head>
<body>
	<header>
		<div class="form-title">
				소모임
		</div>
	</header>
	<section class="form-section">
		<div class="form-container">
			<form class="join-form" action="">
				<label class="join-form__label">아이디</label>
				<input class="join-form__input" type="text">
				
				<label class="join-form__label">비밀번호</label>
				<input class="join-form__input" type="password">
		
				<label class="join-form__label">비밀번호 재확인</label>
				<input class="join-form__input" type="password">
				
				<label class="join-form__label">이름</label>
				<input class="join-form__input" type="text">
	
				<label class="join-form__label">생년월일</label>
				<div class="join-form-inline">
					<select class="join-form-inline__input">
						<option>년</option>
					</select>
					<select class="join-form-inline__input">
						<option>월</option>
					</select>
					<select class="join-form-inline__input">
						<option>일</option>
					</select>
				</div>
				<div class="join-form-inline">
					<div class="join-form-inline__div">
						<label class="join-form__label">성별</label>
						<select class="join-form__input">
							<option>성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
					<div class="join-form-inline__div">
						<label class="join-form__label">지역</label>
						<select class="join-form__input">
							<option>지역</option>
						</select>
					</div>
				</div>
				
				<label class="join-form__label">휴대전화</label>
				<input class="join-form__input" type="text" placeholder="핸드폰 번호">
				<input class="join-form__btn btn-green" type="submit" value="회원가입"  />
			</form>
		</div>
	</section>
</body>
</html>
