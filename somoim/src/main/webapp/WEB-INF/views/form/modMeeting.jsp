<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/styles.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
     <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<title>정모 수정</title>
</head>
<body>
	<header>
		<div class="form-title">
				정모 수정
		</div>
	</header>
	<section class="form-section">
		<div class="form-container" >
		<c:url  var="meetingModUrl" value="/moim/modMeeting"></c:url>
			<form class="join-form " method="post" action="${meetingModUrl}">
				<input id="meetingId" name="meetingId" style="display: none" value="${param.meetingId}">
				<div>
					<span class="material-icons"
									style="font-size:14px; color: gray;">favorite</span>
					<input class="join-form__input info__title" type="text" id="meetingTitle" name="meetingTitle" value="${meetingData.meetingTitle}">
				</div>
				<div>
					<div class="" id="info__date">
						<div class="join-form-flex">
							<span class="material-icons"
										style="font-size:14px; color: gray;">date_range</span>
							<select class="join-form-inline__input" id="meetingMonth" name="month">
								<option id="${meetingData.month}" disabled>월</option>
							</select>
							<select class="join-form-inline__input" id="meetingDay" name="day">
									<option id="${meetingData.day}" disabled>일</option>
						  </select>
							<input class="join-form-inline__input" type="text" id="meetingTime" name="meetingTime" value="${meetingData.meetingTime}"/>
						 </div>
					 </div>
				</div>
				<div>
					<span class="material-icons"
								style="font-size:14px; color: gray;">room</span>
					<input class="join-form__input" type="text" id="meetingPlace" name="meetingPlace" value="${meetingData.meetingPlace}">
				</div>
				<div>
					<span class="material-icons"
								style="font-size:14px; color: gray;">money</span>
					<input class="join-form__input" type="text" id="meetingPrice" name="meetingPrice" value="${meetingData.meetingPrice}">
				</div>
				<div>
					<span class="material-icons"
								 style="font-size:14px; color: gray;">groups</span>
					<input class="join-form__input" type="text" id="meetingLimit" name="meetingLimit" value="${meetingData.meetingLimit}">
				</div>
				<button class="join-form__btn btn-green" type="button"  onclick="formCheck(this.form, ${param.moimId});">정모 수정</button>
				<button class="join-form__btn btn-light-gray" type="button" onclick="popClose();" >취소</button>
			</form>
		</div>
	</section>
</body>
<script src="${path}/resources/js/meeting.js"></script>
<script src="${path}/resources/js/components/popup.js"></script>
</html>