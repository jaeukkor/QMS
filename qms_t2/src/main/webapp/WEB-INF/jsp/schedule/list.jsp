<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>일정 조회</title>
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

<%@ include file="../layout/menu.jsp"%>

<main id="main" class="main">

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type='hidden' id='currentPage' name='currentPage' value=1>
							<table class="col-lg-12">
								<tr>
									<td style=  "text-align: right;">
											<th>년월</th>
											<td style="padding-left: 40px;"><select class="form-control" style="width: 90px; height: 40px;" id="scheYear" name="scheYear">
												<option value=''>==년==</option>
											</select></td>
											<td style="padding-left: 40px;"><select class="form-control" style="width: 90px; height: 40px;" id="scheMonth" name="scheMonth">
												<option value=''>==월==</option>
												<option value='01'>01</option>
												<option value='02'>02</option>
												<option value='03'>03</option>
												<option value='04'>04</option>
												<option value='05'>05</option>
												<option value='06'>06</option>
												<option value='07'>07</option>
												<option value='08'>08</option>
												<option value='09'>09</option>
												<option value='10'>10</option>
												<option value='11'>11</option>
												<option value='12'>12</option>
											</select></td>

										<td rowspan="1">
											<button type="button" class="btn btn-info" onclick="sSearch();">조회
											</button>
										</td>
								</tr>

							</table>
						<input type ='hidden' id="scheD" name="scheD">
						</form>

					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="boardTable">
							<thead>
							<tr>
								<th style="width:14%">일</th>
								<th style="width:14%">월</th>
								<th style="width:14%">화</th>
								<th style="width:14%">수</th>
								<th style="width:14%">목</th>
								<th style="width:14%">금</th>
								<th style="width:14%">토</th>
							</tr>	
							</thead>
							
							<tbody>
							
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="mthProPaging">

							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="modal fade" id="scheduleModal" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<form id="modalform">
			<input type="hidden" id="iutype" name="iutype">
				<table class="table table-hover" id="scheDetailTable">
					<thead>
					<tr>
						<td>일자</td>
						<td>
							<input type="date" class="form-control" id="scheDt" name="scheDt"  width="300px">
						</td>
						
						<td  colspan='5' style="text-align: right;">
							<button type="button" class="btn btn-primary" onclick="searchit();">조회</button>
							<button type="button" class="btn btn-info" onclick="itemUpDate();">저장</button>
						</td>
					</tr>
					<tr>
						<td>상세일정</td>
						<td colspan='5' style="text-align: right;">
     					 <button type="button" class="btn btn-primary" onclick="addButton()">+</button>
   						 </td>
					</tr>
					
						<tr>
							<th scope="row" colspan='3'>시작일시</th>
							<th scope="row" colspan='3'>종료일시</th>
							<th scope="row">일정</th>
							<th scope="row">상태</th>
							<th scope="row">삭제</th>
						</tr>
						
					</thead>
						<tbody>
						</tbody>
					</table>
					<table class="table table-hover" id="BomSelectT">
					<tbody>
					
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
	
	
</main>
<script src="/assets/js/paging.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
		var now = new Date(); // 현재 날짜
		var year = now.getFullYear(); //현재 년도
		var month = now.getMonth()+1; //현재 월
		var day = now.getDay();//현재 요일에 해당하는 숫자
		var baseYear = ${baseYear}; // constant에서 가져온baseYear
		
		
		
		for(var i=baseYear; i<=year; i++){
			$('#scheYear').append("<option value='"+i+"'>"+i+"</option>"); // 헤더부분 셀렉단
		}
		if(month<10){
			$('#scheMonth').val('0'+month); //헤더부분 현재년월로 세팅
		}else{
			$('#scheMonth').val(month); //헤더부분 현재년월로 세팅
		}
		
		$('#scheYear').val(year);
		
		function sSearch(){
			
			call_server(searchform, '/schedule/sche', sche);
		}	
		
		function sche(list){
			console.log(list);
			
			$('#boardTable tbody').empty();
			var year  = Number($('#scheYear').val()); 
			var month = Number($('#scheMonth').val());         
			var nowDate = new Date(year, month-1, 1);   //해당 달의 1일의 정보들
			var firstDay = nowDate.getDay();  //해당 달의 1일에 해당하는 요일의 숫자
			var lastDate = new Date(year, month, 0).getDate(); //해당 달의 마지막 일
			   
			//var monthSWeek = nowDate.getDay(); //해당 달의 1일에 해당하는 요일의 숫자
			//var weekSeq = parseInt((parseInt(lastDate) + monthSWeek - 1)/7) + 1; //해당달의 주의 수
			var weekSeq = parseInt((parseInt(lastDate) + firstDay - 1)/7) + 1; //해당달의 주의 수
			
			console.log("주의 개수:"+ weekSeq);
			
			var day =1;
			for(var i=0;i<weekSeq;i++){
				str="<tr>";
				for(var j=0;j<=6;j++){
					if(i==0){
						if(firstDay>j){
							str+="<td></td>";
						}else{
							str += "<td onclick=\"scheDetail("+day+");\"  height=\"100px;\" style=\"cursor:pointer;\">"+day+getTitle(list, day)+"</td>";
							day++;
						}
					}else{
						if(day>lastDate){
							str+="<td></td>";
						}else{
							str += "<td onclick=\"scheDetail("+day+");\" height=\"100px; style=\"cursor:pointer;\">"+day+getTitle(list, day)+"</td>";
							day++;
						}
					}
				}
						str+="</tr>";
						$('#boardTable tbody').append(str);
			}
			
		}
		function scheDetail(day){ //모달창
			$('#scheD').val(day);
			if(Number($('#scheD').val()) <10){
				day="0"+day; 
			}
			//alert($('#scheYear').val()+"-"+$('#scheMonth').val()+"-"+day); //2024-07-15
			$('#scheDt').val($('#scheYear').val()+"-"+$('#scheMonth').val()+"-"+day);
			
			call_server(searchform, '/schedule/scheModal', scheM);
			
			$('#scheduleModal').modal('show');
		}
		function scheM(list){
			console.log(list);
			for(var i=0; i<list.length; i++){
				
				str =  "<tr>";
				
				str += "<td>";
				str += "<div class=\"col-sm-8\">";
				str += "<input type=\"date\" class=\"form-control\" id=\"startDt\" name=\"startDt\"  width=\"300px;\" value=\""+list[i].startDt+"\">";
				str += "</div>";
				str += "</td>";
				str += "<td >";
				str += "<select class=\"form-control\" id=\"startHour\" style='width:50px;'>";
				str += "<option value=\"09\">09</option>";
				str += "</select>";
				str += "</td>";
				str += "<td>";
				str += "<select class=\"form-control\" id=\"startMin\" style='width:50px;'>";
				str += "<option value=\"00\">00</option>";
				str += "</select>";
				str += "</td>";
				str += "<td>";
				str += "<div class=\"col-sm-8\">";
				str += "<input type=\"date\" class=\"form-control\" id=\"endDt\" name=\"endDt\"  width=\"300px;\" value=\""+list[i].endDt+"\">";
				str += "</div>";
				str += "</td>";
				str += "<td>";
				str += "<select class=\"form-control\" id=\"endHour\">";
				str += "<option value=\"\"></option>";
				str += "</select>";
				str += "</td>";
				str += "<td>";
				str += "<select class=\"form-control\" id=\"endMin\">";
				str += "<option value=\"\"></option>";
				str += "</select>";
				str += "</td>";
				str += "<td><input type='text' id=\"title\" name=\"title\" value = "+list[i].title+"></td>";
				str += "<td>";
				str += "<select id = \"statusYn\">";
				str += "<option value = \"Y\" "+(list[i].statusYn=="Y"?"selected":"")+">완료</option>";
				str += "<option value = \"N\" "+(list[i].statusYn=="N"?"selected":"")+">미완료</option>";
				str += "</select>";
				str += "</td>";
				str += "<td>";
				str += "<button type='button' id=\"deleteLine();\">삭제</button>";
				str += "</td>";
				str += "</tr>";
				
				$('#scheDetailTable tbody').append(str);
			}
		}
				
		
		function getTitle(list, day){ //달력 일수 안에 타이틀 뿌려주기 
			var str="";
			for(var i=0;i<list.length;i++){
				if(list[i].startDt<=day && list[i].endDt>=day){
					str+="<br>";
					str+=list[i].title;
				}
			}
			return str;
		}		
		
		
	
		
//======================================================================= 년월 선택		
	
	
//=======================================================================================조회	
	
</script>