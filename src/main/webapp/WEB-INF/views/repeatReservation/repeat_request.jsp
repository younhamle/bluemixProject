<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/loadingBar/loadingBar.css" />
<script type="text/javascript" src="/resources/loadingBar/spin.js"></script>
<script type="text/javascript" src="/resources/loadingBar/ajaxLoading.js"></script>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반복 예약 신청</title>
</head>
<body id="htmlBody">

<div id="loader"></div>
	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>
	
	<div class="container">
		
	    <div class="panel panel-default">
				<div class="panel-body"><i class="fa fa-repeat"></i> 반복 예약 신청 </div>
		</div>
		
		<div id="calendar"></div> <br>
		
		<form action="/RepeatReservation/RepeatReservationSubmit" method="post" id="repeatReservation">
			<div class="col-lg-12">
				<div class="form-group col-lg-3">
				  <label class="control-label">시작 날짜</label>
				  <div>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
				    <input class="form-control input-sm" type="text" id="rsvStartDate" name="rsvStartDate" maxlength=45 onchange="startDateChange();">
				  </div>
				  </div>
				</div>
				
				<div class="form-group col-lg-3">
				  <label class="control-label">끝 날짜</label>
				  <div>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
				    <input class="form-control input-sm" type="text" id="rsvEndDate" name="rsvEndDate" maxlength=45 onchange="endDateChange();">
				  </div>
				  </div>
				</div>
				
				<div class="form-group col-lg-3">
				  <label class="control-label">시작 시간</label>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-clock-o"> </i></span> 
		 		 		<select id="rsvStartTime" name="rsvStartTime" class="form-control input-sm" onchange="startTimeChange()">
						<option value="09:00:00">09:00</option>
						<option value="09:30:00">09:30</option>
						<option value="10:00:00">10:00</option>
						<option value="10:30:00">10:30</option>
						<option value="11:00:00">11:00</option>
						<option value="11:30:00">11:30</option>
						<option value="12:00:00">12:00</option>
						<option value="12:30:00">12:30</option>
						<option value="13:00:00">13:00</option>
						<option value="13:30:00">13:30</option>
						<option value="14:00:00">14:00</option>
						<option value="14:30:00">14:30</option>
						<option value="15:00:00">15:00</option>
						<option value="15:30:00">15:30</option>
						<option value="16:00:00">16:00</option>
						<option value="16:30:00">16:30</option>
						<option value="17:00:00">17:00</option>
						<option value="17:30:00">17:30</option>
					</select>   
				  </div>
				</div>
				
				<!--  작성자 : 박성준 -->
				<!--  끝 시간은 시작시간에 의하여 변경 -->
				<div class="form-group col-lg-3">
				  <label class="control-label">끝 시간</label>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-clock-o"> </i></span>
				    <select id="rsvEndTime" name="rsvEndTime" class="form-control input-sm">
					</select> 
				  </div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-3">
					<label class="control-label">회의실</label>
					<div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-laptop"></i></span>
					 	<select id="rsvConfName" name="rsvConfName" class="form-control input-sm">
					 		<c:forEach items="${meetingRoomList}" var="meetingRoomList">
					 			<option value='${meetingRoomList.CONF_NO}'>${meetingRoomList.CONF_NM}</option>
					 		</c:forEach>
					    </select>
				  	</div>
				  <div id="confChkMsg" style="display:none"></div>
					  
				</div>
				
				  
				<div class="form-group col-lg-3">
					  <label class="control-label">반복 주기</label>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-repeat"></i></span>
					    <select id="repeatPeriod" name="repeatPeriod" class="form-control input-sm" onchange="repeatPeriodChange(); weekSelectForm()">
							<option value="week">주</option>
							<option value="day">일</option>
					    	<option value="month">월</option>
					    </select>
					  </div>
				</div>
				
				<div class="form-group col-lg-3" id="weekSelect">
					<label class="control-label">반복 요일</label>
					<div class="input-group" style="margin-top:-5px">
							
							<div class="btn-group btn-sm" data-toggle="buttons" onchange="weekSelectCheckBox()">
								
								<label class="btn btn-default btn-sm weekBtn" id="weekMonBtn">
									<input type="checkbox" id="weekMon" name="weekMon" class="weekCheckSelect">
									월
								</label>
					
								<label class="btn btn-default btn-sm weekBtn" id="weekTueBtn">
									<input type="checkbox" autocomplete="off" id="weekTue" name="weekTue" class="weekCheckSelect" value="tue">
									화
								</label>			
							
								<label class="btn btn-default btn-sm weekBtn" id="weekWedBtn">
									<input type="checkbox" autocomplete="off" id="weekWed" name="weekWed" class="weekCheckSelect">
									수
								</label>			
							
								<label class="btn btn-default btn-sm weekBtn" id="weekThuBtn">
									<input type="checkbox" autocomplete="off" id="weekThu" name="weekThu" class="weekCheckSelect">
									목
								</label>			
					
								<label class="btn btn-default btn-sm weekBtn" id="weekFriBtn">
									<input type="checkbox" autocomplete="off" id="weekFri" name="weekFri" class="weekCheckSelect">
									금
								</label>			
							</div>
							
					</div>
				</div>
				
				<div class="form-group col-lg-3">
					  <button type="button" class="btn btn-danger" id="reservationCheckBtn" name="reservationCheckBtn" style="margin-top:10px" onclick="reservationCheck()">예약 가능 확인</button>
				</div>
			
				
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-12">
				 <label class="control-label">예약 가능 날짜</label>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-check"></i></span>
					   <input class="form-control input-sm" type="text" id="availableTime" name="availableTime" style= "overflow:auto; color:blue" readonly>
					  </div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-12">
				 <label class="control-label">예약 불 가능 날짜</label>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-exclamation-triangle"></i></span>
					    <input class="form-control input-sm" type="text" id="duplicateTime" name="duplicateTime" style= "overflow:auto; color:red" readonly>
					  </div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-4">
				 <label class="control-label">색상</label>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-eye"></i></span>
					    <select id="rsvColor" name="rsvColor" class="form-control input-sm" readonly>
					    	<option value="red">빨강</option>
					    	<option value="orange">주황</option>
					    	<option value="green">초록</option>
					    	<option value="blue" selected>파랑</option>
					    	<option value="navy">남색</option>
					    	<option value="skyblue">하늘</option>
					    </select>
					  </div>
				</div>
				
				<div class="form-group col-lg-4">
				  <label class="control-label">회의제목</label>
				  <div>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-comments"></i></span>
				    <input class="form-control input-sm" type="text" id="rsvTitle" name="rsvTitle" maxlength=45 value="${param.rsvTitle }" placeholder="회의제목을 입력하세요" readonly>
				  </div>
				  </div>
				</div>
				
				<div class="form-group col-lg-4">
				  <label class="control-label">비밀번호</label>
				  <div>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-key"></i></span>
				    <input class="form-control input-sm" style="font-family:arial" type="password" id="rsvDelPwd" name="rsvDelPwd" maxlength=45 value="${param.rsvDelPwd }" placeholder="비밀번호를 입력하세요" readonly>
				  </div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-4">
				  <label class="control-label">전화번호</label>
				  <span id="phoneCheckSpan" ></span>
				  <div>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-phone"></i></span>
					    <input class="form-control input-sm" type="text" id="rsvMemPn" name="rsvMemPn" maxlength=13 value="${param.rsvMemPn }" placeholder="전화번호를 입력하세요"  onkeyup="inputDash();memberBanCheck()" readonly>
					  </div>
				  </div>
				</div>
				
				<div class="form-group col-lg-4">
				  <label class="control-label">이름</label>
				  <div>
					  <div class="input-group">
					    <span class="input-group-addon input-sm"><i class="fa fa-user-plus"></i></span>
					    <input class="form-control input-sm" type="text" id="rsvMemNm" name="rsvMemNm" maxlength=45 value="${param.rsvMemNm }" placeholder="이름을 입력하세요" readonly>
					  </div>
				  </div>
				</div>

				<div class="form-group col-lg-4">
					<div style="text-align:left; display:inline"><label class="control-label">이메일</label></div>
					    <div style=" text-align:right; display:inline">
					    	<label><span class="control-label" style="width:250px; color:#8d9193; font-size:12px; text-align:right" id="reminder"></span>
					 	    <input type="checkbox" id="rsvEmailCheck" name="rsvEmailCheck" checked>
					   		<input type="hidden" id="emailCheckValue" name="emailCheckValue">
					  		</label>
					    </div>
					<span id="emailCheckSpan" ></span>
					<div>
						<div class="input-group">
							<span class="input-group-addon input-sm">
								<i class="fa fa-envelope"></i>
							</span> 
							<input class="form-control input-sm" type="text" id="rsvMemEm" name="rsvMemEm" maxlength=45 placeholder="이메일을 입력하세요" onkeydown="emailCheck()" onchange="emailCheck()" readonly>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="form-group col-lg-12">
				  <label class="control-label">상세 설명</label>
				  <div>
				  <div class="input-group">
				    <span class="input-group-addon input-sm"><i class="fa fa-text-height"></i></span>
				    <input class="form-control input-sm" type="text" id="rsvDescription" name="rsvDescription" maxlength=45 value="${param.rsvMemNm }" placeholder="상세한 내용을 입력해주세요" readonly>
				  </div>
				  </div>
				</div>
			</div>
			
			<div class="col-xs-12">
				<button type="button" class="btn btn-primary" style="float:right; margin-right:30px; display:inline-block" id="repeatReservationSubmitBtn" onclick="repeatSubmit()" readonly>반복 예약 신청</button>
				<div class="loading-container" style="padding-top:5px;" id="lodingContainer">
				    <div class="loading" id="loadingBar"></div>
				    <div id="loading-text" id="loadingText">loading</div>
				</div>
			</div>
			
			
			<input type = "hidden" id="availableDate" name="availableDate">
			<input type="hidden" id="rsvTotalTime" name="rsvTotalTime">
			<input type="hidden" id="checkBoxArray" name="checkBoxArray">
		</form>
	</div>

	<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>
