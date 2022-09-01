<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="img" value="/resources/img/somoim"/>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <!-- 모바일로 확인시 크기조절 -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
   								 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  								<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
							    integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
							    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${path}/resources/css/styles.css">
  <title>Demo</title>
</head>

<body>
  <div class="wrap p-3">
    <!-- header -->
    <header class="container d-flex justify-content-center align-items-center rounded-3 shadow-sm bg-white">
      <h1 class="title">소모임</h1>
      <i class="fa-solid fa-comments mx-2"></i>
    </header>
    <!-- // header -->

    <!-- main -->
    <main class="container pt-3 px-0">
    
      <div class="row"> 
        <!-- left-menu -->
        <div class="col-md-3" > 
          <div class="p-4 rounded-3 shadow-sm bg-white scroll "style="height: 738px; overflow-y: scroll"> 
            <div class="row" >
              <div class="col-6 d-flex flex-column justify-content-center align-items-center" >
                <a href="#" class="service-items icon-green">
   				 	 <i class="fa-solid fa-suitcase"></i>
                </a>
                <a href="#" class="service-items icon-green">
               		 <i class="fa-solid fa-music"></i>
                </a>
                <a href="#" class="service-items icon-green">
             	    <i class="fa-brands fa-youtube"></i>
                </a>
                <a href="#" class="service-items icon-green">
           		    <i class="fa-solid fa-baseball-bat-ball"></i>
                </a>
                <a href="#" class="service-items icon-green">
            	    <i class="fa-solid fa-gamepad"></i>
                </a>
                <a href="#" class="service-items icon-green">
                <i class="fa-solid fa-briefcase"></i>
                </a>
                <a href="#" class="service-items icon-green">
                <i class="fa-solid fa-briefcase"></i>
                </a>
  
              </div>
              <div class="col-6 d-flex flex-column justify-content-center align-items-center">
      			<a href="#" class="service-items icon-green">
          	        <i class="fa-solid fa-dog"></i>	
                </a>
                <a href="#" class="service-items icon-green">
                	 <i class="fa-solid fa-car"></i>
                </a>
                <a href="#" class="service-items icon-green">
                 	 <i class="fa-solid fa-utensils"></i>
                </a>
                <a href="#" class="service-items icon-green">
              	   <i class="fa-solid fa-book"></i>
                </a>
                <a href="#" class="service-items icon-green">
                  <i class="fa-solid fa-person-swimming"></i>
                </a>
                <a href="#" class="service-items icon-green">
                 <i class="fa-solid fa-hand-holding-heart"></i>
                </a>
                <a href="#" class="service-items icon-green">
                 <i class="fa-solid fa-hand-holding-heart"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        <!-- // left-menu -->

        <!-- main-menu -->
      <div class="col-md-6">
          <div class="p-4 rounded-3 shadow-sm bg-white">
            <form class="d-flex">
              <button class="btn btn-outline-success me-2 d-flex justify-content-center align-items-center"
                type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
              <input class="form-control" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
            </form>

            <section class="pt-5">
              <div class="section-container d-flex align-items-center p-3 rounded-3">
                <div class="col-md-3">
                  <img src="${img}/profile-image.png" class="rounded-circle" alt="profile-image" width="100">
                </div>
                <div class="col-md-9">
                  <p class="pb-2">지역(구)</p>
                  <p class="pb-2">모임명</p>
                  <p>인원수<span>상세지역(지하철역)</span></p>
                </div>
              </div>
              <div class="section-container d-flex align-items-center p-3 rounded-3">
                <div class="col-md-3">
                  <img src="${img}/profile-image.png" class="rounded-circle" alt="profile-image" width="100">
                </div>
                <div class="col-md-9">
                  <p class="pb-2">지역(구)</p>
                  <p class="pb-2">모임명</p>
                  <p>인원수<span>상세지역(지하철역)</span></p>
                </div>
              </div>
              <div class="section-container d-flex align-items-center p-3 rounded-3">
                <div class="col-md-3">
                  <img src="${img}/profile-image.png" class="rounded-circle" alt="profile-image" width="100">
                </div>
                <div class="col-md-9">
                  <p class="pb-2">지역(구)</p>
                  <p class="pb-2">모임명</p>
                  <p>인원수<span>상세지역(지하철역)</span></p>
                </div>
              </div>
              <div class="section-container d-flex align-items-center p-3 rounded-3">
                <div class="col-md-3">
                  <img src="${img}/profile-image.png" class="rounded-circle" alt="profile-image" width="100">
                </div>
                <div class="col-9">
                  <p class="pb-2">지역(구)</p>
                  <p class="pb-2">모임명</p>
                  <p>인원수<span>상세지역(지하철역)</span></p>
                </div>
              </div>
            </section>

            <footer style="position: relative;">
              <nav aria-label="..." class="d-flex justify-content-center">
                <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link">
                      <i class="fa-solid fa-chevron-left arrow-icon"></i>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">
                      <i class="fa-solid fa-chevron-right arrow-icon"></i>
                    </a>
                  </li>
                </ul>
              </nav>
               <c:url var="moimAddUrl" value="/add" />
              <button type="button" class="btn btn-primary btn-sm add-btn px-3 btn-blue" onclick="location.href='${moimAddUrl}'">상세</button>
            </footer>
          </div>
        </div>
        <!-- // main-menu -->
 
        <!-- right-menu -->
        <div class="col-md-3">
          <div class="p-4 rounded-3 shadow-sm bg-white" style="height: 738px;">
            <section class="user d-flex justify-content-between align-items-center pb-3">
              <div>
                <img src="${img}/profile-image.png" class="rounded-circle" width="60" alt="profile-image">
              </div>
              <div class="user-info">
                <p class="pb-1">홍길동</p>
                <p>서울특별시</p>
              </div>
              <button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='info'" >수정</button>
            </section>
            <section class="d-flex justify-content-between align-items-center pb-3">
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
              <button type="button" class="btn btn-primary btn-sm btn-blue">편집</button>
            </section>
            <section>
	        <div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        가입한 모임
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" >
      <div class="accordion-body">
         <a href="#"><p class="pb-3">가입 모임A</p></a>
         <a href="#"><p class="pb-3">가입 모임B</p></a>
         <a href="#"><p class="pb-3">가입 모임C</p></a>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        찜 한 모임
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" >
      <div class="accordion-body">
         <a href="#"><p class="pb-3">찜 한 모임A</p></a>
         <a href="#"><p class="pb-3">찜 한 모임B</p></a>
         <a href="#"><p class="pb-3">찜 한 모임C</p></a>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        최근 본 모임
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" >
      <div class="accordion-body">
         <a href="#"><p class="pb-3">최근 본 모임A</p></a>
         <a href="#"><p class="pb-3">최근 본 모임B</p></a>
         <a href="#"><p class="pb-3">최근 본 모임C</p></a>      </div>
    </div>
  </div>
</div>
            </section>
          </div>
        </div>
      
</div>
    </main>
    <!-- // main -->
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>

</body>

</html>