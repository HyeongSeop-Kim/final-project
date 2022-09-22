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
          <div class="p-4 rounded-3 shadow-sm bg-white scroll "style="height: 1005px; overflow-y: scroll"> 
            <div class="row" >
              <div class="col-6 d-flex flex-column justify-content-center align-items-center" >
             	
             	<div id="cate_1" class="service-items icon-green">
            		<input type="hidden"  value="1" />
             		<i class="fa-solid fa-suitcase"></i>
          		</div>
          		 <span>아웃도어/여행</span>
	        	<div  id="cate_2" class="service-items icon-green">
	        		<input type="hidden"  value="2" />
	            	<i class="fa-solid fa-person-swimming"></i>
	          	</div>
	          	<span>운동/스포츠</span>
	          	<div  id="cate_3" class="service-items icon-green">
	          		<input type="hidden"  value="3" />
	            	<i class="fa-solid fa-book"></i>
	          	</div>
	          	<span>인문학/책/글</span>
	          	<div  id="cate_4" class="service-items icon-green">
	          		<input type="hidden"  value="4" />
	            	<i class="fa-solid fa-language"></i>
	          	</div>
	          	<span>외국/언어</span>
	          	<div  id="cate_5" class="service-items icon-green">
	          		<input type="hidden"  value="5" />
	            	<i class="fa-solid fa-masks-theater"></i>
	          	</div>
	          	<span>문화/공연/축제</span>
	          	<div  id="cate_6" class="service-items icon-green">
	          		<input type="hidden"  value="6" />
	            	<i class="fa-solid fa-music"></i>
	          	</div>
	          	<span>음악/악기</span>
	          	<div  id="cate_7" class="service-items icon-green">
	          		<input type="hidden"  value="7" />
            		<i class="fa-solid fa-palette"></i>
          		</div>
          		<span>공예/만들기</span>
          		<div  id="cate_8" class="service-items icon-green">
          			 <input type="hidden"  value="8" />
           			 <i class="fa-solid fa-user-ninja"></i>
          		</div>
         		 <span>댄스/무용</span>
         		 <div  id="cate_9" class="service-items icon-green">
         		 	 <input type="hidden"  value="9" />
          			 <i class="fa-solid fa-hands"></i>
          		</div>
          		<span>봉사활동</span>
          	
          	</div>	
          	<div class="col-6 d-flex flex-column justify-content-center align-items-center" >
          		
          		<div  id="cate_10" class="service-items icon-green">
          			<input type="hidden"  value="10" />
            		<i class="fa-solid fa-handshake-simple"></i>
          		</div>
          		<span>사교/인맥</span>
          		<div  id="cate_11" class="service-items icon-green">
          			<input type="hidden"  value="11" />
            		<i class="fa-solid fa-car" ></i>
          		</div>
          		<span>차/오토바이</span>
          		<div  id="cate_12" class="service-items icon-green">
          			<input type="hidden"  value="12" />
            		<i class="fa-brands fa-youtube"></i>
          		</div>
          		<span>사진/영상</span>
          		<div  id="cate_13" class="service-items icon-green">
          			<input type="hidden"  value="13" />
            		<i class="fa-solid fa-baseball-bat-ball"></i>
          		</div>
          		<span>야구관람</span>
          		<div  id="cate_14" class="service-items icon-green">
          			<input type="hidden"  value="14" />
            		<i class="fa-solid fa-gamepad"></i>
          		</div>
          		<span>게임/오락</span>
          		<div  id="cate_15" class="service-items icon-green">
          			<input type="hidden"  value="15" />
            		<i class="fa-solid fa-utensils"></i>
          		</div>
          		<span>요리/체조</span>
          		<div  id="cate_16" class="service-items icon-green">
          			<input type="hidden"  value="16" />
            		<i class="fa-solid fa-dog"></i>
          		</div>
          		<span>반려동물</span>
          		<div  id="cate_17" class="service-items icon-green">
          			<input type="hidden"  value="17" />
            		<i class="fa-solid fa-hand-holding-heart"></i>
          		</div>
          		<span>가족/결혼</span>
          		<div  id="cate_18" class="service-items icon-green">
          			<input type="hidden"  value="18" />
            		<i class="fa-solid fa-paper-plane"></i>
          		</div>
          		<span>자유주제</span>
        	</div>
            </div>
          </div>
        </div>
        <!-- // left-menu -->
        <!-- main-menu -->
      <div class="col-md-6">
          <div class="p-4 rounded-3 shadow-sm bg-white">
            <form class="d-flex" method="get" >
              <button id="search_btn"class="btn btn-outline-success me-2 d-flex justify-content-center align-items-center"
                type="button">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
              <input id="list_search" class="form-control" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
              <div class="col-1">
				<select id="page_count" class="form-select" >
					<option value="5" ${sessionScope.pageCount == 5 ? 'selected' : ''}>5 개</option>
					<option value="10" ${sessionScope.pageCount == 10 ? 'selected' : ''}>10 개</option>
					<option value="15" ${sessionScope.pageCount == 15 ? 'selected' : ''}>15 개</option>
					<option value="20" ${sessionScope.pageCount == 20 ? 'selected' : ''}>20 개</option>
				</select>
			  </div>
            </form>

            <section id="m_list" class="pt-5">
	              
            </section>

            <footer style="position: relative;">
              <nav aria-label="..." class="d-flex justify-content-center">
                <ul class="pagination">
                  <li id="p_btn" class="page-item">
                    <button id="p_page" class="page-link">
                      <i class="fa-solid fa-chevron-left arrow-icon"></i>
                    </button>
                  </li>
                  <li id="page_list" class="page-item d-flex">
                  </li>
                  <li id="n_btn" class="page-item">
                    <button id="n_page" class="page-link" >
                      <i class="fa-solid fa-chevron-right arrow-icon"></i>
                    </button>
                  </li>
                </ul>
              </nav>
               <c:url var="moimAddUrl" value="/moim/add" />
              <button type="button" class="btn btn-primary btn-sm add-btn px-3 btn-blue" onclick="location.href='${moimAddUrl}'">개설</button>
            </footer>
          </div>
        </div>
        <!-- // main-menu -->
        <!-- right-menu -->
        <div class="col-md-3">
          <div class="p-4 rounded-3 shadow-sm bg-white" style="height: 1005px;">
            <section class="user d-flex justify-content-between align-items-center pb-3">
              <div>
                <img src="${img}/profile-image.png" class="rounded-circle" width="60" alt="profile-image">
              </div>
              <div class="user-info">
               <c:if test="${not empty sessionScope.loginData}">
                <p class="pb-1">${sessionScope.loginData.memberName}</p>
                <p>${sessionScope.loginData.locationName}</p>
                </c:if>
              </div>
              <div style="display: flex; flex-direction: column; align-items: center;">
              	<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='/somoim/info/myInfo'" style="margin-bottom: 5px;">상세</button>
              	<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='info/myInfo'" style="margin-bottom: 5px;">상세</button>
            	<c:if test="${empty sessionScope.loginData}">
            		<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='logout'" >로그아웃</button>
             	</c:if>
            	<c:if test="${not empty sessionScope.loginData}">
            		<button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='${path}/login/kakao/kakaoLogout'" >로그아웃</button>
             	</c:if>
             </div>
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
				      <div id="join_list" class="accordion-body">
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
				      <div id="bookmark_list" class="accordion-body">
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
				      <div id="last_view_list" class="accordion-body">
				      </div>
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
  <script type="text/javascript">
  let main_page = 1;
  let category_id = 0;
