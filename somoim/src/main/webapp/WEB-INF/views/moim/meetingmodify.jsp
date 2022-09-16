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

<script type="text/javascript">
   function formCheck(form) {
	   if(form.moimLimit.value < 5 || form.moimLimit.value > 300 ){
		   var modal = new bootstrap.Modal(document.getElementById("errorModal"), {
			      keyboard: false
			});
		   modal.show()
		   return;
		   
	   }else if(form.moimLimit.value < ${currentMemberCount}){
		   var modal2 = new bootstrap.Modal(document.getElementById("errorModal2"), {
			      keyboard: false
			});
		   modal2.show()
		   return;
		   
	   }
	   form.submit();
   }
</script>


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
				<h4 class="mb-3">모임 편집</h4>
					<form id="form1" class="needs-validation" action="/somoim/moim/update?id=${somoimDto.moimId}&test=${test}" method="post">
						<div>
							<label for="loction" class="form-label">지역</label>	
								<select id ="location" name="locationId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" >
								  <option value="${somoimDto.locationId}" selected>${somoimDto.locationName}</option>
								  
								  <c:forEach var="locList" items="${locList}">
								   <c:if test="${somoimDto.locationName ne locList.locationName}">
								  	<option value="${locList.locationId}">${locList.locationName}</option>
								   </c:if>
								  </c:forEach>
								  
								</select>
					     	</div>
				           	<div>
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
					              			<c:forEach var="categoryList" items="${categoryList}">	
					               		 	
					               		 	   <div>
					               		 		  <input class="form-check-input" type="radio" name="categoryId" value="${categoryList.categoryId}" ${categoryList.categoryId == somoimDto.categoryId ? 'checked' : ''}> 
						               		      <label class="form-check-label mt-1" for="categoryId">${categoryList.categoryName}</label>
					               			   </div>
					               		</c:forEach> 
					                </div>
				      		 </section>
				  			</div>
						</div>
				  			<div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1">모임명</span>
							  <input type="text" class="form-control" placeholder="모임 이름" name="moimTitle" aria-label="Username" aria-describedby="basic-addon1" value="${somoimDto.moimTitle}">
							</div>
							 <div class="input-group mb-3">
							  <span class="input-group-text">모임 설명</span>
							  <textarea class="form-control" style="height: 200px; resize:none;"  placeholder="최대 300자" name="moimInfo" aria-label="With textarea">${somoimDto.moimInfo}</textarea>
							</div>
							<div> 
								<section class="d-flex">
								 	<div class="col-md-8">
								 	</div>
								 	<div class="col input-group mb-3">
				 					  	<span class="input-group-text" id="basic-addon1">정원(5~300명)</span>
							 			 <input type="text" class="form-control" placeholder="정원수" name="moimLimit" aria-label="Username" aria-describedby="basic-addon1" value="${somoimDto.moimLimit}" >
								 	</div>
							 	</section>
							 	<div class="d-grid gap-2 col-5 mx-auto">
				  					<button class="btn btn-primary" type="button" onclick="formCheck(this.form);">수정</button>
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
              <button type="button" class="btn btn-primary btn-sm btn-blue" >수정</button>
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
	       <!-- modal -->
			<div class="modal fade" id="errorModal" tabindex="-1"  aria-hidden="true">  <!-- 모달띄우기 정원수초과 -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">입력 오류</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						정원수는 최소 5명 ~ 최대 300명 사이로 설정할 수 있습니다. <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		
		   <!-- modal2 -->
			<div class="modal fade" id="errorModal2" tabindex="-1"  aria-hidden="true">  <!-- 모달띄우기 현재멤버보다 적게 수정할떄 -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title">입력 오류</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						현재 정원수는 ${currentMemberCount}명 입니다.<br>
					    현재 정원수 이상 ~ 300 명 이하로 설정할 수 있습니다. <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
    </main>
    <!-- // main -->
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  <script type="text/javascript">
		function addData(){
			var formData = $("#form1").serialize();
			$.ajax({
				url: "add",
				type: "POST",
				data: formData,
				dataType: "json",
				success: function(data) {
					location.href = '/somoim';
				}
			})	
		}
		function list() {
			location.href = '/somoim';
		}
	</script>
</body>
</html>