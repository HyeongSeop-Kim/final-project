<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/reset.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
    integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<section class="myPage" >	
		<c:url var="myInfoUpdateUrl" value="/info" />
		<div class="coverImg" onclick='coverImageSelect();'>
			<!-- 타이틀 이미지 들어갈때 너비 1200px 높이 350px로 맞춰주는 로직을 짜거나 필터로 알림띄우기 해줘야할듯 -->
			<img class="title-img" src="${path}/resources/img/exercise.png">
			<input class="coverImgSelect" type="file" name="uploadImg" value="이미지 선택">
		</div>
				<!--프로필 사진 -->	
			<div class="simple-info-box">
				<div class="profile-user-img">
					<img class="profile"  src="${path}/resources/img/profile.png" onclick='profileSelect();'>
					<input class="imgSelect" type="file" name="uploadImg" value="이미지 선택">
				</div>
				<!-- 이름, 생년월일, 거주지역 -->
				<div class="simple-info">
					<input class="name" type="text" value="홍길동" disabled>
					<span class="material-icons"  style="font-size:40px; color: gray;">date_range</span><input class="birth" type="text" value="2000.06.25"  disabled>
					<span class="material-icons" style="font-size:40px; color: gray;">room</span><input class="location" type="text" value="서울특별시" disabled>
				</div>
				<!-- 카테고리 이미지 반복문으로 하나씩 추가되게끔? -->
				 <section class="d-flex justify-content-between align-items-center pb-3 category-box">
				 	<div class="category-img">
	           			<i class="fa-solid fa-person-swimming icon-green service-sm-items category tage"></i>
	           		</div>
	           		<div class="category-img">
	           			<i class="fa-solid fa-person-swimming icon-green service-sm-items category tage"></i>
	           		</div>
	           		<div class="category-img">
	           			<i class="fa-solid fa-person-swimming icon-green service-sm-items category tage"></i>
            		</div>
            	</section>
				<div class="imgSelect-box">
					<!-- 아이콘 누르면 파일선택창 열리게 하고싶음-->
					<button type="button" class="btn btn-secondary btn-lg coverImage" style="font-size: 150%; ">커버 사진 변경</button>
					<input  id="coverImgSelect-btn" type="file" name="uploadImg" value="이미지 선택" onclick='onClickUpload();'>
					<button type="button" class="btn btn-secondary btn-lg modify" style="font-size: 150%; ">프로필 편집</button>
				</div>
			</div>
	</section>
	<br>
		
	<div class="main-container">
	<main class="main">
		<section>
			<!-- 가입한 모임 카드 -->
			 <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm">
		          <div class="card-header py-3">
		            <h2 class="my-0 fw-normal">가입한 모임</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li class="pati-list" OnClick="location.href =''">
				         <div class="section-container d-flex align-items-center p-3 rounded-3 pati-info">
			                <div class="col-md-3">
			                  <img src="${path}/resources/img/exercise.png " class="rounded-circle moim-img" alt="profile-image" width="100">
			                </div>
			                <div class="col-md-9 moim-info">
			                  <p class="pb-2">지역(구)</p>
			                  <p class="pb-2">모임명</p>
			                  <p>인원수<span>상세지역(지하철역)</span></p>
			                </div>
			              </div>
		              </li>
		               <li class="pati-list">
				         <div class="section-container d-flex align-items-center p-3 rounded-3 pati-info" OnClick="location.href =''">
			                <div class="col-md-3">
			                  <img src="${path}/resources/img/image.png" class="rounded-circle moim-img"  alt="profile-image" width="100">
			                </div>
			                <div class="col-md-9 moim-info">
			                  <p class="pb-2">지역(구)</p>
			                  <p class="pb-2">모임명</p>
			                  <p>인원수<span>상세지역(지하철역)</span></p>
			                </div>
			              </div>
		              </li>
		               <li class="pati-list">
				         <div class="section-container d-flex align-items-center p-3 rounded-3 pati-info" OnClick="location.href =''">
			                <div class="col-md-3">
			                  <img src="${path}/resources/img/profile.png" class="rounded-circle moim-img" alt="profile-image" width="100">
			                </div>
			                <div class="col-md-9 moim-info">
			                  <p class="pb-2">지역(구)</p>
			                  <p class="pb-2">모임명</p>
			                  <p>인원수<span>상세지역(지하철역)</span></p>
			                </div>
			              </div>
		              </li>
		               <li class="pati-list">
				         <div class="section-container d-flex align-items-center p-3 rounded-3 pati-info" OnClick="location.href =''">
			                <div class="col-md-3">
			                  <img src="${path}/resources/img/profile.png" class="rounded-circle moim-img" alt="profile-image" width="100">
			                </div>
			                <div class="col-md-9 moim-info">
			                  <p class="pb-2">지역(구)</p>
			                  <p class="pb-2">모임명</p>
			                  <p>인원수<span>상세지역(지하철역)</span></p>
			                </div>
			              </div>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		      <!-- 작성글 카드 -->
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm">
		          <div class="card-header py-3">
		            <h2 class="my-0 fw-normal">작성한 글</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li class="pati-list">
				         <div class="section-container d-flex align-items-center p-3 rounded-3 pati-info" OnClick="location.href =''">
			                <div class="col-md-9 moim-info">
			                  <p class="pb-2">작성글 제목</p>
			                  <p class="pb-2">모임명</p>
			                  <p>작성일자</p>
			                </div>
			              </div>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		      <!-- 작성 댓글 카드 -->
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm ">
		          <div class="card-header py-3" >
		            <h2 class="my-0 fw-normal">작성한 댓글</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li class="comment-list">
		              	<div class="section-container d-flex align-items-center p-3 rounded-3 pati-info">
		              	<div class="comment-box">
			              	<div class="comment-info">
			           			<span class="comment-name">홍길동</span>
			           			<span class="comment-date"><small>2022.08.28</small></span>
			              	</div>
			              	<div class="comment">
			              		<span>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span>
			              	</div>
		              	</div>
		              	</div>
		              </li>
		               <li class="comment-list">
		              	<div class="section-container d-flex align-items-center p-3 rounded-3 pati-info">
		              	<div class="comment-box">
			              	<div class="comment-info">
			           			<span class="comment-name">홍길동</span>
			           			<span class="comment-date"><small>2022.08.28</small></span>
			              	</div>
			              	<div class="comment">
			              		<span>화이팅!!</span>
			              	</div>
		              	</div>
		              	</div>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		    </div>
		</section>    
	</main>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  	
  	
	<script type="text/javascript">
		function profileSelect(){
			const imgSelect = document.querySelector('.imgSelect');
			const profile = document.querySelector('.profile');
			
			profile.addEventListener('click', () => imgSelect.click());
		}
		
		function coverImageSelect(){
			const coverImgSelect = document.querySelector('.coverImgSelect');
			const coverImg = document.querySelector('.coverImg');
			
			coverImg.addEventListener('click', () => coverImgSelect.click());
		}
		function onClickUpload() {
	            let myInput = document.getElementById('coverImgSelect-btn');
	            myInput.click();
		 }
	</script>
</body>
</html>