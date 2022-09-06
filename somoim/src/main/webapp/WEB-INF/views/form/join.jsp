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
	  								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
   								 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
	<title>회원가입</title>
</head>
<body>
	<header>
		<div class="form-title">
				소모임
		</div>
	</header>
	<section class="form-section">
		<div class="form-container" >
		<c:url  var="joinAddUrl" value="/addJoin"></c:url>
			<form class="join-form " method="post" action="${joinAddUrl}">
				<label class="join-form__label ">아이디</label>
				<input class="join-form__input info__id" type="text" name="memberId" id="uId">
				<div class="error-msg"></div>
				<label class="join-form__label">비밀번호</label>
				<input class="join-form__input pw" type="password" name="password" id="pw1">
		
				<label class="join-form__label">비밀번호 재확인</label>
				<input class="join-form__input pwpw" type="password" name="password2" id="pw2">
				
				<label class="join-form__label">이름</label>
				<input class="join-form__input" type="text" name="memberName" id ="memberName">
	
				<label class="join-form__label">생년월일</label>
				<div class="" id="info__birth">
					<div class="join-form-flex">
					 <select class="join-form-inline__input" id="birth-year" name="year">
				     	 <option disabled selected>출생 연도</option>
			    	</select>
				    <select class="join-form-inline__input" id="birth-month" name="month">
				      <option disabled selected>월</option>
				    	</select>
				    <select class="join-form-inline__input" id="birth-day" name="day">
				    	  <option disabled selected>일</option>
			   	 </select>
			   	 </div>
				  <div class="error-msg"></div>
				 </div>
				<div class="join-form-inline">
					<div class="join-form-inline__div">
						<label class="join-form__label">성별</label>
						<select class="join-form__input" name="gender" id="gender">
							<option disabled selected >성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
					<div class="join-form-inline__div">
						<label class="join-form__label">지역</label>
						<select class="join-form__input" name="LocationId">
							<option disabled selected>지역</option>
								<c:forEach items="${locDatas}" var="locDto">
									<option value="${locDto.locationId}">${locDto.locationName}</option>
								</c:forEach>
						</select>
					</div>
				</div>
				<label class="join-form__label">휴대전화</label>
				<input class="join-form__input info__phone" type="text" name="phone" placeholder="핸드폰 번호">
			    <div class="error-phone-msg"></div>
			
			<label class="join-form__label" for="checkbox"> 관심분야 </label>
			<div> 
				<c:forEach items="${categorysDatas}" var="categoryDto" >
					<div class="join-form_category_option">
						<input value="${categoryDto.categoryId}" id="${categoryDto.categoryId}"type="checkbox" name="category" onclick="count_check(this);">
						<label for="${categoryDto.categoryId}">${categoryDto.categoryName} </label>
					</div>
				</c:forEach>
			</div>
				<button class="join-form__btn btn-green" type="button"  onclick="formCheck(this.form);" value="회원가입"  >회원가입</button>
				<button class="join-form__btn btn-light-gray" type="button" onclick="popClose();" >취소</button>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript">
	// 팝업창 닫기 
	function popClose() {
		window.close();
	};
	
	// 유효성 검사 : 생년월일 년
	const birthYearEl = document.querySelector('#birth-year')
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isYearOptionExisted) {
	    isYearOptionExisted = true
	    for(var i = 1940; i <= 2022; i++) {
	      // option element 생성
	      const YearOption = document.createElement('option')
	      YearOption.setAttribute('value', i)
	      YearOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(YearOption);
	    }
	  }
	});
	
	// 유효성 검사 : 생년월일 월
	const birthMonthEl = document.querySelector('#birth-month')
	// option 목록 생성 여부 확인
	isMonthOptionExisted = false;
	birthMonthEl.addEventListener('focus', function () {
	  // month 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isMonthOptionExisted) {
	    isMonthOptionExisted = true
	    for(var i = 1; i <= 12; i++) {
	      // option element 생성
	      const MonthOption = document.createElement('option')
	     MonthOption.setAttribute('value', i)
	      MonthOption.innerText = i
	      // birthmonthEl의 자식 요소로 추가
	      this.appendChild(MonthOption);
	    }
	  }
	});
	
	// 유효성 검사 : 생년월일 일
	const birthDayEl = document.querySelector('#birth-day')
	// option 목록 생성 여부 확인
	isDayOptionExisted = false;
	birthDayEl.addEventListener('focus', function () {
	  // Day 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isDayOptionExisted) {
	    isDayOptionExisted = true
	    for(var i = 1; i <= 31; i++) {
	      const DayOption = document.createElement('option')
	      DayOption.setAttribute('value', i)
	      DayOption.innerText = i
	      this.appendChild(DayOption);
	    }
	  }
	});
	
	//유효 날짜 여부 확인 
	// [year, month, day]
	const birthArr = [-1, -1, -1]
	const birthErrorMsgEl = 
	  document.querySelector('#info__birth .error-msg')

	birthYearEl.addEventListener('change', () => {
	  birthArr[0] = birthYearEl.value
	  // 유효 날짜 여부 확인
	  checkBirthValid(birthArr)
	});

	birthMonthEl.addEventListener('change', () => {
	  birthArr[1] = birthMonthEl.value
	  checkBirthValid(birthArr)
	});

	birthDayEl.addEventListener('change', () => {
	  birthArr[2] = birthDayEl.value
	  checkBirthValid(birthArr)
	});

	/* 유효한 날짜인지 여부 확인 (윤년/평년) */
	function checkBirthValid(birthArr) {
	var account = 
		
	isBirthValid = true
  
	  y = birthArr[0]
	  m = birthArr[1]
	  d = birthArr[2]
	  // 생년월일 모두 선택 완료 시
	  if(y > 0 && m > 0 && d > 0) {
	    if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) { 
	      isBirthValid = false
	    }
	    else if (m == 2) {
	      if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
	        if(d > 29) { // 윤년은 29일까지
	          isBirthValid = false
	        }
	      } else { // 평년
	        if(d > 28) { // 평년은 28일까지
	          isBirthValid = false
	        }
	      }
	    }
	
	    if(isBirthValid) { // 유효한 날짜
	        birthErrorMsgEl.textContent = ""
	        account.birth = birthArr.join('')
	      } else { // 유효하지 않은 날짜
	    	  birthErrorMsgEl.textContent = errMsg.birth     
	    	  account.birth = null
	      }
	    }
	  };
	  /*** SECTION - ID ***/
	  const idInputEl = document.querySelector('div form .info__id');
	  const idErrorMsgEl = document.querySelector('div form  .error-msg')
	  idInputEl.addEventListener('focusout', () => {
	    const idRegExp = /^[a-zA-Z0-9]{6,20}$/ // 6~20자의 영문 소문자와 숫자
	    if(idInputEl.value === undefined || idInputEl.value.trim() === ""){
	    	 idErrorMsgEl.textContent = errMsg.id.empty
	    }else{
		    if(idRegExp.test(idInputEl.value)) { // 유효성 검사 성공
		      idErrorMsgEl.textContent = "";
		    } else { // 유효성 검사 실패
		      idErrorMsgEl.textContent = errMsg.id.invalid
		    }
		  }
	    });
	  /*** SECTION - PW ***/
	  const pwInputEl = document.querySelector('div form .info__id');
	  const pwErrorMsgEl = document.querySelector('div form  .error-msg')
	  pwInputEl.addEventListener('focusout', () => {
	    const pwRegExp = /^[a-zA-Z0-9]{6,20}$/ // 6~20자의 영문 소문자와 숫자
	    if(pwInputEl.value === undefined || pwInputEl.value.trim() === ""){
	    	pwErrorMsgEl.textContent = errMsg.id.empty
	    }else{
		    if(pwRegExp.test(pwInputEl.value)) { // 유효성 검사 성공
		    	pwErrorMsgEl.textContent = "";
		    } else { // 유효성 검사 실패
		    	pwErrorMsgEl.textContent = errMsg.id.invalid
		    }
		  }
	    });
	  
	  /*** modile ***/
	  const phoneInputEl = document.querySelector('div form .info__phone')
	  const phoneErrorMsgEl = document.querySelector('div form .error-phone-msg')
	  phoneInputEl.addEventListener('change', () => {
	    const phoneRegExp = /^010([0-9]{8})$/ // 010-XXXX-XXXX 유효성
	    if(phoneRegExp.test(phoneInputEl.value)) { // 유효성 검사 성공
	    	phoneErrorMsgEl.textContent = ""
	    } else { // 유효성 검사 실패
	    	phoneErrorMsgEl.textContent = errMsg.mobile
	    }
	  });
	  
	  const errMsg = {
			  id: { 
			    invalid: "6~20자의 영문 소문자와 숫자만 사용 가능합니다",
			    empty: "아이디를 입력해주세요",
			    success: "사용 가능한 아이디입니다",
			    fail: "사용할 수 없는 아이디입니다"
			  },
			  pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요",
			  pwRe: {
			    success: "비밀번호가 일치합니다",
			    fail: "비밀번호가 일치하지 않습니다"
			  },
			  birth: "생년월일을 다시 확인해주세요",
			  mobile: "‘-’ 제외 11자리를 입력해주세요" 
			}

	  function count_check(element) {
		var chkBox = document.getElementsByName('category');
		//카테고리 name 값을 부르고
		var chkCnt = 0;  
		// 체크박스 초기값은 0 으로 설정
		
	    for(var i = 0; i < chkBox.length; i++){
	    	if(chkBox[i].checked){
	    		chkCnt++;
	    	}
	    }
		if (chkCnt > 3) {
			alert("관심사는 3개까지만 선택하실수 있습니다.");
			element.checked = false;
			return false;
		}
	 }
	function formCheck(form) {
	  let uid = document.getElementById('uId');
	  let pw1 = document.getElementById('pw1');
	  let pw2 = document.getElementById('pw2');
	  let memberName = document.getElementById('memberName');
	  let gender = document.getElementById('gender');
	  let location = document.getElementById('location');
	  let phone = document.getElementById('phone');
	  letcategory = document.getElementById('category');
	  	
	  if(pw1.value === undefined || pw1.value.trim() === ""){
		  alert("비밀번호를 입력해주세요.");
		  pw1.focus();
		  return false;
	  }
	  
	  if(pw2.value === undefined || pw2.value.trim() === ""){
		  alert("비밀번호를 입력해주세요.");
		  pw2.focus();
		  return false;
	  }
	  
	  if(pw1.value !== pw2.value){
		  alert("비밀번호가 일치하지 않습니다.");
		  return false;	
		}
	  
	  if(memberName.value === undefined || memberName.value.trim() === ""){
		  alert("이름을 입력해주세요.");
		  memberName.focus();
		  return false;
	  }
	  
	  if(gender.value != 'M' && gender.value != 'F' ){
		  alert("성별을 선택해주세요");
		  gender.focus();
		  return false;
	  }
	  
	  form.submit();
	  move();
	  
	  function move() {
	  setTimeout(() => {
		  window.opener.location.href="/somoim/login"
			    window.close();
	}, 1);
	}
		  
	  }
	  
	
	  
	  
</script>
</html>
