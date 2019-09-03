<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<div style="display:none;">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
</div>
<fmt:parseDate var="dateString" value="${room.MOVE_IN_DATE}" pattern="yyyy-MM-dd"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/detailRoom.css'/>"/>
<script type="text/javascript">
/* openlessorInfo(id): 임대인 정보보기 새창으로 /room/detail/lessorInfo */
/* report(): 신고하기 새창으로 */
/* readMore() : 상세설명 더보기 */
function readMore(obj){
	var check = obj.prev().css('height');
	if(check=='130px'){
		console.log('ddd');
		$(".cDEjhR").css({height:''});
		obj.children('span').text('접기');
		obj.children('svg').children().attr('d','M2 9l6-6 6 6');
	}else{
		$(".cDEjhR").css({height:'130px'});
		obj.children('span').text('상세설명 더보기');
		obj.children('svg').children().attr('d','M2 3l6 6 6-6');
	}
}

$(document).ready(function(){
	var roomSize = $('#room_size1')
	var currentUnit = '㎡' // P : 평, M : 제곱미터
	var hidden =$('#hidden')
	var unit = $('#unit1')
	,currentValue = hidden.val()
	,nextUnit
	,nextValue
	,conversionResult
	roomSize.text(currentValue+currentUnit)

	$('#converter').click(function(e){
		conversionResult = convertUnit(currentValue, currentUnit)
		nextUnit = conversionResult[1]
		nextValue = conversionResult[0]
		roomSize.text(nextValue+nextUnit)
		unit.text(currentUnit)
		currentUnit = nextUnit
		currentValue = nextValue
	});

	function convertUnit(value, currentUnit){
		if(currentUnit==='평'){
			return [parseFloat(value*3.3058).toFixed(2), '㎡']
		}else{
    		return [parseFloat(value/3.3058).toFixed(0), '평']
		}
	}
});

$(document).ready(function(){
	var roomSize2 = $('#room_size2')
	var roomSize3 = $('#room_size3')
	var currentUnit = '㎡' // P : 평, M : 제곱미터
	var hidden =$('#hidden')
	var hidden2 =$('#hidden2')
	var unit2 = $('#unit2')
	,currentValue2 = hidden.val()
	,currentValue3 = hidden2.val()
	,nextUnit
	,nextValue3
	,nextValue2
	,conversionResult
	roomSize2.text(currentValue2+"/")
	roomSize3.text(currentValue3+currentUnit)

	$('#converter2').click(function(e){
	  conversionResult = convertUnit(currentValue2, currentValue3, currentUnit)
	  nextUnit = conversionResult[2]
	  nextValue3 = conversionResult[1]
	  nextValue2 = conversionResult[0]
	  roomSize2.text(nextValue2+"/")
	  roomSize3.text(nextValue3+nextUnit)
	  unit2.text(currentUnit)
	  currentUnit = nextUnit
	  currentValue2 = nextValue2
	  currentValue3 = nextValue3
	});

	function convertUnit(value2, value3, currentUnit){
		if(currentUnit==='평'){
			return [parseFloat(value2*3.3058).toFixed(2), parseFloat(value3*3.3058).toFixed(2), '㎡']
		}else{
			return [parseFloat(value2/3.3058).toFixed(0), parseFloat(value3/3.3058).toFixed(0), '평']
		}
	}
});


/* 쿠키 */
$(document).ready(function(){
	$("p.dojagi").on("click",function(e){
		if($("p.dojagi path").attr("fill")=="none"){
			fn_addFav();
		}else if($("p.dojagi path").attr("fill")=="#F63C4A"){
			fn_deleteFav();
		}
	});
});

$(document).ready(function(){
	addCookie('recentRoom','${room.ROOM_NUM}');
});

</script>
</head>
<body>
<!-- 전체 -->
<div class="detailRoom dQBfA">
<!-- 헤더 -->
<%@ include file="/WEB-INF/include/header.jspf" %>

