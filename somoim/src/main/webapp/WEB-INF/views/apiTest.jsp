<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api 로그인 결과 확인 </title>
</head>
<body>
<c:if test="${empty sessionScope.accessToken}">
        <a href="https://kauth.kakao.com/oauth/authorize
            ?client_id=9e97acd24d70a166f8d300fad1b72ab7
            &redirect_uri=http://localhost/somoim/login/kakao/auth_code
            &response_type=code">
            <img src="/img/kakao_account_login_btn_medium_wide_ov.png">
        </a>
    </c:if>
    <c:if test="${not empty sessionScope.accessToken}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='./kakaoLogout'">
    </c:if>
</body>
</html>