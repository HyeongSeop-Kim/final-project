<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>모임 상세페이지</title>
    <c:url var="cs" value="/resources/css"/>
    <c:url var="img" value="/resources/img/somoim"/>
    <c:url var="meetingimg" value="/resources/img"/>

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

     <link rel="stylesheet" href="${cs}/styles.css" />
  </head>

  <body>
    <!--이미지 사진박스-->
    <header class="p-6">
     <c:url var="moimUpdateImageUrl" value="/moim/imageUpload" />
     <form  action= "${moimUpdateImageUrl}" method="post" enctype="multipart/form-data">
      <div class="img-box img-box-size-1">
        <img id="previewImage"
          class="img-box-size-1 bora-20 shadow-sm width-100"
          alt="이미지 선택"
           src="${meetingimg}/meetingimg1.jpg"
        />        
        <input id="moimImageSelect"
          class="ImgSelect"
          type="file"
          value="이미지 선택"
        />
      </div>
      </form>
      <div class="margin-bottom-20 flex-box margin-left-223">
        <!--아이콘-->
        <div class="psi-r">
          <a
            href="#"
            class="category-box-120 icon-green psi-a bottom-10 left-24"
          >
            <i class="fa-solid fa-suitcase fa-3x"></i>
          </a>
        </div>
        <!--정모이름,편집버튼-->
        <div class="flex-box margin-left-160">
          <div class="margin-10 margin-top-20 font-s-30"> ${moimData.moimTitle}</div>
          <div class="margin-10 margin-top-50">
            <button type="button" class="btn btn-primary">편집</button>
          </div>
          <div class="margin-10 margin-top-50">
            <button type="button" class="btn btn-primary">가입</button>
          </div>
          <div class="margin-10 margin-top-50">
            <button type="button" class="btn btn-primary">찜</button>
          </div>
        </div>
      </div>
    </header>

    <!--헤더 밑에 전부 메인박스-->
    <main class="mainbox p-30">
      <!--네비게이션바-->
      <div>
        <nav
          class="navbar navbar-expand-lg navbar-light"
          style="background-color: #eff1f3"
        >
          <div class="container-fluid">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link" onclick="location.href='/somoim/moim/meeting?id=${moimData.moimId}'">모임</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" onclick="location.href='/somoim/moim/board?id=${moimData.moimId}'" >게시판</a>
              </li>
              <li class="nav-item">
                <a class="nav-link">사진첩</a>
              </li>
              <li class="nav-item">
                <a class="nav-link">채팅</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
      <!--모임정보,모임게시판,모임멤버,버튼, 페이지 전체박스-->
      <section class="flex-box pt-3 px-0 p-3">
        <!-- 모임정보박스 -->
        <div class="col-md-3 bc-wh shadow-sm">
          <div class="margin-10 p-15">
            <div class="center p-6 bc-wg">모임정보</div>
          </div>
          <!-- 모임장정보 -->
          <c:forEach items="${moimParticipants}" var="moimParticipants">
          <c:if test="${moimParticipants.jobId eq 1}">
          <div class="margin-10">
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="100"
              />
              <div>${moimParticipants.jobName}</div>
              <div>${moimParticipants.memberName}</div>
             </div>
           </div>
           </c:if>
          </c:forEach>
          <!-- 모임인포 -->
          <div
            class="p-4 rounded-3 shadow-sm bg-white scroll"
            style="height: 640px; overflow-y: scroll"
          >
            <div class="margin-10">
              <div class="center p-6">
                ${moimData.moimInfo}
              </div>
            </div>
          </div>
        </div>
        <!--모임게시글 박스-->
        <div class="col-md-6 bc-wh shadow-sm p-15 p-3">
          <div class="center margin-10 p-6 bc-wg">모임게시글</div>
          <!--첫번째 게시글 박스-->
            <c:forEach items="${paging.pageData}" var="comment"> <!-- 요기서부터 페이징으로 나눈 데이터 출력시켜주는 코드 --> 
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>${comment.memberName}</small></span>
                      <span class="margin-10"><small>${comment.jobName}</small></span>
                    </div>
                    <span><small>${comment.createDate}</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.boardId}" />
                  <p class="card-text word-hidden">${comment.content }</p>
                </div>
              </div>
            </div>
          </div>
         </c:forEach>
           
         
         
          <!--작성버튼-->
          <div class="text-end margin-right-40">
            <button class="btn btn-sm btn-primary" type="button">작성</button>
          </div>
          <!-- 페이지 -->
           <nav aria-label="Page navigation example ">
            <ul class="pagination justify-content-center">
            	<c:url var="boardUrl" value="/moim/board">
		          <c:param name="id" value="${moimData.moimId}"></c:param>  <!-- /board/detail?id="게시물아이디" 가 출력됨 -->
		        </c:url> 
		        <c:if test="${paging.hasPrevPage()}">
		         <li class="page-item">
		           <a class="page-link" href="${boardUrl}&page=${paging.prevPageNumber}">prev</a>
		         </li>
		        </c:if> 
		        
		        <c:forEach items="${paging.getPageNumberList(paging.currentPageNumber - 2 , paging.currentPageNumber + 2)}" var="num">
		         <li class="page-item ${paging.currentPageNumber eq num ? 'active' : ''}"> <!-- active 넣으면 활성화됨 -->
		           <a class="page-link" href="${boardUrl}&page=${num}">${num}</a>
		         </li>
		        </c:forEach>
		        <c:if test="${paging.hasNextPage()}">
		         <li class="page-item">
		           <a class="page-link" href="${boardUrl}&page=${paging.nextPageNumber}">next</a>
		         </li>
		        </c:if> 
		    </ul>
          </nav>
        </div>
       

        <!--모임멤버박스-->
        <div class="col-md-3 bc-wh shadow-sm p-15">
          <div class="center margin-10 p-6 bc-wg">모임멤버</div>
          <!--스크롤박스-->
          <div
            class="p-4 rounded-3 shadow-sm bg-white scroll"
            style="height: 770px; overflow-y: scroll"
          >
          <c:forEach items="${moimParticipants}" var="moimParticipants">
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>${moimParticipants.jobName}</div>
              <div>${moimParticipants.memberName }</div>
            </div>
            </c:forEach>
            
          </div>
        </div>
      </section>
    </main>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
      function coverImageSelect() {
        const coverImgSelect = document.querySelector(".ImgSelect");
        const coverImg = document.querySelector(".img-box");

        coverImg.addEventListener("click", () => coverImgSelect.click());
      }
    </script>
  </body>
</html>