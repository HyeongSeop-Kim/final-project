<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:url var="cs" value="/resources/css"/>
<c:url var="img" value="/resources/img/somoim"/>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${cs}/reset.css" />
  <link rel="stylesheet" href="${cs}/login.css" />
  <link rel="stylesheet" href="${cs}/style.css" />
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <div class="wrap justify-content-center align-items-center" style="height: 80%;">
        <div class="container ">
            <div class="login join p-5 mx-auto bg-white">
                <header class="d-flex justify-content-center align-items-center py-5">
                    <h1 class="title">회원가입</h1>
                    <i class="fa-solid fa-comments mx-2"></i>
                </header>
   <form action="">
   <div class="row">
   		<div class="login-form">
			<div>
				<h1>
					<label for="id">아이디</label>
				</h1>
			</div> 	
   			<span>
   				<input class="form-control mb-3" id="id" type="text">
   			</span >
   		</div>
   		<div class="login-form join_title">
			<div>
				<h1>
					<label for="pw1">비밀번호</label>
				</h1>
			</div> 	
   			<span>
   				<input class="form-control mb-3" id="pw1" type="password">
   			</span>
   		</div>
   		<div class="login-form join_title">
			<div>
				<h1>
					<label for="pw2">비밀번호 재확인</label>
				</h1>
			</div> 	
   			<span>
   				<input class="form-control mb-4" id="pw2" type="password">
   			</span>
   		</div>
			<h1>
				<label for="">이름</label>
			</h1>
	   		<div class="d-flex mb-3">
	   			<div class="col-md-6 ">
					<span>
						<input class="form-control" type="text">
					</span>
	   			</div>
		   			<div class="col-md-3">
			   			<select class="form-select">
			   				<option>성별</option>
			   				<option>남자</option>
			   				<option>여자</option>
			   			</select>
		   			</div>
		   			<div class="col-md-3">
	   			</div>
	   		</div>
	
   		
   		
   		<div class="d-flex mb-3">
		<div class="col-md-5">
			<select class="form-select" id="birth-year">
				<option>생년월일</option>
			</select>
		</div>	
		<div class="col-md-4">
			<select class="form-select" id="birth-month">
				<option>월</option>
			</select>
		</div>	
		<div class="col-md-3">
			<select class="form-select" id="birth-day">
				<option>일</option>
			</select>
		</div>	
			</div>
			</div>
			<div>
                    <button class="btn btn-primary login-btn" type="submit">회원가입</button>
			</div>
			
			
                       <ul>
                        	<li>
                           		 <span class="line-or"><span class="txt-or">또는</span></span>
                       	 	</li>
                        	<li class="d-flex justify-content-center mb-3" style="background-color: #03C75A;">
                          		  <img src="${img}/logo/naver.png" alt="" width="170px">
                       		 </li>
                       		 <li class="d-flex justify-content-center mb-3" style="background-color: #FEE500;">
                           		 <img src="${img}/logo/kakao.png" alt="" style="width: 170px;">
                       		 </li>
                    	</ul>
			
  				 </form>
            </div>
         </div>
    </div>   
   
</body>
</html>