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
	<title>아이디 찾기</title>
</head>
<body>
	<header>
		<div class="form-title">
			아이디 찾기
		</div>
	</header>
	<section class="form-section">
		<div class="form-container">
			<form class="find-form" action="">
				<label class="find-form__label">이름</label>
				<input class="find-form__input" type="text">
	
				<label class="find-form__label">생년월일</label>
				<div class="find-form-inline">
					<select class="find-form-inline__input">
						<option>년</option>
					</select>
					<select class="find-form-inline__input">
						<option>월</option>
					</select>
					<select class="find-form-inline__input">
						<option>일</option>
					</select>
				</div>
				<label class="find-form__label">휴대전화</label>
				<input class="find-form__input" type="text" placeholder="핸드폰 번호">
				<div class="find-form-inline div-line">
						<button class="find-form__btn btn-light-gray" type="button" onclick="popClose();">취소</button>
						<input class="find-form__btn btn-green" type="submit" value="확인"  />
				</div>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript">
	function popClose() {
		window.close();
	}
</script>

</html>