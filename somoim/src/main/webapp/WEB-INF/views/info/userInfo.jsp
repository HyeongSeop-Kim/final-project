<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${userInfo.memberName}님의 페이지</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/styles.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
		  integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
		  crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="myPage" >
	<div class="coverImg">
		<img id="infoImg" class="title-img" src="${userInfo.infoImagePath}" accept="image/*">
		<input id="infoImg-input" class="imgSelect" type="file" name="uploadImg" value="이미지 선택">
	</div>
	<!--프로필 사진 -->
	<div class="simple-info-box">
		<div class="profile-user-img">
			<img id="profileImg" class="profile"  src="${userInfo.memberImagePath}" accept="image/*">
			<input id="profileImg-input" class="imgSelect" type="file" name="uploadImg" value="이미지 선택">
		</div>
		<!-- 이름, 생년월일, 거주지역 -->

		<div class="simple-info">
			<input class="name" type="text" value="${userInfo.memberName}" disabled>
			<span class="material-icons"  style="font-size:20px; color: gray;">date_range</span><input class="birth" type="text" value="${userInfo.birth}"  disabled>
			<span class="material-icons" style="font-size:20px; color: gray;">room</span><input class="location" type="text" value="${userInfo.locationName}" disabled>
		</div>
		<!-- 카테고리 -->
		<div id="cate" class="category-box">
			<c:if test="${not empty userInfo}">
				<script>
					window.onload = () => {
						addEventListener("DOMContentLoaded", printCate("${userInfo.category}"));
					};
				</script>
			</c:if>
		</div>
	</div>
</section>
<br>

<div class="main-container">
	<main class="main">
		<section>
			<!-- 가입한 모임 카드 -->
			<div class="row text-center">
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="card-header py-3">
							<h2 class="my-0 fw-normal">가입한 모임</h2>
						</div>
						<div class="card-body scroll" style="overflow-y: scroll">
							<ul class="list-unstyled mt-3 mb-4">
								<c:if test = "${not empty moimDatas}">
									<c:forEach items="${moimDatas}" var="moimData">
										<li class="pati-list" OnClick="location.href ='/somoim/moim/meeting?id=${moimData.moimId}'">
											<div class="section-container d-flex pati-info">
												<div class="col-md-3">
													<img src="${path}/resources/img/moim/${moimData.moimId}.png" class="rounded-circle moim-img" alt="profile-image" width="100">
												</div>
												<div class="col-md-9 moim-info">
													<span class="moim-title">${moimData.moimTitle}</span>
													<span class="moim-loc">${moimData.locationName}</span>
													<span class="moim-part">현재 인원/${moimData.moimLimit}</span>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- 작성글 카드 -->
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="card-header py-3">
							<h2 class="my-0 fw-normal">작성한 글</h2>
						</div>
						<div class="card-body scroll" style="overflow-y: scroll">
							<ul class="list-unstyled mt-3 mb-4">
								<c:if test="${not empty boardDatas}">
									<c:forEach items="${boardDatas}" var="boardData">
										<li class="pati-list">
											<div class="pati-info" OnClick="location.href =''">
												<div class="info-board">
													<div class="info-board-title">
														<div>
															<c:forEach items="${moimDatas}" var="moimData">
																<c:if test="${moimData.moimId eq boardData.moimId}">
																	<img src="${path}/resources/img/moim/${moimData.moimId}.png" class="rounded-circle info-board-img" alt="profile-image" width="100">
																</c:if>
															</c:forEach>
															<span class="pb-2">${boardData.moimTitle}</span>
														</div>
														<span>${boardData.boardCreateDate}</span>
													</div>
													<div class="info-board-content">
														<span class="pb-2">${boardData.boardTitle}</span>
														<span class="word-hidden">${boardData.content}</span>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- 작성 댓글 카드 -->
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm ">
						<div class="card-header py-3" >
							<h2 class="my-0 fw-normal">작성한 댓글</h2>
						</div>
						<div class="card-body scroll" style="overflow-y: scroll">
							<ul class="list-unstyled mt-3 mb-4">
								<li class="comment-list">
									<div class="section-container d-flex align-items-center p-3 rounded-3 pati-info">
										<div class="comment-box">
											<div class="comment">
												<span>적의 침략은 저항할 수 있지만, 그 시대가 도래한 사상에는 저항할 수 없다.적의 침략은 저항할 수 있지만, 그 시대가 도래한 사상에는 저항할 수 없다.적의 침략은 저항할 수 있지만, 그 시대가 도래한 사상에는 저항할 수 없다.</span>
											</div>
											<div class="comment-info">
												<span class="comment-name">게시글 제목</span>
												<span class="comment-date"><small>2022.08.28</small></span>
											</div>
										</div>
									</div>
								</li>
								<li class="comment-list">
									<div class="section-container d-flex align-items-center p-3 rounded-3 pati-info">
										<div class="comment-box">
											<div class="comment-info">
												<span class="comment-name">홍길동</span>
												<span class="comment-date"><small>2022.08.28</small></span>
											</div>
											<div class="comment">
												<span>화이팅!!</span>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script type="text/javascript">
</script>
<script src="${path}/resources/js/category.js"></script>
</body>
</html>