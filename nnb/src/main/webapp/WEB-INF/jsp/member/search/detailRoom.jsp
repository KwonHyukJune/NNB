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
<script type="text/javascript">
/* openlessorInfo(id): 임대인 정보보기 새창으로 /room/detail/lessorInfo */
/* report(): 신고하기 새창으로 */
/* readMore() : 상세설명 더보기 */

 
 
/* $(function () { 
            $('#converter').toggle(function () {
                var m2 = $('#room_size').val();
                var p = (parseFloat(m2)*3.3058).toFixed(2)
                document.getElementById('room_size') = p
            });
}); */
/* 
-------convert(m): 평수<->제곱미터 변환--------------
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
} */
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/search/detail/addFavRoom'/>");
		comAjax.addParam("ROOM_NUM",num);
		comAjax.ajax();
	};
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/search/detail/deleteFavRoom'/>");
		comAjax.addParam("ROOM_NUM",num);
		comAjax.ajax();
	};
/* 쿠키 */
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
					<p class="hzbdBs">전용면적</p>
					<div class="dUILvV">
						<h1 id="room_size" class="dUuerR">
							${room.REAL_SIZE}㎡
						</h1>
						<button class="ktfeIl" type="button" id="converter" onclick="convert($(this));">
							<svg width="11" height="23" viewBox="0 0 11 23"><g fill="#222" fill-rule="evenodd" stroke="#222" stroke-width=".2"><path d="M8.066 8.378L6.955 9.624a.335.335 0 0 0 0 .436.26.26 0 0 0 .194.09c.07 0 .14-.03.194-.09L8.92 8.293c.054-.06.08-.14.08-.22a.32.32 0 0 0-.094-.232l-1.563-1.75a.255.255 0 0 0-.388 0 .334.334 0 0 0 0 .435l1.102 1.236h-5.49c-1.415 0-2.567 1.3-2.567 2.9v1.03c0 .17.123.308.275.308.152 0 .275-.138.275-.308v-1.03c0-1.259.905-2.284 2.018-2.284h5.498zM.934 14.622l1.11-1.246a.335.335 0 0 0 0-.436.26.26 0 0 0-.193-.09c-.07 0-.141.03-.195.09L.08 14.707a.325.325 0 0 0-.08.22.32.32 0 0 0 .093.232l1.563 1.75c.108.121.282.121.389 0a.334.334 0 0 0 0-.435L.942 15.238h5.49c1.416 0 2.567-1.3 2.567-2.9v-1.03c0-.17-.123-.308-.274-.308-.153 0-.275.138-.275.308v1.03c0 1.259-.905 2.284-2.018 2.284H.934z"></path></g></svg>
							<span></span>
						</button>
					</div>
				</li>
				<li class="byeNFK">
					<div style="float:left;">
						<p class="hhDakc">임대인</p>
						<p class="gTIMxh">${room.MEM_ID}</p>
					</div>
					<button class="fEkbZe" onclick="openLessorInfo(${room.MEM_ID});">
						<svg width="18" height="18" viewBox="0 0 18 18"><path fill="#222" fill-rule="evenodd" d="M4.324.404c.328.457.689.979 1.081 1.565.393.586.818 1.236 1.275 1.95.117.188.167.4.15.634a1.834 1.834 0 0 1-.256.756c-.058.117-.158.304-.299.562L5.73 6.873c.247.352.56.744.94 1.178.382.433.824.902 1.328 1.406.516.516.987.964 1.415 1.345.428.38.812.694 1.151.94.399-.234.73-.425.994-.571.263-.147.454-.25.57-.308.142-.082.285-.143.432-.184.146-.041.284-.062.413-.062a1.066 1.066 0 0 1 .545.14c.527.317 1.084.672 1.67 1.064.585.393 1.212.824 1.88 1.292.118.082.211.188.282.317.07.129.117.27.14.422.012.164-.006.33-.052.5-.047.17-.13.343-.247.52a2.446 2.446 0 0 1-.21.298 19.35 19.35 0 0 1-.335.404c-.117.153-.269.325-.457.519-.187.193-.41.407-.668.641-.246.235-.471.41-.676.528-.205.117-.384.175-.536.175h-.036a6.392 6.392 0 0 1-1.916-.395 11.957 11.957 0 0 1-2.109-1.028 19.487 19.487 0 0 1-2.32-1.67 38.968 38.968 0 0 1-2.532-2.303A34.717 34.717 0 0 1 3.085 9.51a20.91 20.91 0 0 1-1.67-2.32A11.08 11.08 0 0 1 .387 5.07C.152 4.397.023 3.761 0 3.164 0 3 .059 2.815.176 2.61c.117-.205.293-.436.527-.694.235-.258.445-.478.633-.66.187-.18.357-.33.51-.447.14-.106.275-.205.404-.3.129-.093.24-.175.334-.245.129-.094.264-.161.404-.202C3.128.02 3.281 0 3.445 0c.188 0 .355.032.501.097a.947.947 0 0 1 .378.307zm-1.145.694a8.368 8.368 0 0 0-.688.538c-.223.194-.44.397-.652.609-.212.211-.38.394-.503.546a1.349 1.349 0 0 0-.238.389c.023.529.147 1.093.37 1.693.224.6.547 1.238.97 1.914.424.676.947 1.388 1.57 2.135a35.836 35.836 0 0 0 2.17 2.355 35.836 35.836 0 0 0 2.355 2.17 19.601 19.601 0 0 0 2.135 1.57c.676.423 1.317.746 1.923.97a6.12 6.12 0 0 0 1.702.388c.082-.035.2-.118.353-.247.153-.13.335-.3.547-.512.212-.211.411-.432.6-.661.188-.23.37-.462.547-.697a.417.417 0 0 0 .07-.132.19.19 0 0 0 0-.115 71.472 71.472 0 0 0-1.879-1.288c-.57-.376-1.085-.711-1.543-1.005-.047 0-.1.009-.159.026a1.231 1.231 0 0 0-.194.08c-.094.058-.27.158-.53.3l-1.005.546-.582.353-.582-.388c-.377-.259-.791-.59-1.244-.997-.453-.405-.95-.879-1.49-1.42a40.393 40.393 0 0 1-1.394-1.49c-.4-.453-.73-.868-.988-1.244l-.423-.547.352-.617a101.22 101.22 0 0 1 .847-1.535c.035-.07.062-.135.08-.194a.559.559 0 0 0 .026-.159c-.412-.647-.803-1.252-1.173-1.817a81.447 81.447 0 0 0-1.067-1.588h-.036a.48.48 0 0 0-.132.018.407.407 0 0 0-.115.053z"></path></svg>
						<span>연락처보기</span>
					</button>
				</li>
			</ul>
			<div class="bbfToB">
				<p class="dojagi">
					<!-- 찜 아이콘. 빨갛게 하려면 path fill, stroke 를 #F63C4A으로 -->
					<svg width="23" height="22" viewBox="0 0 23 22"><path fill="none" fill-rule="evenodd" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.5 19c.92-.7 6.89-5.628 8.41-7.623.877-1.154 1.09-2.17 1.09-3.358C21 5.247 18.776 3 16.033 3 13.32 3 11.5 5.862 11.5 5.862S9.68 3 6.967 3C4.224 3 2 5.247 2 8.019c0 1.187.213 2.204 1.09 3.358C4.61 13.372 10.58 18.3 11.5 19z"></path></svg>
					${room.FAV_COUNT}
				</p>
				<p class="fEBzAW">•</p>
				<button type="button" class="lhWOpc">
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
					<div class="gbAeEp">${room.ROOM_FLOOR}층/${room.BUILDING_STORY}층</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">전용/공급면적</p>
					<div class="gbAeEp">
						<span>${room.REAL_SIZE}/${room.SUPPLY_SIZE}m2</span>
						<button class="bHPFKV">
							<svg width="11" height="23" viewBox="0 0 11 23"><g fill="#222" fill-rule="evenodd" stroke="#222" stroke-width=".2"><path d="M8.066 8.378L6.955 9.624a.335.335 0 0 0 0 .436.26.26 0 0 0 .194.09c.07 0 .14-.03.194-.09L8.92 8.293c.054-.06.08-.14.08-.22a.32.32 0 0 0-.094-.232l-1.563-1.75a.255.255 0 0 0-.388 0 .334.334 0 0 0 0 .435l1.102 1.236h-5.49c-1.415 0-2.567 1.3-2.567 2.9v1.03c0 .17.123.308.275.308.152 0 .275-.138.275-.308v-1.03c0-1.259.905-2.284 2.018-2.284h5.498zM.934 14.622l1.11-1.246a.335.335 0 0 0 0-.436.26.26 0 0 0-.193-.09c-.07 0-.141.03-.195.09L.08 14.707a.325.325 0 0 0-.08.22.32.32 0 0 0 .093.232l1.563 1.75c.108.121.282.121.389 0a.334.334 0 0 0 0-.435L.942 15.238h5.49c1.416 0 2.567-1.3 2.567-2.9v-1.03c0-.17-.123-.308-.274-.308-.153 0-.275.138-.275.308v1.03c0 1.259-.905 2.284-2.018 2.284H.934z"></path></g></svg>
							<span></span>
						</button>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">난방종류</p>
					<div class="gbAeEp">${room.HEATING_SYSTEM}</div>
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
						<c:if test="${room.ELEVATOR}">있음</c:if>
						<c:if test="${room.ELEVATOR}">없음</c:if>
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">반려동물</p>
					<div class="gbAeEp">
						<c:if test="${room.PET}">가능</c:if>
						<c:if test="${room.PET}">불가능</c:if>					
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">베란다/발코니</p>
					<div class="gbAeEp">
						<c:if test="${room.BALCONY}">있음</c:if>
						<c:if test="${room.BALCONY}">없음</c:if>					
					</div>
				</li>
				<li class="gWdVQs">
					<p class="gPsGgb">전세자금대출</p>
					<div class="gbAeEp">
						<c:if test="${room.LOAN_ACCESS}">가능</c:if>
						<c:if test="${room.LOAN_ACCESS}">불가능</c:if>					
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
				<button class="jQYbpN" type="button" onclick="readMore();">
					상세설명 더보기
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
							<td><p>${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}만 원</p></td>
							<td><p>
								${room.JEONSE}<c:if test="${room.JEONSE==null || room.JEONSE==''}">-</c:if>
							</p></td>
							<td><p>
								<c:if test="${room.UTILITY_PRICE==null}">
									없음
								</c:if>
								<c:if test="${room.UTILITY_PRICE!=null}">
									${room.UTILITY_PRICE}만 원
									<script type="text/javascript">
										var utility = "${room.UTILITY_TYPE}";
										document.write("("+utility.replace('1','인터넷')
												.replace('2','유선TV')
												.replace('3','청소비')
												.replace('4','수도세')
												.replace('5','도시가스')
												.replace('6','전기세')
												.replace('7','기타')
												+")");
									</script>
								</c:if>
							</p></td>
							<td><p>
								<c:if test="${room.UTILITY_PRICE==null}">
									없음
								</c:if>
								<c:if test="${room.UTILITY_PRICE!=null}">
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
				<div class="dDctva">
					<script type="text/javascript">
						var option = "${room.OPTIONS}";
						console.log(option);
						option = option.replace('1','에어컨')
							.replace('2','"세탁기"')
							.replace('3','"침대"')
							.replace('4','"책상"')
							.replace('5','"옷장"')
							.replace('6','"TV"')
							.replace('7','"신발장"')
							.replace('8','"냉장고"')
							.replace('9','"가스레인지"')
							.replace('10','"인덕션"')
							.replace('11','"전자레인지"')
							.replace('12','"전자도어락"')
							.replace('13','"비데"');
						option = eval("["+option+"]");
						console.log(option);
						for(var i=0;i<option.length;i++){
							document.write("<div class='gqtsIc'><p>"+option[i]+"</p></div>");
						}
					</script>
				</div>
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
</html>