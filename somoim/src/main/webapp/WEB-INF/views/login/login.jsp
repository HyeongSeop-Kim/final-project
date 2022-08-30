<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:url var="cs" value="/resources/css"/>
<c:url var="img" value="/resources/img/somoim"/>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${cs}/reset.css" />
  <link rel="stylesheet" href="${cs}/login.css" />
  <link rel="stylesheet" href="${cs}/style.css" />
    <title>로그인</title>
</head>
<body>
    <div class="wrap d-flex justify-content-center align-items-center" style="height: 80%;">
        <div class="container d-flex">
            <div class="login p-5 mx-auto bg-white">
                <header class="d-flex justify-content-center align-items-center py-5">
                    <h1 class="title">소모임</h1>
                    <i class="fa-solid fa-comments mx-2"></i>
                </header>
                <form action="">
                <div class="login-form">
                    <ul>
                        <li class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">
                                <i class="fa-solid fa-user-large"></i>
                            </span>
                            <input type="text" class="form-control" placeholder="Username" aria-label="Username"
                                aria-describedby="basic-addon1" style="width: 300px;">
                        </li>
                        <li class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">
                                <i class="fa-solid fa-key"></i>
                            </span>
                            <input type="text" class="form-control" placeholder="password" aria-label="password"
                                aria-describedby="basic-addon1" style="width: 300px;">
                        </li>
                        <li>
                            <button class="btn btn-primary login-btn" type="submit">로그인</button>
                        </li>
                        <li class="form-check d-flex align-items-center py-3 px-0">
                            <input type="checkbox" name="login-delYn" id="login-delYn" checked>
                            <label for="login-delYn" class="px-2">로그인 상태 유지</label>
                        </li>
                        <li class="d-flex justify-content-center join py-3">
                            <a href="/home/signup" class="join-btn" >회원가입</a>
                            <span class="border-line px-3">|</span>
                            <a href="">아이디/비밀번호 찾기</a>
                        </li>
                        </ul>
                        </div>
                        </form>
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
                </div>
            </div>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>