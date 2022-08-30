<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>모임 상세페이지</title>
	<c:url var="css" value="/resources/css"/>
	<c:url var="bs5" value="/resources/bs5"/>
	<link rel="stylesheet" type="text/css" href="${css}/meetingboard.css">
	<link rel="stylesheet" type="text/css" href="${bs5}/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
<!--  	
    <c:url var="jQuery" value="/resources/js"/>
	
    <link rel="stylesheet" type="text/css" href="${css}/meetingboard.css">
	<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${jQuery}/jquery-3.6.0.min.js"></script>  -->  

</head>

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
        <div class="margin_10 category_box_120 bc_gr flex_box">
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
        <!-- 2 -->
        <!-- 2-1 -->
        <div class="mb-3 container_1">
          <div class="mb-1">
            <div class="card border-light">
              <div class="card-header">
                <div class="d-flex justify-content-between">
                  <div>
                    <span><small>최주영</small></span>
                    <span class="margin_10"><small>직책</small></span>
                  </div>
                  <span><small>2017.01.01</small></span>
                </div>
              </div>
              <div class="card-body">
                <input type="hidden" value="${comment.id}" />
                <p class="card-text">게시글1</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 2-2 -->
        <div class="mb-3 container_1">
          <div class="mb-1">
            <div class="card border-light">
              <div class="card-header">
                <div class="d-flex justify-content-between">
                  <div>
                    <span><small>최주영</small></span>
                    <span class="margin_10"><small>직책</small></span>
                  </div>
                  <span><small>2017.01.01</small></span>
                </div>
              </div>
              <div class="card-body">
                <input type="hidden" value="${comment.id}" />
                <p class="card-text">게시글2</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 2-3 -->
        <div class="mb-3 container_1">
          <div class="mb-1">
            <div class="card border-light">
              <div class="card-header">
                <div class="d-flex justify-content-between">
                  <div>
                    <span><small>최주영</small></span>
                    <span class="margin_10"><small>직책</small></span>
                  </div>
                  <span><small>2017.01.01</small></span>
                </div>
              </div>
              <div class="card-body">
                <input type="hidden" value="${comment.id}" />
                <p class="card-text">게시글3</p>
              </div>
            </div>
          </div>
        </div>

        <div class="text-end margin_right_40">
          <button class="btn btn-sm btn-primary" type="button">작성</button>
        </div>
        <nav aria-label="Page navigation example ">
          <!-- 페이지 -->
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
  </body>
</html>