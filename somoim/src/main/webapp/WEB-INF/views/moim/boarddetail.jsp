<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="img" value="/resources/img/somoim"/>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <!-- 모바일로 확인시 크기조절 -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

 <link rel="stylesheet" href="${path}/resources/css/styles.css">
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  
  <title>상세 게시판</title>
</head>

  <script type="text/javascript">

   
  function deleteBoard(boardId){
	  	$.ajax({
    		url: "/somoim/moim/board/delete",
    		type: "get",
    		data: {
    			bid:boardId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "alreadyDelete"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}else if(data.code === "success"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}else if(data.code === "error"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}
    		}
    	})
    }
  
</script>

 <script type="text/javascript">


  function commentDelete(commentId){ 
	  	$.ajax({
    		url: "/somoim/moim/board/comment/delete",
    		type: "get",
    		data: {
    			cid:commentId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "alreadyDelete"){
    				alert(data.message);
    				location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
    			}else if(data.code === "success"){
    				alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
    			}else if(data.code === "error"){
    				alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
                }
            }
        })
    }

  
  
	function changeEdit(element){
		element.innerText="확인"; //수정버튼을 확인버튼으로 변경
		element.nextElementSibling.remove(); //삭제버튼은 없애기
		
		var value = element.parentElement.previousElementSibling.innerText; //<p>태그의 text를 value에 저장
		var textarea = document.createElement("textarea"); //<textarea>엘리먼트 생성
		textarea.setAttribute("class","form-control");
		textarea.value = value; //<textarea>에 기존 <p>태그에 있던 value값 넣어주기
		
		element.parentElement.previousElementSibling.innerText=""; //<p>안에를 공백으로 하고 그안에 아래코드 삽입 (디자인이 깨지기 때문에 )
		element.parentElement.previousElementSibling.prepend (textarea); //<p>태그안에 textarea 엘리먼트 삽입 prepend:요소내부의 시작부분에 삽입
		
		element.setAttribute("onclick","commentUpdate(this);"); //클릭하면commentUpdate 기능이 동작  --> 자바스크립트로 하는 경우  --> 걍 브라우져에서 변한것만보임
	}                                                           //commentUpdate(this) 기능이 동작  --> ajax사용 --> 서버에서 처리
	
	function changeText(element){//수정이 완료되면 다시 수정,삭제 버튼이 나오게하기,  수정한댓글 그대로 출력해서 수정한것 처럼 보럼 보이게하기
		
		 element.innerText = "수정"; 
		 var cid = element.previousElementSibling.value; //hidden으로 숨겨둔 input value 값 -> comment.id값 delete버튼동장에거 id값이 사용되기때문에 
		 var value = element.parentElement.previousElementSibling.children[0].value; //<textarea>의 value값
	        console.log(value);
	        element.parentElement.previousElementSibling.children[0].remove();//<textarea>삭제
	        element.parentElement.previousElementSibling.innerText = value; //<p>태그에 다시 value값 넣어주기
	        
	        var btnDelete = document.createElement("button");  //<button>엘리먼트 다시 생성
	        btnDelete.innerText = "삭제"; //<button>이름변경
	        btnDelete.setAttribute("class","btn btn-sm btn-outline-dark");
	        btnDelete.setAttribute("onclick", "commentDelete(" + cid + ");"); // 삭제 <button> 을 누른다면 다시 commentDelete기능이 동작하게 해줌
	        
	        element.parentElement.append(btnDelete); //마지막에 새로운 요소 추가
	        
	        element.setAttribute("onclick","changeEdit(this);"); //다시 수정버튼을 누르면 changeEdit 기능이 동작하게 해줌
		
	}
	
	function commentUpdate(element){  //댓글 수정 하는 코드
		
		 var cid = element.previousElementSibling.value; //hidden으로 숨겨둔 input value 값 -> comment.id값
		 var value = element.parentElement.previousElementSibling.children[0].value; //<textarea>의 value값 
	     console.log("아이디값"+cid);
	     console.log("내용"+value);
	     
		
		$.ajax({
			url: "/somoim/moim/board/comment/modify",
			type: "post",
			data: {
				cid: cid,
				content: value
			},
			success: function(data) {
				if(data.code === "success") {
					// update시  잘못되었을때 다시 원래값으로 되돌려주기위해서 여기서 다시한번 value값다시정의 
					element.parentElement.previousElementSibling.children[0].value = value;
					changeText(element); //댓글수정이 성공하면 changeText(element) 가 동작하도록한다. 
				}else if(data.code === "notexist"){
					alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
				}
			}
		});
		
	}
  
  
