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
      <div class="img-box" onclick="coverImageSelect();">
        <img
          class="img-box-size-1 bora-20 shadow-sm bc-wh"
          src="${meetingimg}/meetingimg1.jpg"
        />
        <input
          class="ImgSelect"
          type="file"
          name="uploadImg"
          value="이미지 선택"
        />
      </div>
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
          <div class="margin-10 margin-top-20 font-s-30">TEST ___모임</div>
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
                <a class="nav-link">모임</a>
              </li>
              <li class="nav-item">
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
        <!-- 모임정보박스 -->
        <div class="col-md-3 bc-wh shadow-sm">
          <div class="margin-10 p-15">
            <div class="center p-6 bc-wg">모임정보</div>
          </div>
          <div class="margin-10">
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="100"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
          </div>
          <div
            class="p-4 rounded-3 shadow-sm bg-white scroll"
            style="height: 640px; overflow-y: scroll"
          >
            <div class="margin-10">
              <div class="center p-6">
                모임상세정보칸 입니다. 자유롭게 작성해주세요
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
                ------------------------------------------
              </div>
            </div>
          </div>
        </div>
        <!--모임게시글 박스-->
        <div class="col-md-6 bc-wh shadow-sm p-15 p-3">
          <div class="center margin-10 p-6 bc-wg">모임게시글</div>
          <!--첫번째 게시글 박스-->
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>최주영</small></span>
                      <span class="margin-10"><small>직책</small></span>
                    </div>
                    <span><small>2017.01.01</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.id}" />
                  <p class="card-text word-hidden">
                    한반도 중앙부 동쪽의 태백산맥을 중심으로 영동과 영서로 크게
                    구분되어 있다. 위도상으로는 북위 37° 02′에서 38° 37′에
                    걸치고 경도상으로는 동경 127° 05′에서 129° 22′에 걸쳐 있으며
                    북위 38도선은 강원도의 거의 중앙부를 통과한다. 동서의 길이는
                    약 150㎞, 남북은 약 243㎞에 달하며, 동쪽은 약 212㎞에 걸쳐
                    해안선을 이루면서 서쪽은 황해도 신계·김천군, 경기도
                    연천·포천·가평·양평·여주 등 여러 군과 경계를 이루고 남쪽은
                    충청북도 충주·제천시, 단양군 및 경상북도의 영주시,
                    봉화·울진군과 북쪽은 함경남도 안변군·문천군 및 황해도의
                    곡산군과 접하여 5도 3시 13군과 경계를 이루고 있다.
                  </p>
                </div>
              </div>
            </div>
          </div>
          <!--두번째 게시글 박스-->
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>최주영</small></span>
                      <span class="margin-10"><small>직책</small></span>
                    </div>
                    <span><small>2017.01.01</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.id}" />
                  <p class="card-text word-hidden">
                    한반도 중앙부 동쪽의 태백산맥을 중심으로 영동과 영서로 크게
                    구분되어 있다. 위도상으로는 북위 37° 02′에서 38° 37′에
                    걸치고 경도상으로는 동경 127° 05′에서 129° 22′에 걸쳐 있으며
                    북위 38도선은 강원도의 거의 중앙부를 통과한다. 동서의 길이는
                    약 150㎞, 남북은 약 243㎞에 달하며, 동쪽은 약 212㎞에 걸쳐
                    해안선을 이루면서 서쪽은 황해도 신계·김천군, 경기도
                    연천·포천·가평·양평·여주 등 여러 군과 경계를 이루고 남쪽은
                    충청북도 충주·제천시, 단양군 및 경상북도의 영주시,
                    봉화·울진군과 북쪽은 함경남도 안변군·문천군 및 황해도의
                    곡산군과 접하여 5도 3시 13군과 경계를 이루고 있다.
                  </p>
                </div>
              </div>
            </div>
          </div>
          <!-- 세번째 게시글 박스 -->
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>최주영</small></span>
                      <span class="margin-10"><small>직책</small></span>
                    </div>
                    <span><small>2017.01.01</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.id}" />
                  <p class="card-text word-hidden">게시글3</p>
                </div>
              </div>
            </div>
          </div>
          <!-- 네번째 게시글 박스 -->
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>최주영</small></span>
                      <span class="margin-10"><small>직책</small></span>
                    </div>
                    <span><small>2017.01.01</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.id}" />
                  <p class="card-text word-hidden">게시글3</p>
                </div>
              </div>
            </div>
          </div>
          <!-- 다섯번째 게시글 박스 -->
          <div class="mb-3 container-1">
            <div class="mb-1">
              <div class="card border-light">
                <div class="card-header">
                  <div class="d-flex justify-content-between">
                    <div>
                      <span><small>최주영</small></span>
                      <span class="margin-10"><small>직책</small></span>
                    </div>
                    <span><small>2017.01.01</small></span>
                  </div>
                </div>
                <div class="card-body-position">
                  <input type="hidden" value="${comment.id}" />
                  <p class="card-text word-hidden">게시글3</p>
                </div>
              </div>
            </div>
          </div>
          <!--작성버튼-->
          <div class="text-end margin-right-40">
            <button class="btn btn-sm btn-primary" type="button">작성</button>
          </div>
          <!-- 페이지 -->
          <nav aria-label="Page navigation example ">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
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
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
            <div class="space-between margin-10">
              <img
                src="${img}/profile-image.png"
                class="rounded-circle"
                alt="profile-image"
                width="70"
              />
              <div>직책</div>
              <div>최주영</div>
            </div>
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