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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<header>
		<nav>
		
		</nav>
	</header>
	
	<section class="myPage" >	
		<c:url var="myInfoUpdateUrl" value="/info" />
		<div class="coverImg" onclick='coverImageSelect();'>
			<input class="coverImgSelect" type="file" name="uploadImg" value="이미지 선택" style="display: none;">
		</div>
				<!--프로필 사진 -->	
			<div class="simple-info-box">
				<div class="profile-user-img">
					<a href="#">
						<img class="profile"  src="${path}/resources/img/profile.png" onclick='profileSelect();'>
						<input class="imgSelect" type="file" name="uploadImg" value="이미지 선택" style="display: none;">
					</a>
				</div>
				<!-- 이름, 생년월일, 거주지역 -->
				<div class="simple-info">
					<input class="name" type="text" value="홍길동" disabled>
					<span class="material-icons"  style="font-size:40px; color: gray;">date_range</span><input class="birth" type="text" value="2000.06.25"  disabled>
					<span class="material-icons" style="font-size:40px; color: gray;">room</span><input class="location" type="text" value="서울특별시" disabled>
				</div>
				<!-- 카테고리 이미지 반복문으로 하나씩 추가되게끔? -->
				<div class="category-box">	
					<div class="category-img">
			  			<img class="category" src="${path}/resources/img/image1.png">
					</div>
					<div class="category-img">
			  			<img class="category" src="${path}/resources/img/image2.png">
					</div>
					<div class="category-img">
			  			<img class="category" src="${path}/resources/img/camera.png">
					</div>
				</div>	
				<div class="imgSelect-box">
					<!-- 아이콘 누르면 파일선택창 열리게 하고싶음-->
				  <a href="#" style="color: gray;">
					<i class="material-icons" style="font-size:35px;">camera_alt</i>
				  </a>	
					<button type="button" class="btn btn-secondary btn-lg coverImage" style="font-size: 150%; background-color: rgb(98, 161, 254);">커버 사진 추가</button>
					<button type="button" class="btn btn-secondary btn-lg modify" style="font-size: 150%; background-color: rgb(98, 161, 254);">프로필 편집</button>
				</div>
			</div>
	</section>
	<br>	
	<div class="main-container">
	<main class="main">
		<section>
			 <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm">
		          <div class="card-header py-3">
		            <h2 class="my-0 fw-normal">가입한 모임</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li>
		              	<div class="moim-box">
		              		<div class="img-list">
			              		<img class="moim-img" src="${path}/resources/img/image.png">
			              	</div>
			              	<div class="a-list">
			              		<a class="moim-name"  href="#">[광화문.을지로]안정적인 직장인</a>
		              		</div>
		              	</div>
		              	<div class="moim-box">
		              		<div class="img-list">
			              		<img class="moim-img" src="${path}/resources/img/exercise.png">
			              	</div>
			              	<div class="a-list">
			              		<a class="moim-name"  href="#">[강남]운동 모임</a>
			              	</div>	
		              	</div>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm">
		          <div class="card-header py-3">
		            <h2 class="my-0 fw-normal">작성한 글</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li>
						<div class="moim-box">
		              		<div class="img-list">
			              		<img class="moim-img" src="${path}/resources/img/exercise.png">
			              	</div>
			              	<div class="a-list">
			              		<a class="moim-name"  href="#">[강남]운동 모임</a>
			              	</div>	
		              	</div>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		      <div class="col">
		        <div class="card mb-4 rounded-3 shadow-sm ">
		          <div class="card-header py-3" >
		            <h2 class="my-0 fw-normal">작성한 댓글</h2>
		          </div>
		          <div class="card-body scroll" style="overflow-y: scroll">
		            <ul class="list-unstyled mt-3 mb-4">
		              <li>
		              	<div class="comment-box">
			              	<div class="comment-info">
			           			<span class="comment-name">홍길동</span>
			           			<span class="comment-date"><small>2022.08.28</small></span>
			              	</div>
			              	<div class="comment">
			              		<span>댓글 내용</span>
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
	</script>
</body>
</html>