<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/screens/startPage.css">
<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<title>SOMOIM</title>
</head>
<body>
	<div class ="container_start">
		<div class="header">
			<h1 id="reload">somoim</h1>		
		</div>
		<section>
			<div class="hero">
				<h2>
					소모임
				</h2>
				<p>경험할 수 없던 다양한 취미 활동을 즐겨봐!!!!!<br>소모임을 통해 자기개발과 취미생활을 시작해보세요.</p>
				<button type="button" onclick="location.href='login'">시작하기</button>
			</div>
	</section>
</div>
<div>
</div>
</body>
<script type="text/javascript">
window.addEventListener("load", event => {
    document.getElementById("reload").onclick = function() {
        location.reload(true);
    }
});
</script>
</html>