<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>${moimData.moimTitle}입니다.</title>
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${cs}/styles.css" />
  </head>

   <script type="text/javascript">
   window.onload = function() {
	   previewImage.addEventListener("click", function(e) {
		   moimImageSelect.click();
	    });

	   moimImageSelect.addEventListener("change" , function(e) {
			var file = e.target.files[0];
			var imgUrl = URL.createObjectURL(file);
			previewImage.src = imgUrl;
	  });
   }

</script>

  <body>
    <c:url var="meetingUrl" value="/moim/meeting/">
		<c:param name="id" value="${moimData.moimId}"></c:param>
	</c:url>
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
          <div class="margin-10 margin-top-20 font-s-30">${moimData.moimTitle}</div>
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
              <li class="nav-item" onclick="location.href='/somoim/moim/board?id=${moimData.moimId}'">
                <a class="nav-link">게시판</a>
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
        <div class="col-md-3 bc-wh shadow-sm">
          <!-- 모임정보박스 -->
          <div class="margin-10 p-15">
            <div class="center p-6 bc-wg">모임정보</div>
          </div>
           <!-- 모임장정보 -->
          <c:if test="${not empty moimParticipants}">
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
          </c:if>
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
        <!--정모게시판 박스-->
        <div class="col-md-6 bc-wh shadow-sm p-15">
          <div class="center margin-10 p-6 bc-wg">정모</div>

          <!--정모모임 반복출력-->
          <c:if test="${not empty meetingsData}">
          <c:forEach items="${meetingsData}" var="meetingsData" varStatus="status">
          <div class="p-15">
            <div class="flex-box space-between">
              <div class="bc-wh shadow-sm date-bs p-6 psi-r">
                <div class="psi-a top-20 left-24 font_s_10">${meetingsData.dayOfW}</div>
                <div class="psi-a top-40 left-28 font-s-30">${meetingsData.day}</div>
              </div>
              <div class="info-box-mb">

                <div><span class="material-icons" style="font-size:14px; color: gray;">favorite</span>&nbsp;&nbsp;${meetingsData.meetingTitle}</div>
                <div><span class="material-icons" style="font-size:14px; color: gray;">date_range</span>&nbsp;&nbsp;${meetingsData.month}.${meetingsData.day} ${meetingsData.hour}:${meetingsData.minute}</div>
                <div><span class="material-icons" style="font-size:14px; color: gray;">room</span>&nbsp;&nbsp;${meetingsData.meetingPlace}</div>
                <div><span class="material-icons" style="font-size:14px; color: gray;">money</span>&nbsp;&nbsp;${meetingsData.meetingPrice}</div>
                <div><span class="material-icons" style="font-size:14px; color: gray;">groups</span>&nbsp;&nbsp;${meetingsData.meetingLimit}</div>
              </div>
              <!--정모모임1 가입멤버 아코디언박스-->
              <div class="moim-colecter">
                <div class="accordion-item width">
										<h2 class="accordion-header" id="heading${status.count}">
											<button class="accordion-button" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapse${status.count}"
												aria-expanded="true" aria-controls="collapse${status.count}">
												가입 멤버</button>
                  </h2>
										<div id="collapse${status.count}" class="accordion-collapse collapse"
											 aria-labelledby="heading${status.count}">
                    <!--스크롤박스-->
											<div class="p-4 rounded-3 shadow-sm bg-white scroll"
												 style="height: 200px; overflow-y: scroll">
												<c:if test="${not empty meetingParticipants}">
													<c:forEach items="${meetingParticipants}" var="meetingParticipants">
														<c:if test="${meetingParticipants.meetingId eq meetingsData.meetingId}">
                      <div class="accordion-body">
                        <div class="flex-box margin-bottom-20">
																	<img src="${img}/profile-image.png" class="rounded-circle"
																		alt="profile-image" width="40" />
																	<div class="center margin-left-10">${meetingParticipants.memberName}</div>
																</div>
															</div>
														</c:if>
													</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="container-1" />
					</c:forEach>
				</c:if>
          <!--개설버튼-->
          <div class="p-15">
            <div class="flex-box space-between">
              <div class="bc-wh shadow-sm date-bs psi-r">
                <i class="bi bi-plus-lg font-s-50 psi-a left-24 top-20"></i>
              </div>
            </div>
          </div>
          <hr class="container-1" />
        </div>

        <!--모임멤버박스-->
        <div class="col-md-3 bc-wh shadow-sm p-15">
          <div class="center margin-10 p-6 bc-wg">모임멤버</div>
          <!--스크롤박스-->
          <div
            class="p-4 rounded-3 shadow-sm bg-white scroll"
            style="height: 770px; overflow-y: scroll"
          >
            <c:if test="${not empty moimParticipants}">
          <c:forEach items="${moimParticipants}" var="moimParticipants">
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>${moimParticipants.jobName}</div>
              <div>${moimParticipants.memberName}</div>
            </div>
            </c:forEach>
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
 <script type="text/javascript">
 function meetingsParticipants(meetingId){
 	$.ajax({
 		url: "${meetingUrl}/p",
 		type: "post",
 		data: {
 			id:meetingId
 		},
 		dataType: "json",
 		success: function(data){
 			if(data.code === "meetingParticipants"){
 				alert(data.msg);

 			}
 		}
 	})
 }

 </script>
  </body>
</html>