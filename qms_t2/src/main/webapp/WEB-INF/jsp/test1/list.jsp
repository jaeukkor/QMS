<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>사용자조회</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">

<style>
#addr {
	width: 800px;
}
</style>

<%@ include file="../layout/menu.jsp"%>

<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-16">

				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type='hidden' id='currentPage' name='currentPage' value=1>
							<table class="table table-borderless">
								<tr>
									<td style="text-align: right;" colspan="2">
										<label for="regDtFrom" class="col-form-label">등록일</label>
									</td>
									<td>
										<input type="date" class="form-control" id="regDtFrom" name="regDtFrom">
									</td>
									<td style="text-align: center;">~</td>
									<td>
										<input type="date" class="form-control" id="regDtTo" name="regDtTo">
									</td>
									<td style="text-align: right;" colspan="2">
										<label for="userName" class="col-form-label">사용자명</label>
									</td>
									<td>
										<input type="text" class="form-control" id="userName" name="userName">
									</td>
									<td style="text-align: right;" colspan="2">
										<label for="leaveYn" class="col-form-label">퇴사여부</label>
									</td>
									<td>
										<select class="form-control" id="leaveYn" name="leaveYn">
											<option value="">선택하세요</option>
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</td>
									<td colspan="3" style="text-align: left;">
										<button type="button" class="btn btn-info" onclick="userSearch();">조회</button>
										<button type="button" class="btn btn-info" onclick="displayModal(0);">신규</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="listTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">사용자ID</th>
									<th scope="col">사용자명</th>
									<th scope="col">부서</th>
									<th scope="col">직위</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">퇴사여부</th>
									<th scope="col">퇴사일</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="userPaging">

							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>

</main>
<%@ include file="../layout/footer.jsp"%>

<div class="modal fade" id="modalInfo" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">거래처 등록/수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="dataform">
					<input type="hidden" id="miutype" name="iutype">
					<table class="table table-hover" id="modalDetailTable">
						<thead>
							<tr>
								<th scope="row">사용자ID</th>
								<td colspan="2">
									<input type="text" class="form-control" id="muserId" name="userId" onblur="chkId()" style="width: 100%;">
									<div id="userIdChkMessage"></div>
								</td>
								<th scope="row">사용자명</th>
								<td colspan="2">
									<input type="text" class="form-control" id="muserName" name="userName" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td colspan="2">
									<input type="password" class="form-control" id="muserPwd" name="userPwd" onblur="comparePasswords()" style="width: 100%;">
								</td>
								<th scope="row">비밀번호 확인</th>
								<td colspan="2">
									<input type="password" class="form-control" id="mchkUserPwd" onblur="comparePasswords()" style="width: 100%;">
									<div id="passwordMatchMessage"></div>
								</td>
							</tr>
							<tr>
								<th scope="row">직위</th>
								<td colspan="2">
									<select class="form-control" id="mpositionCd" name="positionCd" style="width: 100%;">
										<option value="">선택하세요</option>
										<option value="01">대표</option>
										<option value="02">이사</option>
										<option value="03">부장</option>
										<option value="04">과장</option>
										<option value="05">대리</option>
										<option value="06">사원</option>
									</select>
								</td>
								<th scope="row">부서</th>
								<td colspan="5">
									<select class="form-control" id="mdeptCd" name="deptCd" style="width: 100%;">
										<option value="">선택하세요</option>
										<option value="D000">사업본부</option>
										<option value="D010">관리부</option>
										<option value="D011">총무과</option>
										<option value="D012">경리과</option>
										<option value="D020">기술부</option>
										<option value="D021">개발과</option>
										<option value="D030">생산부</option>
										<option value="D031">생산1과</option>
										<option value="D032">생산2과</option>
										<option value="D040">영업부</option>
										<option value="D041">국내영업과</option>
										<option value="D042">해외영업과</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td colspan="2">
									<input type="text" class="form-control" id="mphone" name="phone" style="width: 100%;">
								</td>
								<th scope="row">이메일</th>
								<td colspan="2">
									<input type="email" class="form-control" id="memail" name="email" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<th scope="row">퇴사여부</th>
								<td colspan="2">
									<select class="form-control" id="mleaveYn" name="leaveYn" onchange="changeYn(this)" style="width: 100%;">
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
								<th scope="row">퇴사일</th>
								<td colspan="2">
									<input type="date" class="form-control" id="mleaveDt" name="leaveDt" style="width: 100%;">
								</td>
							</tr>
						</thead>
					</table>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary" id="newSaveBtn" onclick="saveUser(1)">신규저장</button>
						<button type="button" class="btn btn-primary" id="UpdSaveBtn" onclick="saveUser(0)">수정저장</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<form id="hiddenform">
	<input type="text" id="huserId" name="userId" value="">