function get_moim_list(page) {
	main_page = page;
	let _url = "./list?page=" + page + "&page_count=" + $('#page_count').val() + "&list_search=" + $('#list_search').val() + "&category_id=" + category_id;
	$.ajax({
		url: _url,
		type: "GET",
		dataType: "json",
		success: function(res) {
			let _html = '';
			let _page = '';
			for (var i=0 ; i < res.datas.length ; i++) {
				_html += '<div id="moim_list" class="section-container d-flex align-items-center p-3 rounded-3" onclick="location.href=\'${path}/moim/meeting?id='+ res.datas[i].moimId +'\'">';
				_html += '<div class="col-md-3">';
				_html += '<img src="'+res.datas[i].moimImagePath +'" class="rounded-circle" alt="profile-image" width="100" height="100">';
				_html += '</div>';
				_html += '<div class="col-md-9">';
				_html += '<p class="pb-2">'+ res.datas[i].locationName +'</p>';
				_html += '<p class="pb-2">'+ res.datas[i].moimTitle +'</p>';
				_html += '<p>정원 : '+ res.datas[i].moimLimit +'명</p>';
				_html += '</div>';
				_html += '</div>';
			}
			$('#m_list').html(_html);

			for (var i=0 ; i < res.pager.pagelist.length; i++) {
				let add_class = '';
					if (res.pager.c_page == res.pager.pagelist[i]) {
						add_class = 'selected';
					}
					_page += '<button class="page-link '+ add_class +'" onclick="get_moim_list('+ res.pager.pagelist[i] +');">'+ res.pager.pagelist[i] +'</button>';
					
			}	
			$('#p_page').attr('onclick', 'get_moim_list('+ res.pager.p_page +');');
			if (res.pager.c_page == 1) {
				$('#p_page').prop('disabled', true);
				$('#p_btn').addClass('disabled');
			} else {
				$('#p_page').prop('disabled', false);
				$('#p_btn').removeClass('disabled');
			}
			$('#n_page').attr('onclick', 'get_moim_list('+ res.pager.n_page +');');

			if (res.pager.is_npage == false) {
				$('#n_page').prop('disabled', true);
				$('#n_btn').addClass('disabled');
			}else{
				$('#n_page').prop('disabled', false);
				$('#n_btn').removeClass('disabled');
			}
			$('#page_list').html(_page);

		},

		error : function(XMLHttpRequest, textStatus, errorThrown){
			alert('error');
		}
	})
}

function get_join_moim_list() {
	$.ajax({
		url:  "./join_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
			}
			$('#join_list').html(_html);
		}
	});
}

function get_bmk_moim_list() {
	$.ajax({
		url:  "./bookmark_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
			}
			$('#bookmark_list').html(_html);
		}
	});
}

$(document).ready(function() {
	let category = $(".service-items");
	get_moim_list(1);
	get_join_moim_list();
	get_bmk_moim_list();
	
	$('.service-items').on('mouseover', function() {
		$(this).addClass('hover');
	});
	$('.service-items').on('mouseout', function() {
		$(this).removeClass('hover');
	});
	// 카테고리 서치
	$('.service-items').on('click', function() {
		_this = $(this);
		let temp = _this.attr('id').split('_');
		category_id = temp[1];		
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
		get_moim_list(1);
	});
	
	$('#page_count').on('change', function() {
		get_moim_list(main_page);
	});
	$('#search_btn').on('click', function(){
		// 검색버튼 클릭시 함수호출
		get_moim_list(1);
	});
	$('#list_search').on('keydown', function(e) {
		if(e.keyCode == 13){
			e.preventDefault();
			get_moim_list(1);
		}
	});

});



</script>
  <script src="${path}/resources/js/category.js"></script>
  <script src="${path}/resources/js/components/popup.js"></script>
</body>

</html>