<!-- 원룸,월세,평수,찜,신고,임대인정보 -->
	<div id="detail1" class="kZTRnS">
		<div class="kBQneM">
			<!-- 정보 -->
			<ul class="ixyaqW">
				<li class="UuNuJ">
					<p class="hzbdBs"><span>${room.ROOM_TYPE}</span></p>
					<div class="dUILvV">
						<h1 class="dUuerR">
							${room.TRADE_TYPE} 
							<c:if test="${room.TRADE_TYPE=='월세'}">
							${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}
							</c:if>
							<c:if test="${room.TRADE_TYPE=='전세'}">
							${room.JEONSE}
							</c:if>
							<span class="gYSPds">만원</span>
						</h1>
					</div>
				</li>
				<li class="cqojtY">
					<p class="hzbdBs" id="real_m">전용면적</p>
					<div class="dUILvV">
						<input type="hidden" id="hidden" value="${room.REAL_SIZE}">
						<input type="hidden" id="hidden2" value="${room.SUPPLY_SIZE}">
						<h1 id="room_size1" class="dUuerR">
							
						</h1>
						<button class="ktfeIl" type="button" id="converter">
                     		<svg width="11" height="23" viewBox="0 0 11 23"><g fill="#222" fill-rule="evenodd" stroke="#222" stroke-width=".2"><path d="M8.066 8.378L6.955 9.624a.335.335 0 0 0 0 .436.26.26 0 0 0 .194.09c.07 0 .14-.03.194-.09L8.92 8.293c.054-.06.08-.14.08-.22a.32.32 0 0 0-.094-.232l-1.563-1.75a.255.255 0 0 0-.388 0 .334.334 0 0 0 0 .435l1.102 1.236h-5.49c-1.415 0-2.567 1.3-2.567 2.9v1.03c0 .17.123.308.275.308.152 0 .275-.138.275-.308v-1.03c0-1.259.905-2.284 2.018-2.284h5.498zM.934 14.622l1.11-1.246a.335.335 0 0 0 0-.436.26.26 0 0 0-.193-.09c-.07 0-.141.03-.195.09L.08 14.707a.325.325 0 0 0-.08.22.32.32 0 0 0 .093.232l1.563 1.75c.108.121.282.121.389 0a.334.334 0 0 0 0-.435L.942 15.238h5.49c1.416 0 2.567-1.3 2.567-2.9v-1.03c0-.17-.123-.308-.274-.308-.153 0-.275.138-.275.308v1.03c0 1.259-.905 2.284-2.018 2.284H.934z"></path></g></svg>
                     		<span id="unit1">평</span>
                  		</button>
						
					</div>
				</li>
				<li class="byeNFK">
					<div style="float:left;">
						<p class="hhDakc">임대인</p>
						<p class="gTIMxh">${room.MEM_ID}</p>
					</div>
					<button= class="fEkbZe" id="openLessor">
						<svg width="18" height="18" viewBox="0 0 18 18"><path fill="#222" fill-rule="evenodd" d="M4.324.404c.328.457.689.979 1.081 1.565.393.586.818 1.236 1.275 1.95.117.188.167.4.15.634a1.834 1.834 0 0 1-.256.756c-.058.117-.158.304-.299.562L5.73 6.873c.247.352.56.744.94 1.178.382.433.824.902 1.328 1.406.516.516.987.964 1.415 1.345.428.38.812.694 1.151.94.399-.234.73-.425.994-.571.263-.147.454-.25.57-.308.142-.082.285-.143.432-.184.146-.041.284-.062.413-.062a1.066 1.066 0 0 1 .545.14c.527.317 1.084.672 1.67 1.064.585.393 1.212.824 1.88 1.292.118.082.211.188.282.317.07.129.117.27.14.422.012.164-.006.33-.052.5-.047.17-.13.343-.247.52a2.446 2.446 0 0 1-.21.298 19.35 19.35 0 0 1-.335.404c-.117.153-.269.325-.457.519-.187.193-.41.407-.668.641-.246.235-.471.41-.676.528-.205.117-.384.175-.536.175h-.036a6.392 6.392 0 0 1-1.916-.395 11.957 11.957 0 0 1-2.109-1.028 19.487 19.487 0 0 1-2.32-1.67 38.968 38.968 0 0 1-2.532-2.303A34.717 34.717 0 0 1 3.085 9.51a20.91 20.91 0 0 1-1.67-2.32A11.08 11.08 0 0 1 .387 5.07C.152 4.397.023 3.761 0 3.164 0 3 .059 2.815.176 2.61c.117-.205.293-.436.527-.694.235-.258.445-.478.633-.66.187-.18.357-.33.51-.447.14-.106.275-.205.404-.3.129-.093.24-.175.334-.245.129-.094.264-.161.404-.202C3.128.02 3.281 0 3.445 0c.188 0 .355.032.501.097a.947.947 0 0 1 .378.307zm-1.145.694a8.368 8.368 0 0 0-.688.538c-.223.194-.44.397-.652.609-.212.211-.38.394-.503.546a1.349 1.349 0 0 0-.238.389c.023.529.147 1.093.37 1.693.224.6.547 1.238.97 1.914.424.676.947 1.388 1.57 2.135a35.836 35.836 0 0 0 2.17 2.355 35.836 35.836 0 0 0 2.355 2.17 19.601 19.601 0 0 0 2.135 1.57c.676.423 1.317.746 1.923.97a6.12 6.12 0 0 0 1.702.388c.082-.035.2-.118.353-.247.153-.13.335-.3.547-.512.212-.211.411-.432.6-.661.188-.23.37-.462.547-.697a.417.417 0 0 0 .07-.132.19.19 0 0 0 0-.115 71.472 71.472 0 0 0-1.879-1.288c-.57-.376-1.085-.711-1.543-1.005-.047 0-.1.009-.159.026a1.231 1.231 0 0 0-.194.08c-.094.058-.27.158-.53.3l-1.005.546-.582.353-.582-.388c-.377-.259-.791-.59-1.244-.997-.453-.405-.95-.879-1.49-1.42a40.393 40.393 0 0 1-1.394-1.49c-.4-.453-.73-.868-.988-1.244l-.423-.547.352-.617a101.22 101.22 0 0 1 .847-1.535c.035-.07.062-.135.08-.194a.559.559 0 0 0 .026-.159c-.412-.647-.803-1.252-1.173-1.817a81.447 81.447 0 0 0-1.067-1.588h-.036a.48.48 0 0 0-.132.018.407.407 0 0 0-.115.053z"></path></svg>
						<span>쪽지보내기</span>
					</button>
				</li>
			</ul>
			<div class="bbfToB">
				<p class="dojagi">
					<!-- 찜 아이콘. 빨갛게 하려면 path fill, stroke 를 #F63C4A으로 -->
					<svg width="23" height="22" viewBox="0 0 23 22">
						<c:if test="${favRoom==0}">
						<path fill="none" fill-rule="evenodd" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.5 19c.92-.7 6.89-5.628 8.41-7.623.877-1.154 1.09-2.17 1.09-3.358C21 5.247 18.776 3 16.033 3 13.32 3 11.5 5.862 11.5 5.862S9.68 3 6.967 3C4.224 3 2 5.247 2 8.019c0 1.187.213 2.204 1.09 3.358C4.61 13.372 10.58 18.3 11.5 19z"></path>
						</c:if>
						<c:if test="${favRoom==1}">
						<path fill="#F63C4A" fill-rule="evenodd" stroke="#F63C4A" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.5 19c.92-.7 6.89-5.628 8.41-7.623.877-1.154 1.09-2.17 1.09-3.358C21 5.247 18.776 3 16.033 3 13.32 3 11.5 5.862 11.5 5.862S9.68 3 6.967 3C4.224 3 2 5.247 2 8.019c0 1.187.213 2.204 1.09 3.358C4.61 13.372 10.58 18.3 11.5 19z"></path>
						</c:if>
					</svg>
					${room.FAV_COUNT}
				</p>
				<p class="fEBzAW">•</p>
				<button id="openReport" type="button" class="lhWOpc" value="평">
					<svg width="17" height="18" viewBox="0 0 17 18"><g fill="none" fill-rule="evenodd"><path stroke-width="1.2" d="M8.6.6h1v1.8h-1zM15.207 2.934l.707.707-1.273 1.273-.707-.707zM1.934 2.793l.707-.707 1.273 1.273-.707.707z"></path><path d="M3.5 17.5h10V11A4.5 4.5 0 0 0 9 6.5H8A4.5 4.5 0 0 0 3.5 11v6.5z"></path><path stroke-width="1.2" d="M.6 17.6h15.8v1H.6z"></path></g></svg>
					<span>신고하기</span>
				</button>
			</div>
		</div>
	</div>
	
	<!-- 상세정보 표. 층수, 면적, 난방, 옵션, ... -->
	<div id="detail2" class="kZTRnS">
		<div class="kBQneM">
			<ul class="iuNQqL">
				<li class="gWdVQs">
					<p class="gPsGgb">해당층/건물층</p>
					<div class="gbAeEp">
						<c:choose>
							<c:when test="${room.ROOM_FLOOR=='-1'}">
								옥탑방
							</c:when>
							<c:when test="${room.ROOM_FLOOR=='0'}">
								반지하
							</c:when>
							<c:otherwise>
								${room.ROOM_FLOOR}층
							</c:otherwise>
						</c:choose>
						/ ${room.BUILDING_STORY}층</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">전용/공급면적</p>
					<div class="gbAeEp">

						<span id="room_size2"></span>
						<span id="room_size3"></span>
						<button id="converter2" class="styled__ChangeBtn-sc-1kb7k96-7 bHPFKV">
							<svg width="11" height="23" viewBox="0 0 11 23">
							<g fill="#222" fill-rule="evenodd" stroke="#222" stroke-width=".2"><path d="M8.066 8.378L6.955 9.624a.335.335 0 0 0 0 .436.26.26 0 0 0 .194.09c.07 0 .14-.03.194-.09L8.92 8.293c.054-.06.08-.14.08-.22a.32.32 0 0 0-.094-.232l-1.563-1.75a.255.255 0 0 0-.388 0 .334.334 0 0 0 0 .435l1.102 1.236h-5.49c-1.415 0-2.567 1.3-2.567 2.9v1.03c0 .17.123.308.275.308.152 0 .275-.138.275-.308v-1.03c0-1.259.905-2.284 2.018-2.284h5.498zM.934 14.622l1.11-1.246a.335.335 0 0 0 0-.436.26.26 0 0 0-.193-.09c-.07 0-.141.03-.195.09L.08 14.707a.325.325 0 0 0-.08.22.32.32 0 0 0 .093.232l1.563 1.75c.108.121.282.121.389 0a.334.334 0 0 0 0-.435L.942 15.238h5.49c1.416 0 2.567-1.3 2.567-2.9v-1.03c0-.17-.123-.308-.274-.308-.153 0-.275.138-.275.308v1.03c0 1.259-.905 2.284-2.018 2.284H.934z"></path></g></svg>
							<span id="unit2">평</span>

						</button>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">난방종류</p>
					<div class="gbAeEp">
						<c:if test="${room.HEATING_SYSTEM=='1'}">중앙난방</c:if>
						<c:if test="${room.HEATING_SYSTEM=='2'}">개별난방</c:if>
						<c:if test="${room.HEATING_SYSTEM=='3'}">지역난방</c:if>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">빌트인</p>
					<div class="gbAeEp">
						<c:if test="${room.BUILT_IN=='1'}">있음</c:if>
						<c:if test="${room.BUILT_IN=='0'}">없음</c:if>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">엘리베이터</p>
					<div class="gbAeEp">
						<c:if test="${room.ELEVATOR=='1'}">있음</c:if>
						<c:if test="${room.ELEVATOR=='0'}">없음</c:if>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">반려동물</p>
					<div class="gbAeEp">
						<c:if test="${room.PET=='1'}">가능</c:if>
						<c:if test="${room.PET=='0'}">불가능</c:if>					
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">베란다/발코니</p>
					<div class="gbAeEp">
						<c:if test="${room.BALCONY=='1'}">있음</c:if>
						<c:if test="${room.BALCONY=='0'}">없음</c:if>					
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">전세자금대출</p>
					<div class="gbAeEp">
						<c:if test="${room.LOAN_ACCESS=='1'}">가능</c:if>
						<c:if test="${room.LOAN_ACCESS=='0'}">불가능</c:if>					
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">입주가능일</p>
					<div class="gbAeEp"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></div>
				</li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	
	<!-- 이미지  -->
	<div class="kZTRnS">
		<div id="image" class="kBQneM">
			<div class="fQSDcO">
			<c:forEach var="file" items="${list}" varStatus="i">
				<c:if test="${i.index==0}">
					<div class="URMBL">
						<img src="<c:url value='/roomImages/${file.STD_NAME}'/>" onclick="popup(${file.STD_NAME})">
					</div>
				</c:if>
				<c:if test="${i.index>0 && i.index<5}">
					<div class="fGrzEs">
						<img src="<c:url value='/roomImages/${file.STD_NAME}'/>" onclick="popup(${file.STD_NAME})">
					</div>
				</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 설명 -->
	<div class="kZTRnS">
		<div id="description" class="kBQneM">
			<div class="kVQrqD">
				<h1 class="eRkCVv">${room.DESC_TITLE}</h1>
				<div class="cDEjhR" style="height:130px;">
					<div>${room.DESC_DETAIL}</div>
				</div>
				<button class="jQYbpN" type="button" onclick="readMore($(this));">
					<span>상세설명 더보기</span>
					<!-- 접기는 path-d를 M2 9l6-6 6 6 로 -->
					<svg width="16" height="12" viewBox="0 0 16 12"><path fill="none" fill-rule="evenodd" stroke="#1476FC" d="M2 3l6 6 6-6"></path></svg>
				</button>
			</div>
		</div>
	</div>
	
	<!-- 분석 -->

	<div id="analysis">
		<a class="styled__HiddenLink-sc-3pld98-0 kztjpN"></a>
		<div id="tab" class="eQtsIB">
			<div class="iMVDBW">
				<a href="#price" class="tab jClTEN">가격정보</a>
				<a href="#option" class="tab jClTEN">옵션</a>
				<a href="#location" class="tab jClTEN">위치</a>
			</div>
		</div>
		
		<div id="price" class="kZTRnS">
			<div class="jFMhNO">
				<h1 class="GYLAC">가격정보</h1>
				<table class="iSPaSs">
					<colgroup><col width="25%"><col width="25%"><col width="25%"><col width="25%"></colgroup>
					
					<thead>
						<tr>
							<th>월세</th>
							<th>전세</th>
							<th>관리비</th>
							<th>주차비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><p>
								<c:if test="${room.MONTHLY_DEPOSIT!=null && room.MONTHLY_DEPOSIT==''}">
								${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}만 원
								</c:if>
								<c:if test="${room.MONTHLY_DEPOSIT==null || room.MONTHLY_DEPOSIT==''}">
								-
								</c:if>
							</p></td>
							<td><p>
								${room.JEONSE}<c:if test="${room.JEONSE==null || room.JEONSE==''}">-</c:if>
							</p></td>
							<td><p id='utility_price'>
								<c:if test="${room.UTILITY_PRICE==null}">
									없음
								</c:if>
								<c:if test="${room.UTILITY_PRICE!=null}">
									${room.UTILITY_PRICE}만 원
								</c:if>
							</p></td>
							<td><p>
								<c:if test="${room.PARKING_BILL==null}">
									없음
								</c:if>
								<c:if test="${room.PARKING_BILL!=null}">
									${room.PARKING_BILL}만 원
								</c:if>
							</p></td>
						</tr>
					</tbody>
				</table>
				<div class="boQZaR">
					<p>한달 생활비</p>
					<div>
						<script type="text/javascript">
							var monthly = Number("${room.MONTHLY_PAYMENT}");
							var utility = Number("${room.UTILITY_PRICE}");
							var park = Number("${room.PARKING_BILL}");
							document.write(monthly+utility+park+"만 원 + α");
						</script>
						<span>
							<script type="text/javascript">
								var monthly = Number("${room.MONTHLY_PAYMENT}");
								var utility = Number("${room.UTILITY_PRICE}");
								var park = Number("${room.PARKING_BILL}");
								var str = "(";
								if(monthly!=0){
									str = str+"월세";
									if(utility!=0 || park!=0){
										str = str+"+";
									}
								}
								if(utility!=0){
									str = str+"관리비";
									if(park!=0){
										str = str+"+";
									}
								}
								if(park!=0){
									str = str+"주차비";
								}
								str = str+")";
								document.write(str);
							</script>
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 옵션 -->
		<div id="option" class="kZTRnS">
			<div class="jFMhNO kBQneM">
				<h1 class="lnMkbZ ">옵션</h1>
				<div class="dDctva"></div>
			</div>
		</div>
		
		<!-- 위치 -->
		<div id="location" class="kZTRnS ">
			<div class="jFMhNO kBQneM">
				<h1 class="fIqmuM">위치</h1>
				<p class="hwnvlX">${room.ADDRESS1}</p>
				<!-- 지도 영역 -->
				<div class="jdAEqt" id="map">지도 영역</div>
			</div>
		</div>
	</div>