</form>
<!-- End Vertically centered Modal-->
<script src="/assets/js/paging.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>
<script>
	var idValid = true;
	var pwdValid = true;
	var ynValid = true;

	function userSearch(pno) {
		if (pno == undefined) {
			$('#currentPage').val(1);
		} else {
			$('#currentPage').val(pno);
		}
		call_server(searchform, '/test1/userSearchlist', userSearchlist);
	}

	function userSearchlist(vo) {
		list = vo.userlist;
		$('#listTable > tbody').empty();
		for (var i = 0; i < list.length; i++) {
			str = "<tr onclick=\"displayModal('" + list[i].userId
					+ "');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"
					+ ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1))
					+ "</th>";
			str += "<td>" + list[i].userId + "</td>";
			str += "<td>" + list[i].userName + "</td>";
			str += "<td>" + list[i].deptName + "</td>";
			str += "<td>" + list[i].comName + "</td>";
			str += "<td>" + list[i].phone + "</td>";
			str += "<td>" + list[i].email + "</td>";
			str += "<td>" + list[i].leaveYn + "</td>";
			str += "<td>" + list[i].leaveDt + "</td>";
			str += "<td>" + list[i].regDt + "</td>";
			str += "</tr>";
			$('#listTable').append(str);
		}
		setPaging(userPaging, vo.startPage, vo.endPage, 'userSearch');
	}

	function displayModal(userId) {//0이면 신규버튼으로 여는 모달 그 외에는 상품디테일모달
		$('#dataform')[0].reset();
		$('#userIdChkMessage').text('');
		$('#passwordMatchMessage').text('');
		if (userId != '') {
			$("#UpdSaveBtn").show();
			$("#newSaveBtn").hide();
			$("#muserId").prop("readonly", true);
			$("#huserId").val(userId);
			call_server(hiddenform, '/test1/getUserDtlData', getUserDtlData);
		} else {
			$("#newSaveBtn").show();
			$("#UpdSaveBtn").hide();
			$("#mleaveYn").val("N");
			$('#mleaveYn').val('N').prop('disabled', true);
			$('#mleaveDt').prop('disabled', true);
			$("#muserId").prop("readonly", false);
			$('#modalInfo').modal('show');
		}
	}

	function getUserDtlData(vo) {
		$("#muserId").val(vo.userId);
		$("#muserName").val(vo.userName);
		$("#mdeptCd").val(vo.deptCd);
		$("#mpositionCd").val(vo.positionCd);
		$("#mphone").val(vo.phone);
		$("#memail").val(vo.email);
		$("#mleaveYn").val(vo.leaveYn);
		$("#mleaveDt").val(vo.leaveDt);
		if (vo.leaveYn == "N") {
			$('#mleaveYn').prop('disabled', false);
			$('#mleaveDt').prop('disabled', true);
		}
		pwdValid = true;
		$('#modalInfo').modal('show');
	}

	function saveUser(no) {
		var valid = true;
		
		if (no == 0) {
		    idValid = true;
		    if ($('#muserPwd').val() == '' && $('#mchkUserPwd').val() == '') {
		        pwdValid = true;
		    }
		    
		  if ($('#mleaveYn').val() == 'Y' && $('#mleaveDt').val() == '') {
		        ynValid = false;
		    }else{
		    	ynValid = true;
		    }
		} else {
		    ynValid = true;
		}

		$('#dataform input[type="text"],input[type="email"], #dataform select')
				.each(function() {
					var value = $(this).val().trim();
					if (value == '' || value == null) {
						valid = false; // 'Valid'를 'valid'로 수정
						return false;
					}
				});

		if (idValid == false) {
			alert("유저ID를 다시 입력해주세요.");
			return false;
		}
		if (pwdValid  == false) {
			alert("비밀번호를 다시 입력해주세요.");
			return false;
		}
		if (ynValid  == false) {
			alert("퇴사일을 입력해주세요.");
			return false;
		}

		if (valid) {
			if (no == 0) {
				call_server(dataform, '/test1/updateUserdata', complete);
			} else {
				call_server(dataform, '/test1/insertNewUserdata', complete);
			}
		} else {
			alert("모든 필드를 입력해주세요.");
		}
	}

	function complete(vo) {
		alert(vo.msg);
		$('#modalInfo').modal('hide');
		userSearch();
	}

	function chkId() {
		call_server(dataform, '/test1/chkId', result);
	}

	function result(vo) {
		var id = $('#muserId').val();
		if (id == '') {
			$('#userIdChkMessage').text('ID를 입력해주세요.').css('color', 'red');
			idValid = false;
		} else if (vo.result == 1) {
			$('#userIdChkMessage').text('사용가능한 유저ID입니다.').css('color', 'green');
			idValid = true; // var 키워드를 제거하고 기존 변수를 사용
		} else {
			$('#userIdChkMessage').text('이미 사용중인 유저ID입니다.').css('color', 'red');
			idValid = false; // var 키워드를 제거하고 기존 변수를 사용
		}
	}

	function comparePasswords() {
		var password = $('#muserPwd').val();
		var confirmPassword = $('#mchkUserPwd').val();
		if (password === confirmPassword && password != '') {
			$('#passwordMatchMessage').text('비밀번호가 일치합니다')
					.css('color', 'green');
			pwdValid = true; // var 키워드를 제거하고 기존 변수를 사용
		} else {
			$('#passwordMatchMessage').text('비밀번호가 일치하지 않습니다').css('color',
					'red');
			pwdValid = false; // var 키워드를 제거하고 기존 변수를 사용
		}
	}

	function changeYn(obj) {
		if ($(obj).val() == "Y") {
			$('#mleaveDt').prop('disabled', false);
			var ynValid = false;
		} else {
			$('#mleaveDt').prop('disabled', true);
		}
	}
</script>