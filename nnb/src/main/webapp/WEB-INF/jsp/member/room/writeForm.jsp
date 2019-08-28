<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/room.css'/>" />
<script type="text/javascript">
function calculator1(chk){
	  if(chk==1){ 
		  document.getElementById('sup_m').value = (parseFloat(document.getElementById('sup_p').value) * 3.3058).toFixed(2);       
	  }
	  else { 
		  document.getElementById('sup_p').value = (parseFloat(document.getElementById('sup_m').value) / 3.3058).toFixed(2);
	  }
}
function calculator2(chk){
	  if(chk==1){ 
		  document.getElementById('real_m').value = (parseFloat(document.getElementById('real_p').value) * 3.3058).toFixed(2);       
	  }
	  else { 
		  document.getElementById('real_p').value = (parseFloat(document.getElementById('real_m').value) / 3.3058).toFixed(2);
	  }
}
$(document).ready(function(){
	$('#awrite').addClass('active');
	$('tr.bt').hide();
	var trbt = document.getElementById("bt");
	var tdbd = document.getElementById("building");
	var tdbo = document.getElementById("building_office");
	$('input:radio[name=ROOM_TYPE]').on("change",function(){
		if($('input:radio[name=ROOM_TYPE]:checked').val()=='원룸'||
				$('input:radio[name=ROOM_TYPE]:checked').val()=='투룸'||
				$('input:radio[name=ROOM_TYPE]:checked').val()=='쓰리룸'){
			$('tr.bt').show();
			$('td.bt').hide();
			$('td#building').show();
		}else if($('input:radio[name=ROOM_TYPE]:checked').val()=='오피스텔'){
			$('tr.bt').show();
			$('td.bt').hide();
			$('td#building_office').show();
		}else if($('input:radio[name=ROOM_TYPE]:checked').val()=='아파트'){
			$('tr.bt').hide();
			$('input:radio[name=ROOM_TYPE]:checked').val('아파트');
		}
	});
	$('tr.trpay').hide();
	$('input:radio[name=TRADE_TYPE]').on("change",function(){
		if($('input:radio[name=TRADE_TYPE]:checked').val()=="월세"){
			$('tr.trpay').show();
			$('td#jeonse').hide();
			$('td#monthly').show();
		}else if($('input:radio[name=TRADE_TYPE]:checked').val()=="전세"){
			$('tr.trpay').show();
			$('td#monthly').hide();
			$('td#jeonse').show();
		}
	});
	
	$('input:radio[name=UTILITY_CHECK]').on("change",function(){
		if($('input:radio[name=UTILITY_CHECK]:checked').val()=="0"){
			$('input:text[name=UTILITY_PRICE]').attr("disabled",true);
		}else if($('input:radio[name=UTILITY_CHECK]:checked').val()=="1"){
			$('input:text[name=UTILITY_PRICE]').attr("disabled",false);
		}
	});
	
	$('input:radio[name=PARKING]').on("change",function(){
		if($('input:radio[name=PARKING]:checked').val()=="0"){
			$('input:text[name=PARKING_BILL]').attr("disabled",true);
		}else if($('input:radio[name=PARKING]:checked').val()=="1"){
			$('input:text[name=PARKING_BILL]').attr("disabled",false);
		}
	});
	

});
/* 건물 유형에 따라 선택 옵션 달라지게 */
/* 주소 API */
/* 전세/월세 선택하면 금액입력 창 뜨게 */
/* div 선택하면 라디오 체크되고 div 스타일 바뀜 */
/* 관리비 있음 누르면 UTILITY_PRICE 보이게 */
/* div 선택하면 체크박스 체크되고 div 스타일 바뀜 */
/* 주차여부 1이면 주차금액 변경불가에서 변경가능으로 바뀌게 */
/* 주차여부 0이면 주차금액 변경가능에서 변경불가로 바뀌고 밸류 삭제 */
/* 파일 등록할 때 이미지 파일만 등록되게 가능한가? 물론 가능하겠지.. */
   var gfv_count = 1;
    var mem = sessionStorage.getItem("MEM_ID");
   function addFile(){
      var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
      $("#fileDiv").append(str);
      $("a[name='delete']").on("click",function(e){
         e.preventDefault();
         fn_deleteFile($(this));
      });
   };/* 흔한개발자 코드 그대로 긁어왔음 */
   function fn_deleteFile(obj){
      obj.parent().remove();
   };
   $('#chkBox:checked').each(function() { 
      alert($(this).val()); 
   });

   function fsubmit(){
      str = "<input type='hidden' name='MEM_ID' value='"+mem+"'>";
      $("#frm").append(str);
      frm.submit();
   };
