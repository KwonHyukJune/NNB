<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script type="text/javascript">
/* convert(m): ���<->�������� ��ȯ */
 var pyeong = document.getElementById("pyeong");      
 var p = (parseFloat(document.getElementById('m2').value) / 3.3058).toFixed(2);
 pyeong.innerHTML = p;
 
/* report(): �Ű��ϱ� ��â���� */
/* readMore() : �󼼼��� ������ */
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
			<c:if test="${room.TRADE_TYPE=='����'}">
			<div>${room.TRADE_TYPE} ${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}</div>
			</c:if>
			<c:if test="${room.TRADE_TYPE=='����'}">
			<div>${room.TRADE_TYPE} ${room.JEONSE}</div>
			</c:if>
			<div>����</div>
		</div>
		<div>
			<div>�������</div>
			<div id="m2">${room.REAL_SIZE}m2</div> <div id="pyeong"></div>
		</div>
		<div>
			<div>�Ӵ���</div>
			<div>${room.MEM_ID}</div>
			<a href="<c:url value='/room/detail/lessorInfo?MEM_ID=${room.MEM_ID}'/>" class="btn" >�Ӵ��� ���� ����</a>
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
			<a href="#" class="btn" onclick="report(${room.ROOM_NUM});">�Ű��ϱ�</a>
		</div>	
	</div>
	
	<div id="detail2">
		<div>
			<div>�ش���/�ǹ���</div>
			<div>${room.ROOM_FLOOR}��/${room.BUILDING_STORY}��</div>
		</div>
		<div>
			<div>����/���޸���</div>
			<div>${room.REAL_SIZE}/${room.SUPPLY_SIZE}m2<button onclick="convert(${room.REAL_SIZE},${room.SUPPLY_SIZE})"><->��</button></div>
		</div>
		<div>
			<div>��������</div>
			<div>${room.HEATING_SYSTEM}</div>
		</div>
		<div>
			<div>��Ʈ��</div>
			<div>
				<c:if test="${room.BUILT_IN=='1'}">����</c:if>
				<c:if test="${room.BUILT_IN=='0'}">����</c:if>
			</div>
		</div>
		<div>
			<div>����������</div>
			<div>
				<c:if test="${room.ELEVATOR}">����</c:if>
				<c:if test="${room.ELEVATOR}">����</c:if>
			</div>
		</div>
		<div>
			<div>�ݷ�����</div>
			<div>
				<c:if test="${room.PET}">����</c:if>
				<c:if test="${room.PET}">�Ұ���</c:if>
			</div>
		</div>
		<div>
			<div>������/���ڴ�</div>
			<div>
				<c:if test="${room.BALCONY}">����</c:if>
				<c:if test="${room.BALCONY}">����</c:if>
			</div>
		</div>
		<div>
			<div>�����ڱݴ���</div>
			<div>
				<c:if test="${room.LOAN_ACCESS}">����</c:if>
				<c:if test="${room.LOAN_ACCESS}">�Ұ���</c:if>
			</div>
		</div>
		<div>
			<div>���ְ�����</div>
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
		<div onclick="readMore();">�󼼼��� ������</div>
	</div>
</div>

<div id="analysis">
	<div id="tab">
		<a href="#price" class="tab">��������</a>
		<a href="#option" class="tab">�ɼ�</a>
		<a href="#location" class="tab">��ġ</a>
	</div>
	
	<div id="price">
		<div>��������</div>
		<div class="table">
			<div class="thead">
				<div>����</div>
				<div>����</div>
				<div>������</div>
				<div>������</div>
			</div>
			<div class="tbody">
				<div>${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}�� ��</div>
				<div>${room.JEONSE}<c:if test="${room.JEONSE==null || room.JEONSE==''}">-</c:if></div>
				<div>
					${room.UTILITY_PRICE}�� ��<br>
					<script type="text/javascript">
						var utility = "${room.UTILITY_TYPE}";
						document.write("("+utility.replace('1','���ͳ�')
								.replace('2','����TV')
								.replace('3','û�Һ�')
								.replace('4','������')
								.replace('5','���ð���')
								.replace('6','���⼼')
								.replace('7','��Ÿ')
								+")");
					</script>
				</div>
				<div>${room.PARKING_BILL}�� ��</div>
			</div>
			<div>
				<span>�Ѵ� ��Ȱ��</span>
				<span>
					<script type="text/javascript">
						var monthly = Number("${room.MONTHLY_PAYMENT}");
						var utility = Number("${room.UTILITY_PRICE}");
						var park = Number("${room.PARKING_BILL}");
						document.write(monthly+utility+park+"�� ��+");
					</script>
				</span>
				<span>
					<script type="text/javascript">
						var monthly = Number("${room.MONTHLY_PAYMENT}");
						var utility = Number("${room.UTILITY_PRICE}");
						var park = Number("${room.PARKING_BILL}");
						var str = "(";
						if(monthly!=0){
							str = str+"����";
							if(utility!=0 || park!=0){
								str = str+"+";
							}
						}
						if(utility!=0){
							str = str+"������";
							if(park!=0){
								str = str+"+";
							}
						}
						if(park!=0){
							str = str+"������";
						}
						str = str+")";
						document.write(str);
					</script>
				</span>
			</div>
		</div>
	</div>
	
	<div id="option">
		<div>�ɼ�</div>
		<script type="text/javascript">
			var option = "${room.OPTIONS}";
			option = option.replace('1','������')
				.replace('2','"��Ź��"')
				.replace('3','"ħ��"')
				.replace('4','"å��"')
				.replace('5','"����"')
				.replace('6','"TV"')
				.replace('7','"�Ź���"')
				.replace('8','"�����"')
				.replace('9','"����������"')
				.replace('10','"�δ���"')
				.replace('11','"���ڷ�����"')
				.replace('12','"���ڵ����"')
				.replace('13','"��"');
			option = eval("["+option+"]");
			for(var i=0;i<option.length;i++){
				document.write("<span>"+option[i]+"</span>");
			}
		</script>
	</div>
	
	<div id="location">
		<div>��ġ</div>
		<div>���� ����</div>
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