</div>

<br>
<script type="text/javascript">
$(document).ready(function(){
	var modal = document.getElementById('myModal');
    var btn = document.getElementById('openLessor');
    var span = document.getElementsByClassName("close")[0]; 
    
    btn.onclick = function() {
    	var loginCH = idChk
		if (loginCH == 'null'){
			alert("로그인을 하셔야 이용하실 수 있는 기능입니다");
		}else{
        modal.style.display = 'block';
		}
    }
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = 'none';
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none';
        }
    }

});
</script>
<div id="myModal" class="modal">
<div class="styled__Overlay-sc-17v8eyt-0 dajUZo">
<div class="styled__Wrap-sc-17v8eyt-1 klSSab" width="400">
	<header class="styled__Header-sc-17v8eyt-2 GoREo">
		<h1>쪽지 보내기</h1>
			<button class="close styled__CloseBtn-sc-17v8eyt-3 kXLdvu">
				<svg width="30" height="30" viewBox="0 0 32 32">
					<g fill="none" fill-rule="evenodd" transform="translate(1 1)">
						<circle class="Circle" cx="15" cy="15" r="15"></circle>
						<g class="Close" stroke-linecap="round" stroke-width="2">
							<path d="M19.243 19.243l-8.486-8.486M19.243 10.757l-8.486 8.486"></path>
						</g>
					</g>
				</svg>
			</button>
	</header>
	
	<div class="styled__Wrap-sc-1skx99m-0 fxChzu">
		<div class="styled__AgentWrap-sc-1skx99m-1 bUnfmq">
			<div class="styled__AgentTitle-sc-1skx99m-2 gyvHLB">
				<h1>임대인 아이디: ${room.MEM_ID}</h1>
				<%-- <p>${lessor.MEM_PHONE}</p> --%>
			</div>
		</div>
		<div class="styled__UserWrap-sc-1skx99m-5 kMFgaL">
		<div class="styled__UserInfo-sc-1skx99m-7 hEBltZ">
			<p class="styled__Name-sc-1skx99m-8 fKNqjm">담당: 니네방마스터 (중개보조원)</p>
			<p class="styled__Phone-sc-1skx99m-9 bEkUP">
				<svg width="18" height="19" viewBox="0 0 18 19">
					<path fill="#1476FC" fill-rule="evenodd" d="M17.063 13.313c1.015 1.015 1.015 2.132 0 3.351-.407.474-.805.83-1.194 1.066-.39.237-.71.373-.965.407-.254.034-.618.05-1.091.05-1.32 0-2.895-.677-4.723-2.03a29.861 29.861 0 0 1-3.961-3.403A27.204 27.204 0 0 1 1.117 7.32C.102 5.424-.203 3.867.203 2.648.406 2.005.88 1.447 1.625.973l.05-.051c.61-.406 1.152-.61 1.626-.61.643 0 1.219.305 1.726.915l.051.05c.779 1.016 1.32 1.812 1.625 2.387.508 1.05.491 1.947-.05 2.691-.407.542-.61.931-.61 1.168 0 .102.22.407.66.915l.05.05c.813.914 1.254 1.405 1.321 1.473.034 0 .068.017.102.05l.203.204a39.899 39.899 0 0 0 1.473 1.422l.05.05c.305.271.508.407.61.407.169 0 .66-.254 1.472-.762.237-.17.525-.254.864-.254.609 0 1.345.254 2.209.762.863.508 1.532.999 2.005 1.473z"></path>
				</svg>010-0000-8282
			</p>
			<p class="styled__Text-sc-1skx99m-10 jxqoHd">연락 시 매물 주소를 알려주시면</p>
			<p class="styled__Text-sc-1skx99m-10 jxqoHd">더욱 빠르게 상담 받을 수 있습니다.</p>
		</div>
		</div>
		<h1 class="styled__Request-sc-1skx99m-11 kLiQkI">임대인에게 쪽지보내기</h1>
		<p class="styled__RequestDesc-sc-1skx99m-12 cKVLgb">임대인에 따라서 답장 시간이 늦어질 수 있습니다.</p>
		<form action="/nnb/myPage/messageWrite2" class="styled__RequestForm-sc-1skx99m-13 dhDUnZ">
			<input type="hidden" name="MESSAGE_TITLE" value="방 번호[${room.ROOM_NUM }]에 대한 문의입니다."/>
			<input type="hidden" name="RECEIVER" value="${room.MEM_ID}"/>
			<input type="hidden" name="ROOM_NUM" value="${room.ROOM_NUM}"/>
			<textarea name="MESSAGE_CONTENT" autocomplete="off" placeholder="내용을 입력해주세요" class="styled__Input-sc-1skx99m-14 kmcUrF"></textarea>
			<button class="styled__RequestBtn-sc-1skx99m-15 idBxyN" type="submit">보내기</button>
		</form>
	</div>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var modal = document.getElementById('myModal2');
    var btn = document.getElementById('openReport');
    var span = document.getElementsByClassName("close2")[0]; 
    
    btn.onclick = function() {
    	var loginCH = idChk
		if (loginCH == 'null'){
			alert("로그인을 하셔야 이용하실 수 있는 기능입니다");
		}else{
        modal.style.display = 'block';
		}
    }
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = 'none';
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none';
        }
    }

});
</script>

