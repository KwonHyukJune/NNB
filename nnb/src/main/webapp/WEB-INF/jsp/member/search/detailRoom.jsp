<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script type="text/javascript">
/* convert(m): 평수<->제곱미터 변환 */
 var pyeong = document.getElementById("pyeong");      
 var p = (parseFloat(document.getElementById('m2').value) / 3.3058).toFixed(2);
 pyeong.innerHTML = p;
 
/* report(): 신고하기 새창으로 */
/* readMore() : 상세설명 더보기 */
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
	
	
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="detailRoom">

<div id="detail">
	<div id="detail1">
		<div>
			<div>${room.ROOM_TYPE}</div>
			<c:if test="${room.TRADE_TYPE=='월세'}">
			<div>${room.TRADE_TYPE} ${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}</div>
			</c:if>
			<c:if test="${room.TRADE_TYPE=='전세'}">
			<div>${room.TRADE_TYPE} ${room.JEONSE}</div>
			</c:if>
			<div>만원</div>
		</div>
		<div>
			<div>전용면적</div>
			<div id="m2">${room.REAL_SIZE}m2</div> <div id="pyeong"></div>
		</div>
		<div>
			<div>임대인</div>
			<div>${room.MEM_ID}</div>
			<a href="<c:url value='/room/detail/lessorInfo?MEM_ID=${room.MEM_ID}'/>" class="btn" >임대인 정보 보기</a>
		</div>
	</div>
	
	<div id="action">
		<div>
			<c:if test="${room.check=='0'}">
			<div class="insertFav" onclick="insertFav(${room.ROOM_NUM});">
			</div>
			</c:if>
			<c:if test="${room.check=='1'}">
			<div class="deleteFav" onclick="deleteFav(${room.ROOM_NUM});">
			</div>
			</c:if>
		</div>
		<div>${room.FAV_COUNT}</div>
		<div>
			<a href="#" class="btn" onclick="report(${room.ROOM_NUM});">신고하기</a>
		</div>	
	</div>
	
	<div id="detail2">
		<div>
			<div>해당층/건물층</div>
			<div>${room.ROOM_FLOOR}층/${room.BUILDING_STORY}층</div>
		</div>
		<div>
			<div>전용/공급면적</div>
			<div>${room.REAL_SIZE}/${room.SUPPLY_SIZE}m2<button onclick="convert(${room.REAL_SIZE},${room.SUPPLY_SIZE})"><->평</button></div>
		</div>
		<div>
			<div>난방종류</div>
			<div>${room.HEATING_SYSTEM}</div>
		</div>
		<div>
			<div>빌트인</div>
			<div>
				<c:if test="${room.BUILT_IN=='1'}">있음</c:if>
				<c:if test="${room.BUILT_IN=='0'}">없음</c:if>
			</div>
		</div>
		<div>
			<div>엘리베이터</div>
			<div>
				<c:if test="${room.ELEVATOR}">있음</c:if>
				<c:if test="${room.ELEVATOR}">없음</c:if>
			</div>
		</div>
		<div>
			<div>반려동물</div>
			<div>
				<c:if test="${room.PET}">가능</c:if>
				<c:if test="${room.PET}">불가능</c:if>
			</div>
		</div>
		<div>
			<div>베란다/발코니</div>
			<div>
				<c:if test="${room.BALCONY}">있음</c:if>
				<c:if test="${room.BALCONY}">없음</c:if>
			</div>
		</div>
		<div>
			<div>전세자금대출</div>
			<div>
				<c:if test="${room.LOAN_ACCESS}">가능</c:if>
				<c:if test="${room.LOAN_ACCESS}">불가능</c:if>
			</div>
		</div>
		<div>
			<div>입주가능일</div>
			<div>${room.MOVE_IN_DATE}</div>
		</div>
	</div>
	
	<div id="image">
		<c:forEach var="file" items="${fileList}">
			<img src="<c:url value='/files/${file.STD_NAME}'/>" onclick="popup(${file.STD_NAME})">
		</c:forEach>
	</div>
	
	<div id="description">
		<div>${room.DESC_TITLE}</div>
		<div>${room.DESC_DETAIL}</div>
		<div onclick="readMore();">상세설명 더보기</div>
	</div>
</div>

<div id="analysis">
	<div id="tab">
		<a href="#price" class="tab">가격정보</a>
		<a href="#option" class="tab">옵션</a>
		<a href="#location" class="tab">위치</a>
	</div>
	
	<div id="price">
		<div>가격정보</div>
		<div class="table">
			<div class="thead">
				<div>월세</div>
				<div>전세</div>
				<div>관리비</div>
				<div>주차비</div>
			</div>
			<div class="tbody">
				<div>${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}만 원</div>
				<div>${room.JEONSE}<c:if test="${room.JEONSE==null || room.JEONSE==''}">-</c:if></div>
				<div>
					${room.UTILITY_PRICE}만 원<br>
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
				</div>
				<div>${room.PARKING_BILL}만 원</div>
			</div>
			<div>
				<span>한달 생활비</span>
				<span>
					<script type="text/javascript">
						var monthly = Number("${room.MONTHLY_PAYMENT}");
						var utility = Number("${room.UTILITY_PRICE}");
						var park = Number("${room.PARKING_BILL}");
						document.write(monthly+utility+park+"만 원+");
					</script>
				</span>
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
	
	<div id="option">
		<div>옵션</div>
		<script type="text/javascript">
			var option = "${room.OPTIONS}";
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
			for(var i=0;i<option.length;i++){
				document.write("<span>"+option[i]+"</span>");
			}
		</script>
	</div>
	
	<div id="location">
		<div>위치</div>
		<div>지도 영역</div>
	</div>
</div>

</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
<script type="text/javascript">
</script>
</html>