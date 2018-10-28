<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>

<link rel="stylesheet"	href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" 	type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/bootswatch.css" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less" />

<script type="text/javascript" src="/resources/js/headerLocation.js"></script>
<script type="text/javascript" src="/resources/js/adminFooter.js"></script>
<script type="text/javascript" src="/resources/loadingBar/ajaxLoading.js"></script>   



<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("/");  
	}
%>

<html>
<head>
<title>관리자 Setting</title>

</head>
<body id="htmlBody">
	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>

	<div class="container" id="ddddd">
	
		<jsp:include page="admin_footer.jsp"></jsp:include>
		
		<div class="panel panel-default">
				<div class="panel-body">설정 관리</div>
		</div>
		
		<div id="settingFormDiv">
			<div class="col-lg-6">
				<div class="panel panel-default">
				  <div class="panel-heading">비밀번호 변경<span style="display:inline-block" id="pwDescription"></span></div>
				  
				  <div class="panel-body">
				    <div class="form-group col-sm-5">
						  <label class="control-label">비밀번호 </label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-key"></i></span>
						    <input class="form-control input-sm" style="font-family:arial" type="password" id="changePw" onkeyup="pwSameCheck()">
						  </div>
					</div>
					
					<div class="form-group col-sm-5">
						  <label class="control-label">비밀번호 재 입력</label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-key"></i></span>
						    <input class="form-control input-sm" style="font-family:arial" type="password" id="changePwCheck" onkeyup="pwSameCheck()">
						  </div>
					</div>
					
					<div class="col-sm-2" style="margin-top:25px">
						  <Button type="button" class="btn btn-primary btn-sm" onclick="changePwBtn()">변경</Button>
					</div>
				  </div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="panel panel-default">
				  <div class="panel-heading">이메일 변경<span style="display:inline-block" id="emailDescription"></span></div>
				  
				  <div class="panel-body">
				    <div class="form-group col-sm-5">
						  <label class="control-label">이메일 </label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-envelope-o"></i></span>
						    <input class="form-control input-sm" type="text" id="changeEmail" onkeyup="emailSameCheck()">
						  </div>
					</div>
					
					<div class="form-group col-sm-5">
						  <label class="control-label">이메일 재 입력</label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-envelope-o"></i></span>
						    <input class="form-control input-sm" type="text" id="changeEmailCheck" onkeyup="emailSameCheck()">
						  </div>
					</div>
					
					<div class="col-sm-2" style="margin-top:25px">
						  <Button type="button" class="btn btn-primary btn-sm" onclick="changeEmailBtn()">변경</Button>
					</div>
				  </div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="panel panel-default">
				  <div class="panel-heading">예약가능 기간(월)</div>
				  <div class="panel-body">
				    <div class="form-group col-sm-5">
						  <label class="control-label">현재 예약 가능 기간</label>
						  <div class="input-group">
						    <input class="form-control input-sm" type="text" id="reservationMaxMonth" disabled="" value="${settingValue.SET_REV_MAX_MONTH}개월">
						  </div>
					</div>
					
					<div class="form-group col-sm-5">
						  <label class="control-label">변경 예약 가능 기간</label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
						    <input class="form-control input-sm" type="text" id="changeReservationMaxMonth">
						  </div>
					</div>
					
					<div class="col-sm-2" style="margin-top:25px">
						  <a href="#" class="btn btn-primary btn-sm" onclick="reservationMaxMonthBtn()">변경</a>
					</div>
				  </div>
				</div>
			</div>
		</div>
		
		<div>
			<div class="col-lg-6">
				<div class="panel panel-default">
				  <div class="panel-heading">이메일 전송 시간</div>
				  <div class="panel-body">
				    <div class="form-group col-sm-5">
						  <label class="control-label">현재 이메일 전송 시간</label>
						  <div class="input-group">
						    <input class="form-control input-sm" type="text" id="reservationEmailTime" disabled="" value="${settingValue.SET_EMAIL_TIME}분">
						  </div>
					</div>
					
					<div class="form-group col-sm-5">
						  <label class="control-label">변경 이메일 전송시간</label>
						  <div class="input-group">
						    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
						    <input class="form-control input-sm" type="text" id="changeReservationEmailTime">
						  </div>
					</div>
					
					<div class="col-sm-2" style="margin-top:25px">
						  <a href="#" class="btn btn-primary btn-sm" onclick="reservationEmailTimeBtn()">변경</a>
					</div>
				  </div>
				</div>
			</div>
			
			<div>
				<div class="col-lg-6">
					<div class="panel panel-default">
					  <div class="panel-heading">No Show 미준수 횟수</div>
					  <div class="panel-body">
					    <div class="form-group col-sm-5">
							  <label class="control-label">현재 NoShow 미준수 횟수</label>
							  <div class="input-group">
							    <input class="form-control input-sm" type="text" id="reservationNoShowCount()" disabled="" value="${settingValue.SET_NO_SHOW_COUNT}번">							  
							    </div>
						</div>
						
						<div class="form-group col-sm-5">
							  <label class="control-label">변경 NoShow 미준수 횟수</label>
							  <div class="input-group">
							    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
							    <input class="form-control input-sm" type="text" id="changeReservationNoShowCount">
							  </div>
						</div>
						
						<div class="col-sm-2" style="margin-top:25px">
							  <a href="#" class="btn btn-primary btn-sm" onclick="reservationNoShowCountBtn()">변경</a>
						</div>
					  </div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="panel panel-default">
					  <div class="panel-heading">No Show 회원 정지</div>
					  <div class="panel-body">
					    <div class="form-group col-sm-5">
							  <label class="control-label">현재 정지 일</label>
							  <div class="input-group">
							    <input class="form-control input-sm" type="text" id="reservationNoShowBanDay" disabled="" value="${settingValue.SET_NO_SHOW_BAN_DAY}일">							  
							   </div>
						</div>
												
						<div class="form-group col-sm-5">
							  <label class="control-label">변경 정지 일</label>
							  <div class="input-group">
							    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
							    <input class="form-control input-sm" type="text" id="changeReservationNoShowBanDay">
							  </div>
						</div>
						
						<div class="col-sm-2" style="margin-top:25px">
							  <a href="#" class="btn btn-primary btn-sm" onclick="reservationNoShowBanDayBtn()">변경</a>
						</div>
					  </div>
					</div>
				</div>
			
				<div class="col-lg-6" >
					<div class="panel panel-default">
					  <div class="panel-heading">독점방지</div>
					  <div class="panel-body">
					    <div class="form-group col-sm-5">
							  <label class="control-label">현재 독점방지 시간</label>
							  <div class="input-group" disabled="">
							    <input class="form-control input-sm" type="text" id="reservationMaxMonopoly" disabled="" value="${settingValue.SET_REV_MAX_MONOPOLY}시간">							  </div>
						</div>
						
						<div class="form-group col-sm-5" >
							  <label class="control-label">변경 독점방지 기간</label>
							  <div class="input-group">
							    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
							    <input class="form-control input-sm" type="text" id="ChangeReservationMaxMonopoly" onKeyPress="return numkeyCheck(event)">
							  </div>
						</div>
						
						<div class="col-sm-2" style="margin-top:25px">
							  <Button type="button" class="btn btn-primary btn-sm" onclick="reservationMaxMonopolyBtn()">변경</Button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-6" >
					<div class="panel panel-default">
					  <div class="panel-heading">새로고침</div>
					  <div class="panel-body">
					    <div class="form-group col-sm-5">
							  <label class="control-label">현재 새로고침 시간</label>
							  <div class="input-group" disabled="">
							    <input class="form-control input-sm" type="text" id="refreshTime" disabled="" value="${settingValue.SET_INDEX_REFRESH}초">							  </div>
						</div>
						
						<div class="form-group col-sm-5" >
							  <label class="control-label">변경 새로고침 시간</label>
							  <div class="input-group">
							    <span class="input-group-addon input-sm"><i class="fa fa-calendar-check-o"></i></span>
							    <input class="form-control input-sm" type="text" id="changeRefreshTime" onKeyPress="return numkeyCheck(event)">
							  </div>
						</div>
						
						<div class="col-sm-2" style="margin-top:25px">
							  <Button type="button" class="btn btn-primary btn-sm" onclick="refreshTimeBtn()">변경</Button>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<form action="" id="settingSubmitForm">
		<input type="hidden" id="selectSetting" name="selectSetting">
		<input type="hidden" id="settingValue" name="settingValue">
	</form>

	<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">

