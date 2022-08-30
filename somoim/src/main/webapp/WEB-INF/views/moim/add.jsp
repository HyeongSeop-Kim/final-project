<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<c:url var="cs" value="/resources/css"/>
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
  <link rel="stylesheet" href="${cs}/reset.css" />
  <link rel="stylesheet" href="${cs}/style.css" />
  <title>Demo</title>
</head>

<body>
  <div class="wrap p-5">
    <!-- header -->
    <header class="container d-flex justify-content-center align-items-center rounded-3 shadow-sm bg-white">
      <h1 class="title">소모임</h1>
      <i class="fa-solid fa-comments mx-2"></i>
    </header>
    <!-- // header -->

    <!-- main -->
    <main class="container pt-3 px-0">
      <div class="row"> 
	
		<!-- add menu -->
		 <div class="col-md-9">
			<div class="p-4 rounded-3 shadow-sm bg-white" style="height: 100%;">
						<h4 class="mb-3">모임 개설</h4>
					<form class="needs-validation" novalidate action="">
						<div>
							<label for="loction" class="form-label">지역</label>	
								<select id ="location "class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
								  <option selected>지역 선택</option>
								  <option value="1">서울</option>
								  <option value="2">대전</option>
								  <option value="3">대구</option>
								  <option value="3">부산</option>
								  <option value="3">제주도</option>
								</select>
						</div>
           			  <div >
             	<h1 class="mb-3"> 관심사 선택</h1>
             	<p class="mb-3">
					  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					    관심 카테고리 더보기
					  </button>
				</p>
				<div class="collapse" id="collapseExample">
					  <div class="card card-body mb-3" >
      			<section class="d-flex" >
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music kang"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">1</label>
	               		 </div>
	                </div>
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">2</label>
	               		 </div>
	                </div>
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">3</label>
	               		 </div>
	                </div>
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">4</label>
	               		 </div>
	                </div>
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">5</label>
	               		 </div>
	                </div>
	              	<div class="col">
	              		<label class="service-items icon-green " for ="chk">	
               					 <i class="fa-solid fa-music"></i>
	               		 </label>
	               		 <div>
		               		 <input class="form-check-input" type="checkbox" id="chk" value=""> 
		               		 <label class="form-check-label mt-1" for="chk">6</label>
	               		 </div>
	                </div>
	                
	
      		 </section>
  			</div>
		</div>
  			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">모임명</span>
			  <input type="text" class="form-control" placeholder="모임 이름 " aria-label="Username" aria-describedby="basic-addon1">
			</div>
			 <div class="input-group mb-3">
			  <span class="input-group-text">모임 설명</span>
			  <textarea class="form-control" style="height: 200px; resize:none;"  placeholder="최대 300자" aria-label="With textarea"></textarea>
			</div>
			<div> 
				<section class="d-flex">
				 	<div class="col-md-8">
				 	</div>
				 	<div class="col input-group mb-3">
 					  	<span class="input-group-text" id="basic-addon1">정원(5~300명)</span>
			 			 <input type="text" class="form-control" placeholder="정원수 " aria-label="Username" aria-describedby="basic-addon1">
				 	</div>
			 	</section>
			 	<div class="d-grid gap-2 col-5 mx-auto">
  					<button class="btn btn-primary" type="submit">만들기</button>
  					<button class="btn btn-primary" type="button" onclick="location.href='/home/main'">뒤로가기</button>
				</div>
				
			</div>
		</div>
</form>
</div>
</div>
            
        <!-- right-menu -->
        <div class="col-md-3">
          <div class="p-4 rounded-3 shadow-sm bg-white">
            <section class="user d-flex justify-content-between align-items-center pb-3">
              <div>
                <img src="${img}/profile-image.png" class="rounded-circle" width="60" alt="profile-image">
              </div>
              <div class="user-info">
                <p class="pb-1">홍길동</p>
                <p>서울특별시</p>
              </div>
              <button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='add'">등록</button>
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
        <!-- // right-menu -->

    </main>
    <!-- // main -->
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>