</body>
</html>

<script>

$("#lodingContainer").hide();

var availableValue = [];
var duplicateValue = [];
var readonlyCheck = false;
var reservationAvailableCheck = false;
var phoneValiCheck = false;
var timeCheck = true;
var dateCheck = true;
var memberBanState = false;

var date = new Date();
$( "#rsvStartDate" ).datepicker({ beforeShowDay: $.datepicker.noWeekends});
$( "#rsvEndDate" ).datepicker({ beforeShowDay: $.datepicker.noWeekends});


var week = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');

$(function() {
	
	$("#rsvStartDate").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#rsvStartDate").datepicker().datepicker("setDate", new Date()); //defaultDate 설정
	$("#rsvStartDate").datepicker( "option", "minDate", new Date());
	$( "#rsvStartDate" ).datepicker({ beforeShowDay: $.datepicker.noWeekends});
	
	
	$("#rsvEndDate").datepicker();
	$("#rsvEndDate").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#rsvEndDate").datepicker().datepicker("setDate", new Date()); //defaultDate 설정
	$("#rsvEndDate").datepicker( "option", "minDate", new Date());
	$( "#rsvEndDate" ).datepicker({ beforeShowDay: $.datepicker.noWeekends});
	
	
});



function weekSelectForm(){
	
	var repeatPeroidValue = $('#repeatPeriod option:selected').val();
	
	if(repeatPeroidValue=="week"){
		$("#weekSelect").show();
	}
	else{
		$("#weekSelect").hide();
	}
}