<div id="myModal2" class="modal2">
	<div class="styled__Overlay-sc-17v8eyt-0 dajUZo">
		<div class="styled__Wrap-sc-17v8eyt-1 hezqfH" width="600">
			<header class="styled__Header-sc-17v8eyt-2 GoREo">
				<h1>허위매물 신고</h1>
				<button class="styled__CloseBtn-sc-17v8eyt-3 kXLdvu close2">
				<svg width="30" height="30" viewBox="0 0 32 32">
					<g fill="none" fill-rule="evenodd" transform="translate(1 1)">
						<circle class="Circle" cx="15" cy="15" r="15">
						</circle>
						<g class="Close" stroke-linecap="round" stroke-width="2">
							<path d="M19.243 19.243l-8.486-8.486M19.243 10.757l-8.486 8.486"></path>
						</g>
					</g>
				</svg>
				</button>
			</header>
			
			<form action="/nnb/report">
			<div class="styled__Wrap-sc-1n1jlbj-0 sAnxl">
				<div class="styled__Notice-sc-1n1jlbj-1 kNWuAm">
					<h1>매물에 대한 잘못된 정보를 신고해주세요!</h1>
					<p>확인 후 허위매물일 경우 해당 매물은 삭제되거나 이용이 제재됩니다.</p>
					<p>허위신고일 시 신고자는 법적인 책임을 질 수 있습니다.</p>
					<p>다방은 자체 검열을 통해 허위매물 근절에 노력하고 있습니다.</p>
				</div>
				<div class="styled__Box-sc-1n1jlbj-2 dSVCPu">
					<h1 class="styled__BoxTitle-sc-1n1jlbj-3 dpGWsW">신고항목
						<span>(*필수)</span>
					</h1>
					<div class="styled__CheckWrap-sc-1n1jlbj-4 jrruna">
						<label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi" size="22">
							<input type="radio" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="REPORT_TYPE" value="1">
							<span class="CheckBox"></span>
							<span class="styled__CheckText-sc-1n1jlbj-5 llNbGB">거래가 완료 된 매물</span>
						</label>
						<label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi" size="22">
							<input type="radio" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="REPORT_TYPE" value="2">
							<span class="CheckBox"></span>
							<span class="styled__CheckText-sc-1n1jlbj-5 llNbGB">정보가 다른 매물 (가격, 사진, 위치, 옵션 등)</span>
						</label>
					</div>
						<textarea class="styled__Area-sc-1n1jlbj-6 eKDcBx Textarea-sc-6jro6l-0 hunnDM" name="REPORT_REASON" placeholder="추가 설명을 입력하세요.">
						</textarea>
				</div>
				<input type="hidden" name="REPORT_TITLE" value="방 번호[${room.ROOM_NUM }]에 대한 신고글입니다."/>
				<input type="hidden" name="REPORT_D_ID" value="${room.MEM_ID}"/>
				<input type="hidden" name="REPORT_POST_NUM" value="${room.ROOM_NUM}"/>
				<button class="styled__Btn-sc-1n1jlbj-18 bucdvX">허위매물 신고하기</button>
			</div>
			</form>
		</div>
	</div>