var pwSameCheckVal = false;
var emailSameCheckVal = false;

function numkeyCheck(e) { 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true; 
	else return false; 
}

function checkMonth(value){
	if(value<1 || value>12)
		return false;
	else
		return true;
}

function checkDay(value){
	if(value<1 || value>365)
		return false;
	else
		return true;
}

function checkHour(value){
	if(value<1 || value>24)
		return false;
	else
		return true;
}

function checkMin(value){
	if(value<1 || value>60)
		return false;
	else
		return true; 
}

	function refreshTimeBtn() {

		var confirmCheck = confirm("새로고침 시간을 변경하시겠습니까?");
		if (confirmCheck == true) {
			$("#selectSetting").val("SET_INDEX_REFRESH");
			var changeValue = $("#changeRefreshTime").val();

			$("#settingValue").val(changeValue);
			settingSubmit();
		}

	}

	function reservationMaxMonopolyBtn() {

		var confirmCheck = confirm("독점예약 시간을 변경하시겠습니까?");
		if (confirmCheck == true) {
			$("#selectSetting").val("SET_REV_MAX_MONOPOLY");
			var changeValue = $("#ChangeReservationMaxMonopoly").val();

			if (checkHour(changeValue) == true) {
				$("#settingValue").val(changeValue);
				settingSubmit();
			} else {
				alert("잘못된 입력");
			}
		}
	}

	function reservationNoShowBanDayBtn() {

		var confirmCheck = confirm("노쇼 회원 정지일 수를 변경하시겠습니까?");
		if (confirmCheck == true) {
			$("#selectSetting").val("SET_NO_SHOW_BAN_DAY");
			var changeValue = $("#changeReservationNoShowBanDay").val();

			if (checkDay(changeValue) == true) {
				$("#settingValue").val(changeValue);
				settingSubmit();
			} else {
				alert("잘못된 입력");
			}
		}
	}

	function reservationNoShowCountBtn() {

		var confirmCheck = confirm("노쇼 미준수 횟수를 변경하시겠습니까?");
		if (confirmCheck == true) {
			$("#selectSetting").val("SET_NO_SHOW_COUNT");
			var changeValue = $("#changeReservationNoShowCount").val();
			$("#settingValue").val(changeValue);
			settingSubmit();
		}
	}

	function reservationEmailTimeBtn() {

		var confirmCheck = confirm("이메일 예약 전송시간을 변경하시겠습니까?");

		if (confirmCheck == true) {
			$("#selectSetting").val("SET_EMAIL_TIME");
			var changeValue = $("#changeReservationEmailTime").val();

			if (checkMin(changeValue) == true) {
				$("#settingValue").val(changeValue);
				settingSubmit();
			} else {
				alert("잘못된 입력");
			}
		}
	}

	function reservationMaxMonthBtn() {

		var confirmCheck = confirm("예약가능기간을 변경하시겠습니까?");

		if (confirmCheck == true) {
			$("#selectSetting").val("SET_REV_MAX_MONTH");
			var changeValue = $("#changeReservationMaxMonth").val();

			if (checkMonth(changeValue) == true) {
				$("#settingValue").val(changeValue);
				settingSubmit();
			} else {
				alert("잘못된 입력");
			}
		}

	}

	function settingSubmit() {
		$.ajax({
			url : "/AdminManagement/SettingSubmit",
			dataType : "text",
			async : false,
			type : "POST",
			data : $('#settingSubmitForm').serializeArray(),
			success : function(data) {
				$("#ddddd").load(window.location.href + " #ddddd");
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}

	function pwSameCheck() {
		var pw = $("#changePw").val();
		var pwCheck = $("#changePwCheck").val();

		if (pw != pwCheck) {
			$("#pwDescription").text("- 비밀번호가 일치 하지 않습니다.");
			$("#pwDescription").css("color", "red");
			pwSameCheckVal = false;

		} else {
			$("#pwDescription").text("- 비밀번호가 일치 합니다.");
			$("#pwDescription").css("color", "blue");
			pwSameCheckVal = true;
		}
	}

	function emailSameCheck() {
		var email = $("#changeEmail").val();
		var emailCheck = $("#changeEmailCheck").val();

		if (email != emailCheck) {
			$("#emailDescription").text("- 이메일이 일치 하지 않습니다.");
			$("#emailDescription").css("color", "red");
			emailSameCheckVal = false;

		} else {
			$("#emailDescription").text("- 이메일이 일치 합니다.");
			$("#emailDescription").css("color", "blue");
			emailSameCheckVal = true;
		}
	}

	function changeEmailBtn() {

		var confirmCheck = confirm("이메일을 변경하시겠습니까?");

		if (confirmCheck == true) {
			var email = $("#changeEmail").val();

			if (emailSameCheckVal == false) {
				alert("이메일이 같지 않다구요!");
			} else {
				$.ajax({
					url : "/AdminManagement/EmailChange",
					dataType : "text",
					async : false,
					type : "POST",
					data : {
						"email" : email
					},
					success : function(data) {
						alert("이메일이 변경됐습니다.");
						$("#ddddd").load(window.location.href + " #ddddd");
					},
					error : function(request, status, error) {
					}
				});
			}
		}

	}

	function changePwBtn() {

		var confirmCheck = confirm("비밀번호를 변경하시겠습니까?");
		if (confirmCheck == true) {
			var pw = $("#changePw").val();

			if (pwSameCheckVal == false) {
				alert("비밀번호가 같지 않다구요!");
			} else {
				$.ajax({
					url : "/AdminManagement/PasswordChange",
					dataType : "text",
					async : false,
					type : "POST",
					data : {
						"pw" : pw
					},
					success : function(data) {
						alert("비밀번호가 변경됐습니다.");
						$("#ddddd").load(window.location.href + " #ddddd");
					},
					error : function(request, status, error) {
					}
				});
			}
		}

	}
</script>






