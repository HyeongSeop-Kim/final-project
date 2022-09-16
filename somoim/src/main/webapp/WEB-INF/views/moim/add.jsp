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
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  <title>소모임</title>
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
    <!-- 
    	 container :  margin: 1rem 5rem;
		 pt-3 : padding top : 1rem !important
    	 px-0 : padding-right: 0!important   padding-left: 0!important;
     -->
    <main class="container pt-3 px-0">
      <div class="row"> 
		<!-- add menu -->
		 <div class="col-md-9">
			<div class="p-4 rounded-3 shadow-sm bg-white" style="height: 100%;">
				<h4 class="mb-3">모임 개설</h4>
					<form id="form1" class="needs-validation" method="post">
						<div>
							<label for="loction" class="form-label">지역&nbsp;<small style="font-size: 12px; color: red;">*필수</small></label>	
								<select id ="location" name="locationId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
								  <option selected value="">지역 선택</option>
								  <c:forEach var="locList" items="${requestScope.locDatas}">
								  	<option value="${locList.locationId}">${locList.locationName}</option>
								  </c:forEach>
								</select>
					     	</div>
				           	<div>
				             	<h1 class="mb-3"> 관심사 선택&nbsp;<small style="font-size: 12px; color: red;">*필수</small></h1>
				             	<p class="mb-3">
								  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
								    관심 카테고리 더보기
								  </button>
								</p>
								<div class="collapse" id="collapseExample">
									  <div class="card card-body mb-3" >
				      					<section class="d-flex" >
					              		  <div class="col">
				              				<div class="row" >
								              <div class="col-3 d-flex flex-column justify-content-center align-items-center" >
								             	<div id="cate_1" class="service-items icon-green">
								            		<input type="radio"  name="categoryId" value="1" style="display:none"/>
								             		<i class="fa-solid fa-suitcase"></i>
								          		</div>
								          		 <span>아웃도어/여행</span>
									        	<div  id="cate_2" class="service-items icon-green">
									        		<input type="radio"  name="categoryId" value="2" style="display:none"/>
									            	<i class="fa-solid fa-person-swimming"></i>
									          	</div>
									          	<span>운동/스포츠</span>
									          	<div  id="cate_3" class="service-items icon-green">
									          		<input type="radio"  name="categoryId" value="3" style="display:none" />
									            	<i class="fa-solid fa-book"></i>
									          	</div>
									          	<span>인문학/책/글</span>
									          	<div  id="cate_4" class="service-items icon-green">
									          		<input type="radio"  name="categoryId" value="4" style="display:none"/>
									            	<i class="fa-solid fa-language"></i>
									          	</div>
									          	<span>외국/언어</span>
									          	<div  id="cate_5" class="service-items icon-green">
									          		<input type="radio"  name="categoryId" value="5" style="display:none"/>
									            	<i class="fa-solid fa-masks-theater"></i>
									          	</div>
									          	<span>문화/공연/축제</span>
								          	</div>	
								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >
									          	<div  id="cate_6" class="service-items icon-green">
									          		<input type="radio"  name="categoryId" value="6"style="display:none"/>
									            	<i class="fa-solid fa-music"></i>
									          	</div>
									          	<span>음악/악기</span>
									          	<div  id="cate_7" class="service-items icon-green">
									          		<input type="radio"  name="categoryId" value="7" style="display:none"/>
								            		<i class="fa-solid fa-palette"></i>
								          		</div>
								          		<span>공예/만들기</span>
								          		<div  id="cate_8" class="service-items icon-green">
								          			 <input type="radio"  name="categoryId" value="8" style="display:none"/>
								           			 <i class="fa-solid fa-user-ninja"></i>
								          		</div>
								         		 <span>댄스/무용</span>
								         		 <div  id="cate_9" class="service-items icon-green">
								         		 	 <input type="radio"  name="categoryId" value="9" style="display:none"/>
								          			 <i class="fa-solid fa-hands"></i>
								          		</div>
								          		<span>봉사활동</span>
								          		<div  id="cate_10" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="10" style="display:none"/>
								            		<i class="fa-solid fa-handshake-simple"></i>
								          		</div>
								          		<span>사교/인맥</span>
								          	</div>
								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >
								          		<div  id="cate_11" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="11" style="display:none"/>
								            		<i class="fa-solid fa-car" ></i>
								          		</div>
								          		<span>차/오토바이</span>
								          		<div  id="cate_12" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="12" style="display:none"/>
								            		<i class="fa-brands fa-youtube"></i>
								          		</div>
								          		<span>사진/영상</span>
								          		<div  id="cate_13" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="13" style="display:none"/>
								            		<i class="fa-solid fa-baseball-bat-ball"></i>
								          		</div>
								          		<span>야구관람</span>
								          		<div  id="cate_14" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="14" style="display:none"/>
								            		<i class="fa-solid fa-gamepad"></i>
								          		</div>
								          		<span>게임/오락</span>
								          		<div  id="cate_15" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="15" style="display:none"/>
								            		<i class="fa-solid fa-utensils"></i>
								          		</div>
								          		<span>요리/체조</span>
								          	</div>	
								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >	
								          		<div  id="cate_16" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="16" style="display:none"/>
								            		<i class="fa-solid fa-dog"></i>
								          		</div>
								          		<span>반려동물</span>
								          		<div  id="cate_17" class="service-items icon-green">
								          			<input type="radio"  name="categoryId" value="17" style="display:none"/>
								            		<i class="fa-solid fa-hand-holding-heart"></i>
								          		</div>
								          		<span>가족/결혼</span>
								          			<input type="radio"  name="categoryId" value="18" style="display:none"/>
								          		<div  id="cate_18" class="service-items icon-green">
								            		<i class="fa-solid fa-paper-plane"></i>
								          		</div>
								          		<span>자유주제</span>
								        	</div>
								          </div>
					                  </div>
				      		   </section>
				  			</div>
						</div>
				  			<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1">모임명&nbsp;<small style="font-size: 12px; color: red;">*필수</small></span>
							  <input type="text" class="form-control" placeholder="모임 이름" name="moimTitle" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							 <div class="input-group mb-3">
							  <span class="input-group-text">모임 설명</span>
							  <textarea class="form-control" style="height: 200px; resize:none;"  placeholder="최대 300자" name="moimInfo" aria-label="With textarea"></textarea>
							</div>
							<div> 
								<section class="d-flex">
								 	<div class="col-md-8">
								 	</div>
								 	<div class="col input-group mb-3">
				 					  	<span class="input-group-text" id="basic-addon1">정원(5~300명)</span>
							 			 <input type="text" class="form-control" placeholder="정원수" name="moimLimit" aria-label="Username" aria-describedby="basic-addon1">
								 	</div>
							 	</section>
							 	<div class="d-grid gap-2 col-5 mx-auto">
				  					<button class="btn btn-primary" type="button" onclick="addData();">만들기</button>
				  					<button class="btn btn-primary" type="button" onclick="list();">목록</button>
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
				      <div id="add_join_list" class="accordion-body">
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
				      <div id="add_bookmark_list" class="accordion-body">
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
				         <a href="#"><p class="pb-3">최근 본 모임C</p></a>     
				      </div>
				    </div>
				  </div>
				</div>
            </section>
          </div>
        </div>
        <!-- // right-menu -->
	</div>
    </main>
    <!-- // main -->
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
 </script>
