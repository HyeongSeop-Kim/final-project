<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>${moimData.moimTitle}모임 입니다.</title>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
  <c:url var="cs" value="/resources/css"/>
  <c:url var="img" value="/resources/img/somoim"/>
  <c:url var="meetingimg" value="/resources/img"/>
  <c:url var="resourcesUrl" value="/resources"/>


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

  <link rel="stylesheet" href="${cs}/styles.css"/>
  <script type="text/javascript" src="${resourcesUrl}/js/jquery-3.6.0.min.js"></script>
</head>

<script type="text/javascript">
    window.onload = function () {
        previewImage.addEventListener("click", function (e) {
            moimImageSelect.click();
        });

        moimImageSelect.addEventListener("change", ajaxImageUpload);

    }

    function ajaxImageUpload(e) {

        var file = e.target.files[0];
        var fData = new FormData(); //파일객체정보를 만들어서 추가해서 보내줄필요가잇음
        fData.append("moimimage", file, file.name);
        fData.append("id", "${moimData.moimId}"); // enctype="multipart/form-data" 형식으로 할떄는 FormData에 데이터 다 넣어줘야함!
        $.ajax({      //Ajax사용시 jquery필요
            type: "post",
            enctype: "multipart/form-data",
            url: "/somoim/moim/imageUpload",
            data: fData,
            dataType: "json",
            processData: false, //Ajax로 파일업로드시 필요
            contentType: false, //Ajax로 파일업로드시 필요
            success: function (data, status) {
                previewImage.src = data.url; //Ajax를통해 알아온경로로 너의src속성을바꿔라

            }
        });

}
</script>

<script type="text/javascript">


  function joinCheck(moimId){
        $.ajax({
            url: "/somoim/moim/join",
            type: "get",
            data: {
                id: moimId
            },
            dataType: "json",
            success: function (data) {
    			if(data.code === "alreadyJoinMember"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "over"){
                    alert(data.message);
                    location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
                } else if (data.code === "success") {
                    alert(data.message);
                    location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
    			}else if(data.code === "joinCountover"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}
    		}
    	})
    }

</script>
 <script type="text/javascript">


  function bookmarkAdd(moimId,memberId){  //북마크추가
	  	$.ajax({
    		url: "/somoim/moim/bookmarkAdd",
    		type: "get",
    		data: {
    			id:moimId,
    			memberId:memberId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "bookmarkover"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "alreadybookmark"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "bookmarked"){
    				alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "error"){
    				alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}
    		}
    	})
    }

</script>

 <script type="text/javascript">


  function bookmarkDelete(moimId,memberId){ //북마크 삭제
	  	$.ajax({
    		url: "/somoim/moim/bookmarkDelete",
    		type: "get",
    		data: {
    			id:moimId,
    			memberId:memberId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "deletebookmark"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "alreadybookmarkdelete"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "nodetabookmark"){
    				alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
    			}else if(data.code === "error"){
    				alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
                }
            }
        })
    }

</script>



<body>
<c:url var="boardUrl" value="/moim/board/">
  <c:param name="id" value="${moimData.moimId}">모임 입니다.</c:param>
