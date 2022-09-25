<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청한 페이지가 존재하지 않습니다.</title>
</head>

<script>

  var msg = "<c:out value='${msg}'/>";
  var url = "<c:out value='${url}'/>";
   alert(msg);
   location.href = url;
   

</script>

<body>

</body>
</html>