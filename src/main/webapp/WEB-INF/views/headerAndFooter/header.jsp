<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- ┏━━━━┓ark Sung Jun -->
<!-- │       ┃ark Sung Jun -->
<!-- │━━━━┛ark Sung Jun -->
<!-- │ark Sung Jun -->
<!-- │ark Sung Jun -->
<!-- │ark Sung Jun -->
<!-- │ark Sung Jun -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="/resources/css/3.3.7/bootstrap.min.css">
<script src="/resources/js/1.9.1/jquery-1.9.1.min.js"></script>
<script src="/resources/js/3.3.7/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/headerLocation.js"></script>  
 
 <style>
 
 .navbar-default .navbar-nav>li>a{
 	cursor:pointer;
 	padding-top: 6px;
 }
 
 
  #easySearchForm{
  	margin-left: 70px;
  }
  
  .modal .modal-dialog {
  	width : 90%;
  }
 
 @media (max-width: 768px) {
  #easySearchForm{
    width: 100% !important;
    margin: auto;
  }
  
  .modal .modal-dialog {
  	width : 100%;
  }
}
 </style>
 
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" onclick="main()" style="cursor:pointer; margin-top: 4px;"><strong>IBM 회의실 예약 시스템</strong></a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
    
    <!-- 여기서부터 간편검색 시작, 모바일 화면은 수정 필요 -->
    <c:if test="${param.page ne 'removeEasySearch'}">
	   	<div id="navSearch">
	    	<form class="nav navbar-nav" method="post" name="easySearchForm" id="easySearchForm" style="width:42%;margin-top:1%;margin-bottom:1%;">
	    		<div class="col-xs-2" style="padding:0px;">
		    		<select name="easySelectSearchOpt" id="easySelectSearchOpt" class="form-control" style="height:5%;font-size:80%;padding:0px">
							<option value="e_all">전체</option>
							<option value="e_title">회의제목</option>
							<option value="e_mem_nm">예약자</option>
							<option value="e_mem_pn">전화번호</option>
					</select>
				</div>
				
				<div class="col-xs-8" style="padding:0px;">
		    		<input type="text" name="easyInputSearchCont" id="easyInputSearchCont" placeholder="간편검색" class="form-control" style="height:5%;font-size:80%;padding:0px">
		    	</div>
		    	
		    	<div class="col-xs-2" style="padding:0px;">
	
	      			<button type="button" id="modalBtn" data-toggle="" data-target="" onclick="easySearchCheck()" 
	      				class="btn btn-secondary my-2 my-sm-0" style="height:5%;background-color:#2c3e50;'">
	   				<span class="fa fa-search" aria-hidden="true" style="color:white;background-color:#2c3e50;"></span></button>
	
		      	</div>
		      	
	    	</form>
	   	</div>
	   	</c:if>

    	
		<div style="margin-top:1.5%; margin-bottom:1%;">
		       <ul class="nav navbar-nav navbar-right" >
		       <li><a  onClick="repeatReservation()" ><strong>반복예약신청</strong></a></li>
		       <c:choose>
		       	<c:when test="${sessionScope.id ne null}">
		       		<li><a onClick="adminSearchPage()"><strong>검색(관리자용)</strong></a></li>
		       	</c:when>
		       	
		       	<c:otherwise>
		       		<li><a onClick="searchPage()" ><strong>검색</strong></a></li>
		       	</c:otherwise>
		       </c:choose>
			<li><a target="_blank" onclick="admin()"><strong>관리자</strong></a></li>
			
			<c:if test="${sessionScope.id ne null}">
			   <li><a target="_blank" onclick="logout()" style="color:red;"><strong>로그아웃</strong></a></li>
			</c:if>
		     </ul>
   	 </div>
    
    </div>
  </div>
</nav>



   	<!--  간편검색 모달 -->
   	<div id="easySearch">
	   	<div class="modal fade" id="easySearchResult" >
	    	<div class="modal-dialog" style="background-color:white;'">
	    		<div class="modal-content">
	    		
	    		<div class="modal-header">
	    			<h4>간편검색 검색결과</h4>
	    		</div>
					
					<div class="modal-body" >
						<div id="result"></div>
						<div id="detail"></div>
					</div> 
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
					</div>
	    		</div>
	    	</div>
	   	</div>
	   </div>

<script>
</script>