</c:url>
<!--이미지 사진박스-->
<header class="p-6">
  <c:url var="moimUpdateImageUrl" value="/moim/imageUpload?id=${moimData.moimId}"/>
  <form action="${moimUpdateImageUrl}" method="post" enctype="multipart/form-data">
    <div class="img-box img-box-size-1">
      <img id="previewImage"
           class="img-box-size-1 bora-20 shadow-sm width-100"
           alt="이미지 선택"
           src="${path}/resources/img/moim/${moimData.moimId}.png"
      />
        <c:if test="${res.jobId eq 1}">
      <input id="moimImageSelect"
             class="ImgSelect"
             type="file"
             value="이미지 선택"
             name="moimimage"
             multiple

      />
         </c:if>
    </div>
  </form>
  <div class="margin-bottom-20 flex-box margin-left-223">
    <!--아이콘-->
    <div class="psi-r">
      <a
              href="#"
              class="category-box-120 icon-green psi-a bottom-10 left-24"
      >
        <c:choose>
          <c:when test="${moimData.categoryId eq 1 }">
            <i class="fa-solid fa-suitcase fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 2 }">
            <i class="fa-solid fa-person-swimming fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 3}">
            <i class="fa-solid fa-book fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 4}">
            <i class="fa-solid fa-language fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 5}">
            <i class="fa-solid fa-masks-theater fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 6}">
            <i class="fa-solid fa-music fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 7}">
            <i class="fa-solid fa-palette fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 8}">
            <i class="fa-solid fa-user-ninja fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 9}">
            <i class="fa-solid fa-hands fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 10}">
            <i class="fa-solid fa-handshake-simple  fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 11}">
            <i class="fa-solid fa-car fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 12}">
            <i class="fa-brands fa-youtube fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 13}">
            <i class="fa-solid fa-baseball-bat-ball fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 14}">
            <i class="fa-solid fa-gamepad fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 15}">
            <i class="fa-solid fa-utensils fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 16}">
            <i class="fa-solid fa-dog fa-3x"></i>
          </c:when>
          <c:when test="${moimData.categoryId eq 17}">
            <i class="fa-solid fa-hand-holding-heart fa-3x"></i>
          </c:when>
          <c:otherwise>
            <i class="fa-solid fa-paper-plane fa-3x"></i>
          </c:otherwise>
        </c:choose>
      </a>
    </div>
    <!--정모이름,편집버튼-->
    <div class="flex-box margin-left-160">
      <div class="margin-10 margin-top-20 font-s-30"> ${moimData.moimTitle}</div>

      <c:if test="${res.jobId eq 1}"> <!-- 모임장만 편집버튼보이게하기 -->
        <div class="margin-10 margin-top-50">
          <button type="button" class="btn btn-primary"
                  onclick="location.href='/somoim/moim/modify?id=${moimData.moimId}&test=2'">편집
          </button>
        </div>
      </c:if>

      <c:if test="${empty res}">
        <div class="margin-10 margin-top-50">
            <button type="button" class="btn btn-primary" onclick="joinCheck(${moimData.moimId})" >가입</button>
        </div>
      </c:if>
          <c:choose>
          <c:when test="${bookmarkcheck eq 1 }">
          <div class="margin-10 margin-top-50 ">
            <button type="button" class="btn btn-primary" onclick="bookmarkDelete(${moimData.moimId},'${sessionScope.loginData.memberId}')">찜 해제</button>
          </div>
          </c:when>
          <c:otherwise>
          <div class="margin-10 margin-top-50 ">
            <button type="button" class="btn btn-primary" onclick="bookmarkAdd(${moimData.moimId},'${sessionScope.loginData.memberId}')" >찜</button>
      </div>
          </c:otherwise>
          </c:choose>
      <c:if test="${res.jobId eq 1}"> <!-- 모임장만 삭제버튼보이게하기 -->
        <div class="margin-10 margin-top-50">
          <button type="button" class="btn btn-primary"
                  data-bs-toggle="modal" data-bs-target="#removeModal">삭제
          </button>
        </div>
      </c:if>
      <div class="margin-top-78 margin-left-223">
        <div>현재 가입 인원수: ${currentMemberCount}명 / 정원수: ${moimData.moimLimit}명</div>
        <c:if test="${not empty over}">
          <div>현재 정원이 마감된 모임입니다.</div>
        </c:if>
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
            <a class="nav-link" onclick="location.href='/somoim/moim/board?id=${moimData.moimId}'">게시판</a>
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
              <div class="card border-light" onclick="location.href='/somoim/moim/boardDetail?id=${moimData.moimId}&boardId=${comment.boardId}'">
              <div class="card-header">
                <div class="d-flex justify-content-between">
                  <div>
                    <span><small>${comment.memberName}</small></span>
                    <span class="margin-10"><small>${comment.jobName}</small></span>
                  </div>
                  <span><small>${comment.boardCreateDate}</small></span>
                </div>
              </div>
              <div class="card-body-position">
                <input type="hidden" value="${comment.boardId}"/>
                <p class="card-text word-hidden">${comment.content }</p>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>


      <!--작성버튼-->
      <c:if test="${not empty res}">
        <div class="text-end margin-right-40">
          <button class="btn btn-sm btn-primary" type="button"
                  onclick="location.href='/somoim/moim/board/add?id=${moimData.moimId}'">작성
          </button>
        </div>
      </c:if>
      <!-- 페이지 -->
      <nav aria-label="Page navigation example ">
        <ul class="pagination justify-content-center">
          <c:url var="boardUrl" value="/moim/board">
            <c:param name="id" value="${moimData.moimId}"></c:param> <!-- /board/detail?id="게시물아이디" 가 출력됨 -->
          </c:url>
          <c:if test="${paging.hasPrevPage()}">
            <li class="page-item">
              <a class="page-link" href="${boardUrl}&page=${paging.prevPageNumber}">prev</a>
            </li>
          </c:if>

          <c:forEach items="${paging.getPageNumberList(paging.currentPageNumber - 2 , paging.currentPageNumber + 2)}"
                     var="num">
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
            <div id="${moimParticipants.memberId}" style="display: none"></div>
          </div>
        </c:forEach>
        <c:if test="${res.jobId eq 1}"> <!-- 모임장만 편집버튼보이게하기 -->
          <div class="margin-10">
            <button type="button" class="btn btn-primary" onclick="popModJob(${moimData.moimId});">편집</button>
          </div>
        </c:if>
      </div>
    </div>
  </section>
</main>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
></script>
<script src="${path}/resources/js/moim.js"></script>
<script src="${path}/resources/js/components/popup.js"></script>
</body>
</html>