function weekSelectCheckBox(){
	
	var startDate = new Date($("#rsvStartDate").val());
	var weekString = week[startDate.getDay()];
	
	if( $("#weekMon").is(":checked")){
		$("#weekMonBtn").attr("class","btn btn-primary btn-sm active");
	}
	else{
		$("#weekMonBtn").attr("class","btn btn-default btn-sm");
	}
	
	if( $("#weekTue").is(":checked")){
		$("#weekTueBtn").attr("class","btn btn-primary btn-sm active");
	}
	else{
		$("#weekTueBtn").attr("class","btn btn-default btn-sm");
	}
	
	if( $("#weekWed").is(":checked")){
		$("#weekWedBtn").attr("class","btn btn-primary btn-sm active");
	}
	else{
		$("#weekWedBtn").attr("class","btn btn-default btn-sm");
	}
	
	if( $("#weekThu").is(":checked")){
		$("#weekThuBtn").attr("class","btn btn-primary btn-sm active");
	}
	else{
		$("#weekThuBtn").attr("class","btn btn-default btn-sm");
	}
	
	if( $("#weekFri").is(":checked")){
		$("#weekFriBtn").attr("class","btn btn-primary btn-sm active");
	}
	else{
		$("#weekFriBtn").attr("class","btn btn-default btn-sm");
	}
}

