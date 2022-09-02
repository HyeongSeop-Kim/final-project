<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>모임 페이지</title>
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
        <div class="col-md-3 bc-wh shadow-sm">
          <!-- 모임정보박스 -->
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
        <!--모임게시판 박스-->
        <div class="col-md-6 bc-wh shadow-sm p-15">
          <div class="center margin-10 p-6 bc-wg">모임게시판</div>

          <!--정모모임1-->
          <div class="p-15">
            <div class="flex-box space-between">
              <div class="bc-wh shadow-sm date-bs p-6 psi-r">
                <div class="psi-a top-20 left-24 font_s_10">토요일</div>
                <div class="psi-a top-40 left-28 font-s-30">26</div>
              </div>
              <div class="info-box-mb">
                <div>08.26 15시</div>
                <div>홍대 8번출구</div>
                <div>비용</div>
                <div>정원수</div>
              </div>
              <!--정모모임1 가입멤버 아코디언박스-->
              <div class="moim-colecter">
                <div class="accordion-item width">
                  <h2 class="accordion-header" id="heading1">
                    <button
                      class="accordion-button"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapse1"
                      aria-expanded="true"
                      aria-controls="collapse1"
                    >
                      가입 멤버
                    </button>
                  </h2>
                  <div
                    id="collapse1"
                    class="accordion-collapse collapse"
                    aria-labelledby="heading1"
                  >
                    <!--스크롤박스-->
                    <div
                      class="p-4 rounded-3 shadow-sm bg-white scroll"
                      style="height: 200px; overflow-y: scroll"
                    >
                      <div class="accordion-body">
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr class="container-1" />
          <!--정모모임2-->
          <div class="p-15">
            <div class="flex-box space-between">
              <div class="bc-wh shadow-sm date-bs p-6 psi-r">
                <div class="psi-a top-20 left-24 font_s_10">토요일</div>
                <div class="psi-a top-40 left-28 font-s-30">26</div>
              </div>
              <div class="info-box-mb">
                <div>08.26 15시</div>
                <div>홍대 8번출구</div>
                <div>비용</div>
                <div>정원수</div>
              </div>
              <!--정모모임2 가입멤버 아코디언박스-->
              <div class="moim-colecter">
                <div class="accordion-item width">
                  <h2 class="accordion-header" id="heading2">
                    <button
                      class="accordion-button"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapse2"
                      aria-expanded="true"
                      aria-controls="collapse2"
                    >
                      가입 멤버
                    </button>
                  </h2>
                  <div
                    id="collapse2"
                    class="accordion-collapse collapse"
                    aria-labelledby="heading2"
                  >
                    <!--스크롤박스-->
                    <div
                      class="p-4 rounded-3 shadow-sm bg-white scroll"
                      style="height: 200px; overflow-y: scroll"
                    >
                      <div class="accordion-body">
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                        <div class="flex-box margin-bottom-20">
                          <img
                            src="${img}/profile-image.png"
                            class="rounded-circle"
                            alt="profile-image"
                            width="40"
                          />
                          <div class="center margin-left-10">최주영</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <hr class="container-1" />
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