</script>


<body>
  <div class="wrap p-5">
    <!-- header -->
    <header class="container d-flex justify-content-center align-items-center rounded-3 shadow-sm bg-white">
      <h1 class="title">소모임</h1>
      <i class="fa-solid fa-comments mx-2"></i>
    </header>

    <main class="container pt-3 px-0">
      <div class="row"> 
		<!-- add menu -->
		 <div class="col-md-9">
			<div class="p-4 rounded-3 shadow-sm bg-white" style="height: 100%;">
				<h4 class="mb-3">게시판 상세</h4>
					   <div class="mt-3">
							<div class="mb-1 border-bottom border-2 border-secondary">
								<h1>글 제목: ${data.boardTitle}</h1>
							</div>
							<div class="mb-3">
								<label class="pe-3 text-secondary text-opacity-75">작성자: ${data.memberId}</label>
								<fmt:formatDate value="${data.boardCreateDate}" var="boardCreateDate" dateStyle="long" />
								<label class="pe-3 text-secondary text-opacity-75">작성일: ${boardCreateDate}</label>
							</div>
							<div class="mb-1 border-bottom border-2 border-secondary">
								<p>${data.content}</p>
							</div>
							<div class="mb-1">
		                      <c:if test="${sessionScope.loginData.memberId eq data.memberId}"> <!-- 일치한경우에만 수정,삭제 버튼을 표시한다. -->
			                   <div class="text-end">
			                      <c:url var="boardModifyUrl" value="/moim/board/modify"/>
 			                      <button class="btn btn-sm btn-outline-dark" type="button" onclick="location.href='${boardModifyUrl}?id=${data.moimId}&boardId=${data.boardId}'" >수정</button>
				                  <button class="btn btn-sm btn-outline-dark" type="button" onclick="deleteBoard(${data.boardId})">삭제</button>
				               </div>
                           </c:if>
                       </div>
					  </div> 		
						
                       


	   <div class="mb-3">
		   <c:forEach items="${paging.pageData}" var="comment"> <!-- 요기서부터 페이징으로 나눈 데이터 출력시켜주는 코드 -->
		   <div class="mb-1">
		      <div class="card border-light">
		         <div class="card-header">
		            <div class="d-flex justify-content-between">
		               <span><small>${comment.memberId}</small></span> <!-- commentPage -> comment변수명으로 -->
		               <span><small>${comment.contentCreateDate}</small></span>
		            </div>
		         </div>
		         <div class="card-body-size">
		              <!--  <input type="hidden" value="${comment.commentId}"> -->
		               <c:set var="newLine"  value="<%= \"\n\" %>"/> <!-- 따옴표 이스케이프 -->
		               <p class="margin-10">${fn:replace(comment.content,newLine,'<br>')}</p> 
                 </div>
		      
		        <c:if test="${sessionScope.loginData.memberId eq comment.memberId}"> <!-- 일치한경우에만 수정,삭제 버튼을 표시한다. -->
			        <div class="text-end">
			          <input type="hidden" value="${comment.commentId}">
 			          <button class="btn btn-sm btn-outline-dark" type="button"  id="testtest" onclick="changeEdit(this);">수정</button>
 			          <button class="btn btn-sm btn-outline-dark" type="button"  onclick="commentDelete(${comment.commentId})" >삭제</button>
				    </div>
                </c:if>
               </div>       
				 
		       
		    </div>
		    </c:forEach>
		    
		    
		    <nav>
		   <div>
		     <ul class="pagination justify-content-center">
		        <c:url var="boardDetailUrl" value="/moim/boardDetail">
		          <c:param name="id">${data.moimId}</c:param>
		          <c:param name="boardId">${data.boardId}</c:param> 
		        </c:url>
		        <c:if test="${paging.hasPrevPage()}">
		         <li class="page-item">
		           <a class="page-link" href="${boardDetailUrl}&page=${paging.prevPageNumber}">prev</a>
		         </li>
		        </c:if> 
		        
		        <c:forEach items="${paging.getPageNumberList(paging.currentPageNumber - 2 , paging.currentPageNumber + 2)}" var="num">
		         <li class="page-item ${paging.currentPageNumber eq num ? 'active' : ''}"> <!-- active 넣으면 활성화됨 -->
		           <a class="page-link" href="${boardDetailUrl}&page=${num}">${num}</a>
		         </li>
		        </c:forEach>
		        <c:if test="${paging.hasNextPage()}">
		         <li class="page-item">
		           <a class="page-link" href="${boardDetailUrl}&page=${paging.nextPageNumber}">next</a>
		         </li>
		        </c:if> 
		     </ul>
		   </div>
		</nav>
		   <c:url var="boardUrl" value="/moim/board"/>
		   <button class="btn btn-primary" type="button" onclick="location.href='${boardUrl}?id=${data.moimId}'">목록</button>
       </div> 
		
		
		<div class="mb-1">
		    <form action="${boardUrl}/comment/add" method="post">
		      <input type="hidden" name="id" value="${data.moimId }">
		      <input type="hidden" name="bid" value="${data.boardId}">
		      <div class="input-group">
		         <textarea class="form-control" name="content" id="id_data_desc" rows="3" placeholder="400자 이내로 작성해주세요"></textarea>
		         <button class="btn btn-outline-dark" type="button" onclick="formCheck(this.form);">등록</button>
		      </div>
		     </form> 
		   </div>             
                       
                    
                         
                 </div>
		     </div>
		
				
        <!-- right-menu -->
        <div class="col-md-3">
          <div class="p-4 rounded-3 shadow-sm bg-white">
            <section class="user d-flex justify-content-between align-items-center pb-3">
              <div>
                <img src="${img}/profile-image.png" class="rounded-circle" width="60" alt="profile-image">
              </div>
              <div class="user-info">
                <p class="pb-1">홍길동</p>
                <p>서울특별시</p>
              </div>
              <button type="button" class="btn btn-primary btn-sm btn-blue border-0" onclick="location.href='info'" >수정</button>
            </section>
            <section class="d-flex justify-content-between align-items-center pb-3">
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
           		<i class="fa-solid fa-person-swimming icon-green service-sm-items"></i>
              <button type="button" class="btn btn-primary btn-sm btn-blue" >수정</button>
            </section>
            <section>
	        <div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        가입한 모임
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" >
				      <div class="accordion-body">
				         <a href="#"><p class="pb-3">가입 모임A</p></a>
				         <a href="#"><p class="pb-3">가입 모임B</p></a>
				         <a href="#"><p class="pb-3">가입 모임C</p></a>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        찜 한 모임
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" >
				      <div class="accordion-body">
				         <a href="#"><p class="pb-3">찜 한 모임A</p></a>
				         <a href="#"><p class="pb-3">찜 한 모임B</p></a>
				         <a href="#"><p class="pb-3">찜 한 모임C</p></a>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        최근 본 모임
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" >
				      <div class="accordion-body">
				         <a href="#"><p class="pb-3">최근 본 모임A</p></a>
				         <a href="#"><p class="pb-3">최근 본 모임B</p></a>
				         <a href="#"><p class="pb-3">최근 본 모임C</p></a>     
				      </div>
				    </div>
				  </div>
				</div>
            </section>
          </div>
        </div>
        <!-- // right-menu -->
	</div>

    </main>
    <!-- // main -->
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  
  <script type="text/javascript">
		function addData(){
			var formData = $("#form1").serialize();
			$.ajax({
				url: "add",
				type: "POST",
				data: formData,
				dataType: "json",
				success: function(data) {
					location.href = '/somoim';
				}
			})	
		}
		function list() {
			location.href = '/somoim';
		}
		


		function formCheck(form){
				if(form.content.value.trim() === "" ){ //빈값확인하기 ,비어져있으면 경고메세지 
					alert("댓글 내용을 입력하세요");
				}else if(form.content.value.length > 500)
					alert("댓글은 400자까지 가능합니다.");
				else{
					form.submit(); //아니면 submit하기
				}
			}
			

		
		
	</script>
</body>
</html>