function emailStateCheck(){
	
	//checkbox의 checked 상태 확인
	if($('input:checkbox[id="rsvEmailCheck"]').is(":checked") == true){
		$("#emailCheckValue").val("Y");
	}else{
		$("#emailCheckValue").val("N");
	}
}

// 시작시간또는 끝시간 변경시 , 유효성 검사
	function dateChange(){
		var startDateValue = $("#rsvStartDate").val();
		var endDateValue = $("#rsvEndDate").val();
		
		if(startDateValue>endDateValue){
			dateCheck = false;
		}
		else{
			dateCheck = true;
		}
	}

	// 사용자 핸드폰 번호 입력시
	$("#rsvMemPn").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
		var pn = inputDash();
		$("#rsvMemPn").val(pn); // - 포함해 실시간 값 업데이트	
	});
	
	// 핸드폰 번호 자동으로 Dash
	function inputDash(){
	 	var pn = $("#rsvMemPn").val();
		pn = pn.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"); 
		return pn;
	}
	
	// 모든값 입력확인
	function inputValueAllCheck(){
		
		var meetingTitle = $("#rsvTitle").val().length;
		var pwd = $("#rsvDelPwd").val().length;
		var phoneNumber = $("#rsvMemPn").val().length;
		var name = $("#rsvMemNm").val().length;
		var email = $("#rsvMemEm").val().length;
		var description = $("#rsvDescription").val().length;

		if(meetingTitle==0 || pwd ==0 || phoneNumber == 0 ||
				name == 0 || email ==0 || description == 0){
			alert("모든 값을 입력해주세요");
			reservationAvailableCheck = false;
		}
		
		else{
			reservationAvailableCheck = true;
		}
	}
	
	// 사용자 차단확인
	function memberBanCheck(){
		
		var memberPn = $("#rsvMemPn").val();
		
		$.ajax({
			url:"/AdminBoarding/MemberBanCheck",
			dataType : "text",
			type : "POST",
			data : { "memberPn" : memberPn },
			success : function(data) {
				if(data=="NOSHOWBAN" || data=="차단"){
					memberBanState =  true;
				}
				else{
					memberBanState = false;
				}
			},
			error : function(request, status, error) {
				alert("code : "+request.status + "\n" + "error : " + error);
			}
		});
	}
	
	// 최종 제출
	function repeatSubmit(){
		
		inputValueAllCheck();
		
		if(memberBanState==true){
			alert("정지된 회원입니다");
		}
		else if(reservationAvailableCheck == true){
			emailStateCheck();
			ableReservation();
			readOnlySetting();
			$("#lodingContainer").show();
			$("#reservationCheckBtn").attr("disabled",true);
			$("#repeatReservationSubmitBtn").attr("disabled", true);
			$("#repeatReservation").submit();
		}
	}
	
	// 시작시간 변경시 
	function startTimeChange(){
         
         /*After select the start time, set the values of the end time*/
         var sTime = $('#rsvStartTime option:selected').val();
         var sHour = sTime.substring(0,2); //09,10,11,12,13,14,15,16,17
         var sMinute = sTime.substring(3,5); //00,30
         var sHour_Num = parseInt(sHour); //hour string -> int
         var sHour_Num2 = parseInt(sHour);
         
         $('#rsvEndTime').empty(); //end date values empty
         
         if(sTime == '09:00:00'){ //case 0900
            $('#rsvEndTime').append("<option value='09:30:00'>09:30</option>");
            for(var i=10 ; i<18 ; i++){
               $('#rsvEndTime').append("<option value='"+i+":00:00'>"+i+":00</option>");
               $('#rsvEndTime').append("<option value='"+i+":30:00'>"+i+":30</option>");
            }
            $('#rsvEndTime').append("<option value='18:00:00'>18:00</option>");
         }
         
         if(sMinute == '30'){ //case __30
            for(var i=sHour_Num+1 ; i<18 ; i++){
               $('#rsvEndTime').append("<option value='"+i+":00:00'>"+i+":00</option>");
               $('#rsvEndTime').append("<option value='"+i+":30:00'>"+i+":30</option>");
            }
            $('#rsvEndTime').append("<option value='18:00:00'>18:00</option>");
         }
         
         if(sMinute == '00' && sTime != '09:00:00'){ //case __00 && not 0900
            var i=sHour_Num2;
            while(i<18){
               $('#rsvEndTime').append("<option value='"+i+":30:00'>"+i+":30</option>");
               i++;
               $('#rsvEndTime').append("<option value='"+i+":00:00'>"+i+":00</option>");
            }
         }
	}
	
	

	
	$("#rsvStartDate").datepicker({
		minDate : date
	//오늘 이전 날짜는 선택 불가 -> 예약 불가
	});
	
	$("#rsvEndDate").datepicker({
		minDate : date
	//오늘 이전 날짜는 선택 불가 -> 예약 불가
	});
	
	function startDateChange(){
		$('#rsvEndDate').datepicker("option", "minDate", $("#rsvStartDate").val());
	}
	function endDateChange(){
		$('#rsvStartDate').datepicker("option", "maxDate", $("#rsvEndDate").val());
	}


	// 예약가능한 날짜 확인
	function reservationCheck() {
		
		var changeAvailable = [];
		var changeDuplicate = [];
		
		
		
		var weekMonCheck = $("#weekMon").is(":checked");
		var weekTueCheck = $("#weekTue").is(":checked");
		var weekWedCheck = $("#weekWed").is(":checked");
		var weekThuCheck = $("#weekThu").is(":checked");
		var weekFriCheck = $("#weekFri").is(":checked");
		
		if(dateCheck==false){
			alert("날짜 입력이 잘못됐습니다.");
		}
		
		else if(timeCheck==false){
			alert("시간 입력이 잘못됐습니다.");
		}
		
		
		else if($("#repeatPeriod").val()=="week" && weekMonCheck==false && weekTueCheck == false 
				&& weekWedCheck == false && weekThuCheck == false && weekFriCheck ==false){
			alert("주간 반복할 요일을 선택해주세요");
		}

		else if (readonlyCheck == false) {

			$.ajax({
				url : "/RepeatReservation/AvailableCheck",
				dataType : "json",
				async : false,
				type : "POST",
				data : $('#repeatReservation').serializeArray(),
				success : function(data) {
					if (data[0] == "") {
						alert("가능한예약이 없습니다");
						availableValue=null;
					}

					else {
						availableValue = data[0];
						duplicateValue=data[1];
						ableInputBox();
						disableReservation();
						calTotalTime();
						readonlyCheck = true;
						$("#reservationCheckBtn").html("예약 수정");
						$("#reservationCheckBtn").attr("class","btn btn-success");
						$("#availableDate").val(availableValue);
						updateCalendar(availableValue,duplicateValue);
					}

					if (data[1] != null) {
						duplicateValue = data[1];
					}

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "error:" + error);
				}
			});

			for ( var i = 0; i < availableValue.length; i++) {
				changeAvailable[i] = availableValue[i];
				changeAvailable[i] = changeAvailable[i].substring(2);
				changeAvailable[i] = "  " + changeAvailable[i];
			}

			for ( var i = 0; i < duplicateValue.length; i++) {
				changeDuplicate[i] = duplicateValue[i];
				changeDuplicate[i] = changeDuplicate[i].substring(2);
				changeDuplicate[i] = "  " + changeDuplicate[i];
			}

			$("#availableTime").val(changeAvailable);
			$("#duplicateTime").val(changeDuplicate);

		}
		
		else {
			deleteCalendar();
			$("#reservationCheckBtn").html("예약 가능 확인");
			$("#reservationCheckBtn").attr("class", "btn btn-danger");
			$("#availableTime").val("");
			$("#duplicateTime").val("");
			ableReservation();
			readonlyCheck = false;
			disableInputBox();
		}

	}
	
	// 달력에서 정보 삭제
	function deleteCalendar(){
		
		$('#calendar').fullCalendar('removeEvents', function(event) {
		    return event.className == "allDay";
		});

	}
	
	// 달력에서 정보 삭제
	function updateCalendar(avaliable,duplicate){
		
		$('#calendar').fullCalendar('removeEvents', function(event) {
		    return event.className == "allDay";
		});
		
			for(var i=0; i<avaliable.length; i++){
				
				var newEvent = {
		                title: '가능',
		                start: avaliable[i],
		                color :'#2E2EFE',
		                className : 'allDay'
		          };
		         $('#calendar').fullCalendar( 'renderEvent', newEvent , 'stick');
			}
			
			for(var j=0; j<duplicate.length; j++){
				var newEvent = {
		                title: '불가능',
		                start: duplicate[j],
		                color: '#FE2E64',
		                className : 'allDay'
		          };
				$('#calendar').fullCalendar( 'renderEvent', newEvent , 'stick');
			}
	}

	// Pop-Up 임시로 넣어둠
	function repeatDay() {

		window.open("/RepeatReservation/RepeatDay", "EventFrame",
				"menubar=no,width=430,height=360,toolbar=no");
	}

	// 예약확인 후 readOnly 해제
	function ableInputBox() {
		$("#rsvColor").removeAttr("readonly");
		$("#rsvTitle").removeAttr("readonly");
		$("#rsvDelPwd").removeAttr("readonly");
		$("#rsvMemPn").removeAttr("readonly");
		$("#rsvMemNm").removeAttr("readonly");
		$("#rsvMemEm").removeAttr("readonly");
		$("#rsvDescription").removeAttr("readonly");
		$("#repeatReservationSubmitBtn").removeAttr("disabled");
	}

	// 예약확인 하기전 readOnly
	function disableInputBox() {
		$("#rsvColor").attr("readonly", true);
		$("#rsvTitle").attr("readonly", true);
		$("#rsvDelPwd").attr("readonly", true);
		$("#rsvMemPn").attr("readonly", true);
		$("#rsvMemNm").attr("readonly", true);
		$("#rsvMemEm").attr("readonly", true);
		$("#rsvDescription").attr("readonly", true);
		$("#repeatReservationSubmitBtn").attr("disabled", true);
	}

	function disableReservation() {
		$("#rsvStartDate").attr("disabled", true);
		$("#rsvEndDate").attr("disabled", true);
		$("#rsvStartTime").attr("disabled", true);
		$("#rsvEndTime").attr("disabled", true);
		$("#rsvConfName").attr("disabled", true);
		$("#repeatPeriod").attr("disabled", true);
		$("#repeatSetting").attr("disabled", true);
	}

	function ableReservation() {
		$("#rsvStartDate").attr("disabled", false);
		$("#rsvEndDate").attr("disabled", false);
		$("#rsvStartTime").attr("disabled", false);
		$("#rsvEndTime").attr("disabled", false);
		$("#rsvConfName").attr("disabled", false);
		$("#repeatPeriod").attr("disabled", false);
		$("#repeatSetting").attr("disabled", false);
	}
	
	function readOnlySetting() {
		$("#rsvStartDate").attr("readonly", true);
		$("#rsvEndDate").attr("readonly", true);
		$("#rsvStartTime").attr("readonly", true);
		$("#rsvEndTime").attr("readonly", true);
		$("#rsvConfName").attr("readonly", true);
		$("#repeatPeriod").attr("readonly", true);
		$("#repeatSetting").attr("readonly", true);
	}
	
	//예약 최대 시간 설정값 
	function getMaxTime(){
		//예약 max time 설정값 가져오기
		var maxTime;
		$.ajax({
			url:"/Reservation/GetMaxTime",
			type:"post",
			dataType:"text",
			async: false,
			success:function(max){	
				maxTime = max;
			},
			error:function(request,status,error){
				alert("Get Max Time Error");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		return maxTime;
	}
	
	// 전체시간 구하는 함수 (예약 총시간)
	function calTotalTime(){

		var maxTime = getMaxTime();
	 	var end = $("#rsvEndTime").val().substr(0, 2)+""+$("#rsvEndTime").val().substr(3, 2)+""+$("#rsvEndTime").val().substr(6, 2);
	 	var start = $("#rsvStartTime").val().substr(0, 2)+""+$("#rsvStartTime").val().substr(3, 2)+""+$("#rsvStartTime").val().substr(6, 2);
	 	var duration = (parseInt(end)-parseInt(start)).toString();
	 	var min = "00";
		var overTime = "NULL";
		if(duration.length == 4){
			if(duration.substr(0,2) != "00"){
	 	 		min = "30"
	 	 	}
			duration = "00:"+min+":00";
			
		}else if(duration.length == 5){
	 		if(duration.substr(1,2) != "00"){
	 	 		min = "30"
	 	 	}
		 	duration = duration.substr(0,1)+":"+min+":00";
		 	
		 	if(duration.substr(0,1) >= maxTime){
				overTime = "T";
			}
			
	 	}else if(duration.length == 6){
	 		if(duration.substr(2,2) != "00"){
	 	 		min = "30"
	 	 	}
		 	duration = duration.substr(0,2)+":"+min+":00";
		 	
		 	if(duration.substr(0,2) >= maxTime){
				overTime = "T";
			}
		 	
	 	}else{
	 		duration = "00:"+duration.substr(0,2)+":00";
	 	}
		$("#rsvTotalTime").val(duration);
		
		return overTime;
		
	}

	function repeatPeriodChange() {

		var repeatPeriod = $("#repeatPeriod option:selected").val();
		var repeatSettingSize = $("#repeatSetting option").size();

		for ( var i = 1; i <= repeatSettingSize; i++) {
			$("#repeatSetting option:eq(0)").remove();
		}

		if (repeatPeriod == "day") {
			$("#repeatSetting").append("<option value='day'>매일</option>");
		} else if (repeatPeriod == "week") {
			$("#repeatSetting")
					.append("<option value='1week'>1주마다 반복</option>");
			$("#repeatSetting")
					.append("<option value='2week'>2주마다 반복</option>");
			$("#repeatSetting")
					.append("<option value='3week'>3주마다 반복</option>");
			$("#repeatSetting")
					.append("<option value='4week'>4주마다 반복</option>");
		} else {
			$("#repeatSetting").append(
					"<option value='monthDayRepeat'>일 반복 ()</option>");
			$("#repeatSetting").append(
					"<option value='monthWeekRepeat'>요일 반복</option>");
		}
	}

	// fullcalendar 설정
	$('#calendar').fullCalendar({
		height:500,
		schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
	    defaultView: 'month',
	    events: [
		],
	    resources: [
	          
	    ]
	});
	
	var reminderInterval;
	$(document).ready(function(){
		
		$.ajax({
		      url : "/AdminManagement/SettingLoad",
		      dataType : "json",
		      async : false,
		      type : "POST",
		      success : function(data) {
		         //reminder메일 수신간격-setting값 반영
		         reminderInterval = data.SET_EMAIL_TIME;
		         reminderInterval += "분전 reminder 메일 수신";
		         $("#reminder").text(reminderInterval);	
		      },
		      error : function(request, status, error) {
		      }
		   });
		
		startTimeChange();
	 	
		//전화번호 입력을 통해 이름과 이메일 자동입력
		var data = new Array();
		
		$("#rsvMemPn").autocomplete({
			   source: function (request, response) {
				   $.ajax({
						url:"/Member/GetMemInfoByPn",
						type:"post",
						dataType:"json",
						data:{ "memPn" : request.term },
						success:function(data){				
					 	  //data :: JSON list defined
					 	  response($.map(data, function (item) {
		 			          return {
		 									label: item.pn,
		 				                    value: item.pn,
		 				                    nm : item.nm,
		 				                    em : item.em
		 				               }
		 			          }));
							
						},
						error:function(request,status,error){
							alert("Get Member Information Error");
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			    },
			    select: function(event, ui) {
			    	$("#errorPn").empty();
			    	$("#errorName").empty();
			    	$("#errorEmail").empty();
					$("#rsvMemNm").val(ui.item.nm);
					$("#rsvMemEm").val(ui.item.em);
				}
		 	});
		
		
		
		

	});
	
</script>





