<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>제품 조회</title>
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
											<th>품번</th>
											<td><input type='text' id="itemCd" name="itemCd"></td>
											
											<th>품명</th>
											<td><input type='text' id="itemName" name="itemName"></td>
											
											<th>제품유형</th>
											<td>
												<select id="itemType" name="itemType">
												<option value="">선택</option>
												</select>
											</td>
											
										<td rowspan="1">
											<button type="button" class="btn btn-info" onclick="oSearch(1);">조회
											</button>
											<button type="button" class="btn btn-info" onclick="regNewItem();">신규
											</button>
											<button type="button" class="btn btn-info" id="mthProExcel">엑셀
											</button>
										</td>
								</tr>

							</table>

						</form>

					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="boardTable">
							<thead>
							<tr>
								<td>NO</td>
								<td>품목코드</td>
								<td>품목명</td>
								<td>단위</td>
								<td>생산라인</td>
								<td>BOX 규격</td>
								<td>재고위치</td>
								<td>등록일</td>
								
							</thead>
							
							<tbody>
							
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="itemPaging">

							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>

	
	<div class="modal fade" id="itemDetailModal" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<strong>제품등록/수정</strong>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="dataform">
				<input type='text' id='textt' name='textt'>
					<table class="table table-hover" id="itemDetailTable">
						<thead>
							<tr>
								<th scope="row">품번</th>
								<td><input type="text" class="form-control" id="mitemCd" name="itemCd" maxlength="20"></td>
								<th scope="row">품명</th>
								<td><input type="text" class="form-control" id="mitemName" name="itemName"></td>
							</tr>
							
							<tr>
								<th scope="row">제품유형</th>
								<td><select class="form-control" id="mitemType" name="itemType">
										<option value=''>선택</option>
								</select></td>
								<th scope="row">제품단위</th>
								<td><select class="form-control" id="munitType" name="unitType">
										<option value=''>선택</option>
								</select></td>
							</tr>
							
							<tr>
								<th scope="row">HSCODE</th>
								<td><input type="text" class="form-control" id="mhscode" name="hscode"></td>
								<th scope="row">BOX 규격</th>
								<td><select class="form-control" id="mboxType" name="boxType">
										<option value=''>선택</option>
								</select></td>
							</tr>
							
							<tr>
								<th scope="row">무게(g)</th>
								<td><input type="text" class="form-control" id="mweight" name="weight"></td>
								<th scope="row">BOX 수량</th>
								<td><input type="text" class="form-control" id="mboxQty" name="boxQty"></td>
							</tr>
							
							<tr>
								<th scope="row">생산라인</th>
								<td><select class="form-control" id="mplantLine" name="plantLine">
										<option value=''>선택</option>
								</select></td>
								<th scope="row">단가</th>
								<td><input type="text" class="form-control" id="munitPrice" name="unitPrice"></td>
							</tr>
							
							<tr>
								<th scope="row">재고위치</th>
								<td><select class="form-control" id="mlocation" name="location">
										<option value=''>선택</option>
								</select></td>
								<th scope="row">하도급여부</th>
								<td>
									<div class="form-check">
										<input type="checkbox" class="form-check-input" id="msubconYn"> 
										<label class="form-check-label" for="subconYn"></label>
										<input type="hidden" id="hsubconYn" name="subconYn" value="N">
									</div>
								</td>
						</thead>
						<tbody>
							<!-- DB 데이터 뿌려주는 부분 -->
						</tbody>
					</table>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="newSaveBtn" onclick="saveItem(1)">저장</button>
				<button type="button" class="btn btn-primary" id="UpdSaveBtn" onclick="saveItem(0)">저장</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<form id ='hiddenform'>

</form>
</main>	

<script src="/assets/js/paging.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