</script>

</head>
<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>
	<div class="roomWrite ggiCSo">
	<%@ include file="room.jspf"%>

		<div class="inform">
		<ul class="hNYyIN">
		<li>등록한 매물은 30일 동안 노출됩니다.</li>
		<li>일반 회원은 1개의 매물만 내놓을 수 있고, 직거래로 표시됩니다.</li>
		</ul>
		</div>

		<form id="frm" name="frm" enctype="multipart/form-data" action="write"
			method="post">
			<div class="table etFHhl">
				<h1 class="thead">매물 종류</h1>
				<table class="tbody">
					<colgroup><col width="150px"><col></colgroup>
					<tbody>
					<tr>
						<th class="h">종류 선택</th>
						<td class="b fNOtpc">
							<label class="bVNPCb fSFsCh ">
								<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="원룸">
								<p class="button">원룸</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="투룸">
								<p class="button">투룸</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="쓰리룸">
								<p class="button">쓰리룸</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE"
									value="오피스텔">
								<p class="button">오피스텔</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="아파트">
								<p class="button">아파트</p>
							</label>
						</td>
					</tr>
					<tr class="bt" id="bt">
						<th class="h">건물 유형</th>
						<td class="b fNOtpc bt" id="building">
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="단독주택">
								<p class="button">단독주택</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="다가구주택">
								<p class="button">다가구주택</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="빌라/연립/다세대">
								<p class="button">빌라/연립/다세대</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="상가주택">
								<p class="button">상가주택</p>
							</label>
						</td>
						<td class="b fNOtpc bt" id="building_office">
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="오피스텔">
								<p class="button">오피스텔</p>
							</label>
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
									value="도시형생활주택">
								<p class="button">도시형생활주택</p>
							</label>
						</td>
						<td class="b fNOtpc bt" id="building_apart">
							<label class="bVNPCb fSFsCh ">						
								<input type="radio" name="BUILDING_TYPE" value="아파트">
								<p class="button">아파트</p>
							</label>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------------------------- -->
			<div class="table etFHhl">
				<h1 class="thead">위치 정보<span>*등기부등본 상의 주소를 입력해 주세요.</span></h1>
				<table class="tbody">
					<colgroup><col width="150px"><col></colgroup>
					<tbody>
					<tr>
						<th class="h">주소</th>
						<td class="b dZxpBV">
							<div class="xMNKR">
								<p class="styled__Text-sc-1wmqs5y-2 dvECgk"><svg width="18" height="18" viewBox="0 0 18 18"><g fill="none" fill-rule="evenodd"><circle cx="9" cy="9" r="9" fill="#E6E7EA"></circle><path fill="#9C9EA3" d="M8.997 13.5a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5zm.01-2.499c-.634 0-.75-5.449-.75-6.001 0-.552.336-1 .75-1s.75.448.75 1-.116 6.001-.75 6.001z"></path></g></svg><span>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</span></p>
								<div class="styled__Form-sc-1wmqs5y-3 dhdAXv" id="frm_address">
									<input autocomplete="off" class="styled__Keyword-sc-1wmqs5y-4 iqNWWF Input-sfsekm-0 kTQnUD" name="keyword" placeholder="예)번동 10-1, 강북구 번동" value="">
									<button onclick="sample6_execDaumPostcode()" type="button" class="styled__SearchBtn-sc-1wmqs5y-5 hdoEbx">주소검색</button>
								</div>
								<div class="fUXvpI addressarea"></div>
								<div class="kXKUhT">
									<div class="gnEBbX">
										<input class="bVCGUR kTQnUD" type="text" name="ADDRESS2" id="sample6_address2" size="50"
										placeholder="상세주소">
									</div>
								</div>
								<input type="hidden" name="ZIPCODE" id="sample6_postcode"
									placeholder="우편번호">
								<input type="hidden" name="ADDRESS1" id="sample6_address" size="50"
									placeholder="주소">
							</div>
	
	
							<div id="map" class="kADOdT"></div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------------------------- -->

			<div class="table etFHhl">
				<h1 class="thead">거래 정보</h1>
				<table class="tbody">
					<colgroup><col width="150px"><col></colgroup>
					<tbody>
					<tr>
					<th class="h" rowspan="2">거래 종류</th>
					<td class="b fNOtpc iFmBhb">
						<label class="bVNPCb fSFsCh">
							<input type="radio" name="TRADE_TYPE" class="trade_type"
								value="월세">
							<p class="button">월세</p>
						</label>
						<label class="bVNPCb fSFsCh">
							<input type="radio" name="TRADE_TYPE" class="trade_type"
								value="전세">
							<p class="button">전세</p>
						</label>
					</td>
					</tr>
					<tr class="trpay">
					<td class="iFmBhb" id="monthly">
						<div id="monthly" class="bMtYCv">
							<p class="tmpFp">월세</p>
							<input class="fqDzuM kTQnUD" type="number" name="MONTHLY_DEPOSIT" id="deposit"
								placeholder="보증금">
							<p class="ktwJnl">/</p> 
							<input class="fqDzuM kTQnUD" type="number"
								name="MONTHLY_PAYMENT" id="pay" placeholder="월세">
							<p class="fIWZWk">
								만원
								<span>(예 월세 1000만원/50만원)</span>
							</p>
						</div>
					</td>
					<td class="iFmBhb" id="jeonse">
						<div id="jeonsediv" class="bMtYCv">
							<p class="tmpFp">전세</p>
							<input class="fqDzuM kTQnUD " type="number" name="JEONSE" id="jeonse" placeholder="전세">
							<p class="fIWZWk">
								만원
								<span>(예 전세 2000만원)</span>
							</p>
						</div>
					</td>
					</tr>
					</tbody>
				</table>
			</div>
			<!-- ---------------------------------------------------------------------------------- -->
			<div class="table etFHhl">
				<h1 class="thead">기본 정보</h1>
				<table class="tbody">
					<colgroup><col width="150px"><col width="450px"><col width="150px"><col width="430px"></colgroup>
					<tbody>
					<tr>
						<th rowspan="2" class="h"><p>건물 크기</p><span>(1P = 3.3058㎡)</span></th>
						<td class="b ggZjqG">
							<p class="hNdXGi">공급 면적 </p>
							<input class="gsCYXz kTQnUD" type="text" id="sup_p" onkeyup="calculator1(1);">
							<p class="cmXpqK">평</p>
							<input class="gsCYXz kTQnUD" type="text" name="SUPPLY_SIZE" id="sup_m" onkeyup="calculator1(2);">
							<p class="cmXpqK">m2</p>
						</td>
						<th rowspan="2">건물 층수</th>
						<td class="ggZjqG">
							<p class="hNdXGi">건물 층수 </p>
							<select class="freEbZ hRFrgm" name="BUILDING_STORY" id="building_story">
								<option>--건물 층수 선택--</option>
								<option value="0">반지층</option>]
								<option value="-1">옥탑방</option>
								<c:forEach var="i" begin="1" end="50">
									<option value="${i}">${i}층</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="ggZjqG">
							<p class="hNdXGi">전용 면적 </p>
							<input class="gsCYXz kTQnUD " type="text" id="real_p" onkeyup="calculator2(1);">
							<p class="cmXpqK">평</p>
							<input class="gsCYXz kTQnUD " type="text" name="REAL_SIZE" id="real_m" onkeyup="calculator2(2);">
							<p class="cmXpqK">m2</p>							
						</td>
						<td class="ggZjqG">
							<p class="hNdXGi">해당 층수 </p>
							<select class="freEbZ hRFrgm" name="ROOM_FLOOR" id="room_floor">
								<option>--해당 층수 선택--</option>
								<option value="0">반지층</option>
								<option value="-1">옥탑</option>
								<c:forEach var="i" begin="1" end="50">
									<option value="${i}">${i}층</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>난방 종류</th>
						<td class="ggZjqG" colspan="3">
							<select name="HEATING_SYSTEM" id="heating_system" class="iDUqOA hRFrgm ">
								<option>--난방 종류 선택--</option>
								<option value="1">중앙난방</option>
								<option value="2">개별난방</option>
								<option value="3">지역난방</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>입주 가능일</th>
						<td class="ggZjqG">
							<input class="kTQnUD" type="date" name="MOVE_IN_DATE" id="move_in_date">
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="table etFHhl">
				<h1 class="thead">추가정보</h1>
				<table class="tbody">
					<colgroup><col width="150px"><col width="450px"><col width="150px"><col width="430px"></colgroup>
					<tbody>
					<tr>
					<th rowspan="2">관리비</th>
					<td colspan="3" class="cCUCai">
						<label class="fSFsCh gBFyOc">
							<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK"
								value="0">
							<p>없음</p>
						</label>
						<label class="fSFsCh gBFyOc">
							<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK"
								value="1">
							<p>있음</p>
						</label>
						<input class="esuiyZ kTQnUD" type="text" name="UTILITY_PRICE" id="UTILITY_PRICE">
						<p class="iOAqhO">만원</p>
					</td>
					</tr>
					<tr>
					<td class="cCUCai" colspan="3">
						<div class="cdRbFB">
							<p>관리비항목</p>
							<p>(다중선택가능)</p>
						</div>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="1" name="UTILITY_TYPE">
							<p>인터넷</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="2" name="UTILITY_TYPE">
							<p>유선TV</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="3" name="UTILITY_TYPE">
							<p>청소비</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="4" name="UTILITY_TYPE">
							<p>수도세</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="5" name="UTILITY_TYPE">
							<p>도시가스</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="6" name="UTILITY_TYPE">
							<p>전기세</p>
						</label>
						<label class="hrokF cdcjQK">
							<input type="checkbox" class="UTILITY_TYPE" value="7" name="UTILITY_TYPE">
							<p>기타</p>
						</label>
					</td>
					</tr>
					<tr>
						<th>주차여부</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="PARKING" name="PARKING" value="0">
								<p>불가능</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="PARKING" name="PARKING" value="1">
								<p>가능</p>
							</label>
							<input class="esuiyZ kTQnUD" type="text" name="PARKING_BILL" id="PARKING_BILL">
							<p class="iOAqhO">만원</p>
						</td>
						
						<th>반려동물</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="PET" name="PET" value="0">
								<p>불가능</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="PET" name="PET" value="1">
								<p>가능</p>
							</label>
						</td>
					</tr>
					
					<tr>
						<th>엘리베이터</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="ELEVATOR" name="ELEVATOR" value="0">
								<p>없음</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="ELEVATOR" name="ELEVATOR" value="1">
								<p>있음</p>
							</label>
						</td>
						
						<th>베란다/발코니</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="BALCONY" name="BALCONY" value="0">
								<p>없음</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="BALCONY" name="BALCONY" value="1">
								<p>있음</p>
							</label>
						</td>
					</tr>

					<tr>
						<th>빌트인</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="BUILT_IN" name="BUILT_IN" value="0">
								<p>없음</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="BUILT_IN" name="BUILT_IN" value="1">
								<p>있음</p>
							</label>
						</td>
						
						<th>구조</th>
						<td class="cCUCai ">
							<label class="hrokF cdcjQK">
								<input class="fyqlMy cdcjQK" type="checkbox" class="STRUCTURES" value="1" name="STRUCTURES">
								<p>복층</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="fyqlMy cdcjQK" type="checkbox" class="STRUCTURES" value="2" name="STRUCTURES">
								<p>1.5룸/주방분리형</p>
							</label>
						</td>
					</tr>
					<tr>
						<th>옵션항목</th>
						<td class="cCUCai " colspan="3">
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="OPTIONS" value="1" name="OPTIONS">
								<p>에어컨</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="2" name="OPTIONS">
								<p>세탁기</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="3" name="OPTIONS">
								<p>침대</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="4" name="OPTIONS">
								<p>책상</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="5" name="OPTIONS">
								<p>옷장</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="6" name="OPTIONS">
								<p>TV</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="7" name="OPTIONS">
								<p>신발장</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="8" name="OPTIONS">
								<p>냉장고</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="9" name="OPTIONS">
								<p>가스레인지</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="10" name="OPTIONS">
								<p>인덕션</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="11" name="OPTIONS">
								<p>전자레인지</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="12" name="OPTIONS">
								<p>전자도어락</p>
							</label>
							<label class="hrokF cdcjQK">
								<input class="hrokF cdcjQK" type="checkbox" class="STRUCTURES" value="13" name="OPTIONS">
								<p>비데</p>
							</label>
						</td>
					</tr>
					<tr>
						<th>전세자금대출</th>
						<td class="cCUCai ">
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="0">
								<p>불가능</p>
							</label>
							<label class="gBFyOc fSFsCh">
								<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="1">
								<p>가능</p>
							</label>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="table etFHhl">
				<h1 class="thead">상세설명</h1>
				<table class="tbody">
				<colgroup><col width="150px"><col></colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td class="iXeisV">
							<input class="kTQnUD cNKZeV" type="text" name="DESC_TITLE" id="DESC_TITLE"
								placeholder="예)신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다.">
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td class="iXeisV">
							<textarea class="iePFTd hunnDM" name="DESC_DETAIL" id="DESC_DETAIL"
								placeholder="상세설명 작성 주의사항

- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다. (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)
- 중개수수료를 언급한 내용은 입력할 수 없습니다. (중개수수료 무료, 꽁짜, 반값 등)

*주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다."></textarea>
						</td>
					</tr>
					<tr>
						<th>비공개 메모</th>
						<td class="iXeisV">
							<textarea class="hunnDM fAiWMO" name="DESC_SECRET" id="DESC_SECRET"
								placeholder="외부에 공개되지 않으며, 등록자에게만 보여지는 메모입니다."></textarea>
						</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- --------------------------------------------------------------- -->
			<div class="table etFHhl">
				<h1 class="thead">사진 등록</h1>
				<div class="tbody Xyvt">
					<div class="hhdFgg">
						<p> - 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
						<p> - 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
						<p> - 사진은 최소 1장 이상 등록해야 하며, 최대 15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.</p>
					</div>
					<div class="heKOml">
						<div id="fileDiv" class="jAfNtH">
							<p>
								<input type="file" id="file" name="file_0"> 
								<a href="#" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
						<div class="gpqhxG"></div>
						<button type="button" class="kkaIZb" onclick="addFile();" style="position: relative; z-index: 1;">파일 추가</button>
					</div>
					<p class="caution bhZAGT">
						<svg width="18" height="18" viewBox="0 0 18 18"><g fill="none" fill-rule="evenodd"><circle cx="9" cy="9" r="9" fill="#E6E7EA"></circle><path fill="#9C9EA3" d="M8.997 13.5a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5zm.01-2.499c-.634 0-.75-5.449-.75-6.001 0-.552.336-1 .75-1s.75.448.75 1-.116 6.001-.75 6.001z"></path></g></svg>
						<span>허위 매물을 등록할 경우 니내방에서 임의로 계정 및 매물 전체 삭제 처리됩니다.</span>
						<a href="#">허위매물 제재 정책 확인하기</a>
					</p>
				</div>
			</div>
		</form>
		<div class="check gfvOAV">
			<label class="kAqGVi">
				<input class="PcMeW" type="checkbox" id="check">
				<span class="CheckBox"></span>
				<span class="eUWDCR">
				매물관리규정을 확인하였으며, 입력한 정보는 실제
				매물과 다름이 없습니다.
				</span>
			</label>
			<button class="kcMULl" onclick="location.href=<c:url value='/room/adminRoom'/>">취소</button>
			<button class="iEZQG" onclick="fsubmit();">매물 등록</button>
		</div>
	</div>

	<div>
		<%@ include file="/WEB-INF/include/footer.jspf"%>
	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new daum.maps.Map(mapContainer, mapOption); //지도를 미리 생성

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

var geocoder = new daum.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});
function sample6_execDaumPostcode() {
	var keyword = $('input[name=keyword]').val();
    new daum.Postcode({
        oncomplete: function(data) {
            var roadaddr = data.roadAddress; // 최종 주소 변수
            var jibunaddr = data.jibunAddress; // 최종 주소 변수
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = roadaddr;
            str = "<p><span>도로명:</span>"+roadaddr+"</p>"
            	+ "<p><span>지번:</span>"+jibunaddr+"</p>";
            $(".addressarea").html(str);
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open({
    	q: keyword
    });
}


</script>
</body>
</html>