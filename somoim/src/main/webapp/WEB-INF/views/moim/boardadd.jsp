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

    <main class="container pt-3 px-0">
      <div class="row"> 
		<!-- add menu -->
		 <div class="col-md-9">
			<div class="p-4 rounded-3 shadow-sm bg-white" style="height: 100%;">
				<h4 class="mb-3">게시글 작성</h4>
				    <c:url var="boardAddUrl" value="/moim/board/add"/>
					<form id="form1" class="needs-validation" action="${boardAddUrl}?id=${moimId}" method="post">
					   <div>
					        <input id="memberId" type="hidden" value="${sessionScope.loginData.memberId}">
					   	    <div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1">작성자</span>
							  <span class="input-group-text" id="basic-addon1">${sessionScope.loginData.memberName}</span>
							</div>
				            <div class="input-group mb-3">
							  <span class="input-group-text" id="basic-addon1">게시글 제목</span>
							  <input type="text" class="form-control" placeholder="게시글 제목" name="boardTitle" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							 <div class="input-group mb-3">
							  <span class="input-group-text">게시글 내용</span>
							  <textarea class="form-control" style="height: 200px; resize:none;"  placeholder="게시글 내용" name="content" aria-label="With textarea"></textarea>
							</div>
							<div> 
								<section class="d-flex">
								 	<div class="col-md-8">
								 	</div>
								</section>
							 	<div class="d-grid gap-2 col-5 mx-auto">
				  					<button class="btn btn-primary" type="submit">작성</button> <!-- 목록으로 -->
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
							<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='/somoim/info/myInfo'" style="margin-bottom: 5px;">상세</button>
							<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='/somoim/logout'" >로그아웃</button>
            </section>
						<section id="cate" class="d-flex justify-content-between align-items-center pb-3">
							<c:if test="${not empty sessionScope.loginData}">
								<script>
									window.onload = () => {
										addEventListener("DOMContentLoaded", printCate("${sessionScope.loginData.category}"));
									};
								</script>
							</c:if>
							<button type="button" class="btn btn-primary btn-sm btn-blue" onclick="popCategory();">편집</button>
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
				      <div id="board_join_list" class="accordion-body">
				        
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
				      <div id="board_bookmark_list" class="accordion-body">
				         <
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
		
		function get_board_join_moim_list() {
			$.ajax({
				url:  "./add/board_join_list",
				type: "GET",
				dataType: "json",
				success: function(data) {
					let _html = '';
					for (var i=0 ; i < data.length ; i++) {
						_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
					}
					$('#board_join_list').html(_html);
				}
			});
		}

		function get_board_bmk_moim_list() {
			$.ajax({
				url:  "./add/board_bookmark_list",
				type: "GET",
				dataType: "json",
				success: function(data) {
					let _html = '';
					for (var i=0 ; i < data.length ; i++) {
						_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
					}
					$('#board_bookmark_list').html(_html);
				}
			});
		}
		$(document).ready(function(){
			get_board_join_moim_list()
			get_board_bmk_moim_list()
		});
	</script>
	<script src="${path}/resources/js/category.js"></script>
	<script src="${path}/resources/js/components/popup.js"></script>
</body>
</html>