</div>






<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
	<c:forEach var="address" items="${list}">
		<script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
             center: new kakao.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 미리 생성
            var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
            
            geocoder.addressSearch('${room.ADDRESS1}', function(result, status) { // 주소로 좌표를 검색합니다
               // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
                });
                map.setCenter(coords);
              } 
            });    
         </script>
	</c:forEach>
<script type="text/javascript">

//옵션 부분(위에 표)
if(${room.UTILITY_PRICE!=null}) {
	var utility = "${room.UTILITY_TYPE}";
	var array = utility.replace('1','인터넷')
			.replace('2','유선TV')
			.replace('3','청소비')
			.replace('4','수도세')
			.replace('5','도시가스')
			.replace('6','전기세')
			.replace('7','기타').split(',');
	array = array.filter(String);
	for(var i=0; i<array.length; i++){
		if(i==0){
			$("#utility_price").append("("+array[i]);
		}else if(i==array.length-1){
			$("#utility_price").append(", "+array[i]+")");
		}else{
			$("#utility_price").append(", "+array[i]);
		}
	}
}
//옵션 부분(아래)
var option = "${room.OPTIONS}";
option = option
	.replace('10','인덕션')
	.replace('11','전자레인지')
	.replace('12','전자도어락')
	.replace('13','비데')
	.replace('2','세탁기')
	.replace('3','침대')
	.replace('4','책상')
	.replace('5','옷장')
	.replace('6','TV')
	.replace('7','신발장')
	.replace('8','냉장고')
	.replace('9','가스레인지')
	.replace('1','에어컨');
