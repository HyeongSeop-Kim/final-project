<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>모임 페이지</title>
	<c:url var="css" value="/resources/css"/>
	<link rel="stylesheet" type="text/css" href="${css}/styles.css">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">	
	<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
<!--  	
    <c:url var="jQuery" value="/resources/js"/>
	
    <link rel="stylesheet" type="text/css" href="${css}/meetingboard.css">
	<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${jQuery}/jquery-3.6.0.min.js"></script>  -->  

</head>

<body>
  <body>
    <header class="container">
      <div class="image_box flex_box">
        <div class="m_auto">
          <i class="bi bi-plus-lg margin_right_10 cursor c_gr font_s_50"></i>
          <span class="c_gr font_s_50">이미지</span>
        </div>
      </div>
    </header>

    <div class="container">
      <div class="meeting_more_box flex_box">
        <div class="margin_10 category_box_120 flex_box bc_gr">
          <i
            class="bi bi-music-note-beamed m_auto"
            style="font-size: 50px; color: white"
          ></i>
        </div>
        <div class="margin_10 mb-1 bc_grey flex_box">
          <div class="margin_10 flex_box font_s_50">TEST ___모임</div>
          <div class="margin_10 margin_top_70">
            <button type="button" class="btn btn-primary">편집</button>
          </div>
        </div>
        <div class="margin_10 margin-top_81">
          <button type="button" class="btn btn-primary">가입</button>
        </div>
        <div class="margin_10 margin-top_81">
          <button type="button" class="btn btn-primary">찜</button>
        </div>
      </div>
    </div>

    <div class="container">
      <nav
        class="navbar navbar-expand-lg navbar-light"
        style="background-color: #e3f2fd"
      >
        <div class="container-fluid">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link font_s_20 margin_right_30">모임</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font_s_20 margin_right_30">게시판</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font_s_20 margin_right_30">사진첩</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font_s_20 margin_right_30">채팅</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <section class="container flex_box">
      <div class="border_1 margin_10 box_width_30">
        <!-- 정보박스 -->
        <div class="margin_10 border_1 bc_sb">
          <!-- 모임정보 -->
          <div class="center">모임정보</div>
        </div>

        <div class="margin_10 border_1">
          <!-- 모임상세설명 -->
          <div class="space-between margin_10">
            <div class="category_box_60 bc_gr flex_box"></div>
            <div>직책</div>
            <div>최주영</div>
          </div>
        </div>
        <div class="margin_10 border_1">
          <div class="center">
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
          </div>
        </div>
      </div>

      <div class="border_1 margin_10 box_width_50">
        <div class="center border_1 margin_10 bc_sb">모임게시판</div>
        <!--모임게시판1(아래서부터)-->
        <div
          class="container flex_box margin_bottom_10 margin_top_10 moim-colecter"
        >
          <div class="col-md-3 m_auto date_bs border_sh c_gr">
            <span class="center font_nanum">2022.8.26</span>
          </div>
          <div class="col-md-3 margin_left_10">
            <div class="font_Nanum_B">08.26 15시</div>
            <div class="font_Nanum_B">홍대 8번출구</div>
            <div class="font_Nanum_B">비용</div>
            <div class="font_Nanum_B">정원수</div>
          </div>
          <div class="col-md-5 accordion-item width">
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
              <div class="accordion-body">
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="container_1" />
        <!--모임게시판1(여기까지)-->

        <!--모임게시판2(아래서부터)-->
        <div
          class="container flex_box margin_bottom_10 margin_top_10 moim-colecter"
        >
          <div class="col-md-3 m_auto date_bs border_sh c_gr">
            <span class="center font_nanum"> 2022.08.26</span>
          </div>
          <div class="col-md-3 margin_left_10">
            <div class="font_Nanum_B">08.26 15시</div>
            <div class="font_Nanum_B">홍대 8번출구</div>
            <div class="font_Nanum_B">비용</div>
            <div class="font_Nanum_B">정원수</div>
          </div>
          <div class="col-md-5 accordion-item width">
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
              <div class="accordion-body">
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
                <div class="flex_box margin_right_30 margin_bottom_20">
                  <div class="category_box_40 bc_gr flex_box"></div>
                  <div class="center margin_left_10">최주영</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="container_1" />
        <!--모임게시판2(여기까지)-->

        <div
          class="container flex_box margin_bottom_10 margin_top_10 moim-colecter"
        >
          <div class="col-md-3 m_auto date_bs border_sh c_gr">
            <i
              class="center font_nanumbi bi-plus-lg margin_right_10 cursor c_gr font_s_50"
            ></i>
          </div>
          <div class="col-md-3 margin_left_10"></div>
          <div class="col-md-5 width"></div>
        </div>
      </div>

      <div class="border_1 margin_10 box_width_20">
        <div class="center border_1 margin_10 bc_sb">모임멤버</div>
        <div class="space-between margin_10">
          <div class="category_box_60 bc_gr flex_box"></div>
          <div>직책</div>
          <div>최주영</div>
        </div>
        <div class="space-between margin_10">
          <div class="category_box_60 bc_gr flex_box"></div>
          <div>직책</div>
          <div>최주영</div>
        </div>
        <div class="space-between margin_10">
          <div class="category_box_60 bc_gr flex_box"></div>
          <div>직책</div>
          <div>최주영</div>
        </div>
      </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  	</script>
  </body>
</html>