<script type="text/javascript">
  
function addData(){
	
	if($('#location').val() == null || $('#location').val() == "" ) {
		alert("지역을 선택하세요.");
		return; 
	}
	if($('input[name="categoryId"]:checked').val() == null || $('input[name="categoryId"]:checked').val() == "" ){
		alert("관심사를 선택하세요.");
		return; 
	}
	if($('input[name="moimTitle"]').val() == null || $('input[name="moimTitle"]').val() == ""){
		alert("모임명을 작성하세요.");
		return;
	}
	var formData = $("#form1").serialize();
	$.ajax({
		url: "add",
		type: "POST",
		data: formData,
		dataType: "json",
		success: function(data) {
			if(data.data){
				location.href = '/somoim';
			}else{
				alert(data.message);
			}	
		}
		
	})	
}

function list() {
	location.href = '/somoim';
}

function get_add_join_moim_list() {
	$.ajax({
		url:  "./add/add_join_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
			}
			$('#add_join_list').html(_html);
		}
	});
}

function get_add_bmk_moim_list() {
	$.ajax({
		url:  "./add/add_bookmark_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
			}
			$('#add_bookmark_list').html(_html);
		}
	});
}


$(document).ready(function() {	
	get_add_join_moim_list();
	get_add_bmk_moim_list();
	
	
	 $('.service-items').on('mouseover', function() {
		$(this).addClass('hover');
	 });
	 $('.service-items').on('mouseout', function() {
		$(this).removeClass('hover');
	 });	
		
	 $('.service-items').on('click', function(){
		_this = $(this)
		_this.children('input').prop('checked', true);
		if (_this.hasClass('selected') == false) {
			_this.addClass('selected');	
		} else {
			_this.removeClass('selected');
			category_id = 0;
		}
	$('.service-items').each(function() {
		if (_this.children('input').val() != $(this).children('input').val()) {
			$(this).removeClass('selected');
		} 
		});
	 });
});

</script>
</body>
</html>