var array = option.split(',');
array = array.filter(String);
for(var i=0;i<array.length;i++){
	$(".dDctva").append("<div class='gqtsIc' id='"+i+"'><p>"+array[i]+"</p></div>");
	switch(array[i]){
	case '에어컨':
		$("#"+i).prepend("<div class='aircondition'></div>");
		break;
	case '세탁기':
		$("#"+i).prepend("<div class='laundry'></div>");
		break;
	case '침대':
		$("#"+i).prepend("<div class='bed'></div>");
		break;
	case '책상':
		$("#"+i).prepend("<div class='desk'></div>");
		break;
	case '옷장':
		$("#"+i).prepend("<div class='closet'></div>");
		break;
	case 'TV':
		$("#"+i).prepend("<div class='tv'></div>");
		break;
	case '신발장':
		$("#"+i).prepend("<div class='shoes'></div>");
		break;
	case '냉장고':
		$("#"+i).prepend("<div class='refrigerator'></div>");
		break;
	case '가스레인지':
		$("#"+i).prepend("<div class='gas'></div>");
		break;
	case '인덕션':
		$("#"+i).prepend("<div class='induction'></div>");
		break;
	case '전자레인지':
		$("#"+i).prepend("<div class='microoven'></div>");
		break;
	case '전자도어락':
		$("#"+i).prepend("<div class='doorlock'></div>");
		break;
	case '비데':
		$("#"+i).prepend("<div class='bidet'></div>");
		break;
	}
}

function fn_addFav(){
	
	if(idChk == 'null'){
		alert('로그인하셔야 이용할 수 있는 기능입니다.');
	}
	else{
	var str = window.location.href;
	var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
	comSubmit.addParam("check", 0);
	comSubmit.addParam("ROOM_NUM", "${room.ROOM_NUM}");
	comSubmit.addParam("MEM_ID", idChk);
	comSubmit.addParam("url", url);
	comSubmit.submit();
	}
}
function fn_deleteFav(){
	var str = window.location.href;
	var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
	comSubmit.addParam("check", 1);
	comSubmit.addParam("ROOM_NUM", "${room.ROOM_NUM}");
	comSubmit.addParam("MEM_ID", idChk);
	comSubmit.addParam("url", url);
	comSubmit.submit();
}
</script>
</html>