<script>
		function init(){
			
			call_server(searchform,'/myOrder/iinit',iinit);
		}
		
		init();
		
		function iinit(list){
			console.log(list);
			
			for(var i=0; i<list.length; i++){
				if(list[i].comGrpCd == "IT01"){
					str = "<option value = '"+list[i].comCd+"'>"+list[i].comName+"</option>";
					$('#mitemType').append(str);
					$('#itemType').append(str);
				}else if(list[i].comGrpCd == "IT02"){
					str = "<option value = '"+list[i].comCd+"'>"+list[i].comName+"</option>";
					$('#munitType').append(str);
				}else if(list[i].comGrpCd == "IT03"){
					str = "<option value = '"+list[i].comCd+"'>"+list[i].comName+"</option>";
					$('#mboxType').append(str);
				}else if(list[i].comGrpCd == "IT04"){
					str = "<option value = '"+list[i].comCd+"'>"+list[i].comName+"</option>";
					$('#mplantLine').append(str);
				}else if(list[i].comGrpCd == "IT05"){
					str = "<option value = '"+list[i].comCd+"'>"+list[i].comName+"</option>";
					$('#mlocation').append(str);
				}	
			}	
			
		}
//=======================================================================셀렉트 박스 세팅
		
		function oSearch(){
			call_server(searchform,'/myOrder/searchList',searchList);
		}
		function searchList(list){
			$('#boardTable tbody').empty();
			for(var i=0; i<list.length; i++){
				str = "<tr>";
				str += "<td>"+(i+1)+"</td>";
				str += "<td onclick=\"regNewItem('"+list[i].itemCd+"');\"style= cursor:pointer;\">"+list[i].itemCd+"</td>";
				str += "<td>"+list[i].itemName+"</td>";
				str += "<td>"+list[i].unitTypeName+"</td>";
				str += "<td>"+list[i].plantLineName+"</td>";
				str += "<td>"+list[i].boxTypeName+"</td>";
				str += "<td>"+list[i].locationName+"</td>";
				str += "<td>"+list[i].regDt+"</td>";
				
				$('#boardTable tbody').append(str);
			}
		}
//=======================================================================================조회
		function regNewItem(cd){
			if(cd==null){//신규버튼
				
				$('#mitemCd').val('');
				$('#mitemName').val('');
				$('#mhscode').val('');
				$('#mweight').val('');
				$('#mboxQty').val('');
				$('#munithPrice').val('');
				$('#textt').val("I");
				$('#itemDetailModal').modal('show');
				
			}else{//아이템코드 누를때
				$('#mitemCd').val('');
				$('#mitemName').val('');
				$('#mhscode').val('');
				$('#mweight').val('');
				$('#mboxQty').val('');
				$('#munithPrice').val('');
				$('#mitemCd').val(cd);
				$('#textt').val("U");
				$('#itemDetailModal').modal('show');
				
				call_server(dataform,'/myOrder/searchList',choiceItem);
			}
			
			
		}
		function choiceItem(list){
			$('#mitemCd').val('');
			$('#mitemName').val('');
			$('#mhscode').val('');
			$('#mweight').val('');
			$('#mboxQty').val('');
			$('#munithPrice').val('');
			console.log(list);
			$('#mitemName').val(list[0].itemName);
			$('#mhscode').val(list[0].hscode);
			$('#mweight').val(list[0].weight);
			$('#mboxQty').val(list[0].boxQty);
			$('#munitPrice').val(list[0].unitPrice);
			
			$('#mitemType').val(list[0].comCd);
			$('#munitType').val(list[0].unitType);
			$('#mboxType').val(list[0].boxType);
			$('#mplantLine').val(list[0].plantLine);
			$('#mlocation').val(list[0].location);
			
			$('#itemDetailModal').modal('show');
		}
		

//======================================================================================모달
	$(document).ready(function() {
		$('#mthProExcel').click(function() {
		excelDownload( searchform, '/mthProExcel/excelDownload', 'monthlyProduct.xlsx');
			});
		});
///===================================================================================== 엑셀	
</script>