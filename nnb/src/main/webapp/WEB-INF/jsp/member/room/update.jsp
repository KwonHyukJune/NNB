<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> room = new HashMap<String,Object>();
	room.put("check","1");
	room.put("ROOM_TYPE","����");
	room.put("BUILDING_TYPE","�ܵ�����");
	room.put("TRADE_TYPE","����");
	room.put("MONTHLY_DEPOSIT","300");
	room.put("MONTHLY_PAYMENT","30");
	room.put("SUPPLY_SIZE","20");
	room.put("REAL_SIZE","20");
	room.put("BUILDING_STORY","20");
	room.put("ROOM_FLOOR","3");
	room.put("HEATING_SYSTEM","1");
	room.put("MOVE_IN_DATE","2019-08-08");	//������ �̷��� �޾ƾ� ��;;
	room.put("UTILITY_CHECK","1");
	room.put("UTILITY_PRICE","10");
	room.put("UTILITY_TYPE","1,3,5");
	room.put("PARKING","1");
	room.put("PARKING_BILL","5");
	room.put("PET","1");
	room.put("ELEVATOR","1");
	room.put("BALCONY","1");
	room.put("BUILT_IN","1");
	room.put("STRUCTURES","1");
	room.put("OPTIONS","2,4,6");
	room.put("LOAN_ACCESS","0");
	room.put("DESC_TITLE","�δٽ�");
	room.put("DESC_DETAIL","�̰��ݿ� �̸��� ����Ƽ");
	room.put("DESC_SECRET","�̳�");
	
	request.setAttribute("room", room);
%>
<!-- �׽�Ʈ�� ���� �� -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	(function(){
		var value = "${room.ROOM_TYPE}";
		var key = $("input[name='ROOM_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BUILDING_TYPE}";
		var key = $("input[name='BUILDING_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.TRADE_TYPE}";
		var key = $("input[name='TRADE_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.MONTHLY_DEPOSIT}";
		var key = $("input[name='MONTHLY_DEPOSIT']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.MONTHLY_PAYMENT}";
		var key = $("input[name='MONTHLY_PAYMENT']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.JEONSE}";
		var key = $("input[name='JEONSE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.SUPPLY_SIZE}";
		var key = $("input[name='SUPPLY_SIZE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.REAL_SIZE}";
		var key = $("input[name='REAL_SIZE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.BUILDING_STORY}";
		var key = $("select[name='BUILDING_STORY']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.ROOM_FLOOR}";
		var key = $("select[name='ROOM_FLOOR']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.HEATING_SYSTEM}";
		var key = $("select[name='HEATING_SYSTEM']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.MOVE_IN_DATE}";
		var key = $("input[name='MOVE_IN_DATE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.UTILITY_CHECK}";
		var key = $("input[name='UTILITY_CHECK']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.UTILITY_PRICE}";
		var key = $("input[name='UTILITY_PRICE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = eval("["+"${room.UTILITY_TYPE}"+"]");
		var key = $("input.UTILITY_TYPE");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = "${room.PARKING}";
		var key = $("input[name='PARKING']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.PARKING_BILL}";
		var key = $("input[name='PARKING_BILL']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.PET}";
		var key = $("input[name='PET']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.ELEVATOR}";
		var key = $("input[name='ELEVATOR']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BALCONY}";
		var key = $("input[name='BALCONY']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BUILT_IN}";
		var key = $("input[name='BUILT_IN']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = eval("["+"${room.STRUCTURES}"+"]");
		var key = $("input.STRUCTURES");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = eval("["+"${room.OPTIONS}"+"]");
		var key = $("input.OPTIONS");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = "${room.LOAN_ACCESS}";
		var key = $("input[name='LOAN_ACCESS']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.DESC_TITLE}";
		var key = $("input[name='DESC_TITLE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.DESC_DETAIL}";
		var key = $("textarea[name='DESC_DETAIL']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.DESC_SECRET}";
		var key = $("textarea[name='DESC_SECRET']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
});
</script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
/* �ǹ� ������ ���� ���� �ɼ� �޶����� */
/* �ּ� API */
/* ����/���� �����ϸ� �ݾ��Է� â �߰� */
/* ��� �Է��ϸ� m2���� �߰� m2�Է��ϸ� ��� �߰� */
/* div �����ϸ� ���� üũ�ǰ� div ��Ÿ�� �ٲ� */
/* ������ ���� ������ UTILITY_PRICE ���̰� */
/* div �����ϸ� üũ�ڽ� üũ�ǰ� div ��Ÿ�� �ٲ� */
/* �������� 1�̸� �����ݾ� ����Ұ����� ���氡������ �ٲ�� */
/* �������� 0�̸� �����ݾ� ���氡�ɿ��� ����Ұ��� �ٲ�� ��� ���� */
/* ���� ����� �� �̹��� ���ϸ� ��ϵǰ� �����Ѱ�? ���� �����ϰ���.. */
/* �����Ź� ���� ��å ��ũ */
/* ��ϵ� ���� �ҷ����� */
	var gfv_count = 1;
 	var mem = sessionStorage.getItem("MEM_ID");
	function addFile(){
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>����</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click",function(e){
			e.preventDefault();
			fn_deleteFile($(this));
		});
	};/* ���Ѱ����� �ڵ� �״�� �ܾ���� */
	function fn_deleteFile(obj){
		obj.parent().remove();
	};
	function submit(){
		var comSubmit = new ComSubmit(frm);
		comSubmit.setUrl("<c:url value='/room/regist'/>");
		/* EXPIRATION_DATE�� �ڹٿ��� ���ó�¥+30�Ϸ� */
		comSubmit.addParam("MEM_ID",mem);
		comSubmit.submit(frm);
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/footer.jspf" %>
<%@ include file="room.jspf" %>
<div class="roomUpdate">

<div class="inform">
����� �Ź��� 30�� ���� ��¼��~
</div>
<form id="frm">
<div class="table">
	<div class="thead">�Ź� ����</div>
	<div class="tbody">
		<div class="h">���� ����</div>
		<div class="b">
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="����"><div class="button">����</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="����"><div class="button">����</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="������"><div class="button">������</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="���ǽ���"><div class="button">���ǽ���</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="����Ʈ"><div class="button">����Ʈ</div>
		</div>
		<div class="h">�ǹ� ����</div>
		<div class="b" id="building">
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="�ܵ�����"><div class="button">�ܵ�����</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="�ٰ�������"><div class="button">�ٰ�������</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="����/����/�ټ���"><div class="button">����/����/�ټ���</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="������"><div class="button">������</div>
		</div>
		<div class="b" id="building_office">
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="���ǽ���"><div class="button">���ǽ���</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="��������Ȱ����"><div class="button">��������Ȱ����</div>
		</div>
		<div class="b" id="building_apart">
			<input type="hidden" name="BUILDING_TYPE" value="����Ʈ">
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">��ġ ����</div>
	<div class="tbody">
		<div class="h">�ּ�</div>
		<div class="b">
			�ּ�API ������ ����
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">�ŷ� ����</div>
	<div class="tbody">
		<div class="h">�ŷ� ����</div>
		<div class="b">
			<div>
				<input type="radio" name="TRADE_TYPE" class="TRADE_TYPE" value="����"><div class="button">����</div>
				<input type="radio" name="TRADE_TYPE" class="TRADE_TYPE" value="����"><div class="button">����</div>
			</div>
			<div id="monthly">
				<input type="number" name="MONTHLY_DEPOSIT" id="MONTHLY_DEPOSIT" placeholder="������">/
				<input type="number" name="MONTHLY_PAYMENT" id="MONTHLY_PAYMENT" placeholder="����"> ����
			</div>
			<div id="jeonsediv">
				<input type="number" name="JEONSE" id="JEONSE" placeholder="����"> ����
			</div>
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">�⺻ ����</div>
	<div class="tbody">
		<div class="h">�ǹ� ũ��</div>
		<div class="b">
			<div>
				���� ���� 
				<input type="number" name="SUPPLY_SIZE_P" id="SUPPLY_SIZE_P"> �� 
				<input type="number" name="SUPPLY_SIZE" id="SUPPLY_SIZE"> m2
			</div>
			<div>
				���� ���� 
				<input type="number" name="REAL_SIZE_P" id="REAL_SIZE_P"> �� 
				<input type="number" name="REAL_SIZE" id="REAL_SIZE"> m2
			</div>
		</div>
		<div class="h">�ǹ� ����</div>
		<div class="b">
			<div>
				�ǹ� ����
				<select name="BUILDING_STORY" id="BUILDING_STORY">
					<option>--�ǹ� ���� ����--</option>
					<c:forEach var="i" begin="1" end="50">
					<option value="${i}">${i}��</option>
					</c:forEach>
				</select>
			</div>
			<div>
				�ش� ����
				<select name="ROOM_FLOOR" id="ROOM_FLOOR">
					<option>--�ش� ���� ����--</option>
					<option value="0">������</option>
					<option value="-1">��ž</option>
					<c:forEach var="i" begin="1" end="50">
					<option value="${i}">${i}��</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="h">���� ����</div>
		<div class="b">
			<select name="HEATING_SYSTEM" id="HEATING_SYSTEM">
				<option>--���� ���� ����--</option>
				<option value="1">�߾ӳ���</option>
				<option value="2">��������</option>
				<option value="3">��������</option>
			</select>
		</div>
		<div class="h">���� ������</div>
		<div class="b"><input type="date" name="MOVE_IN_DATE" id="MOVE_IN_DATE"></div>
	</div>
</div>
<div class="table">
	<div class="thead">�߰�����</div>
	<div class="tbody">
		<div class="h">������</div>
		<div class="b">
			<div>
				<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK" value="0"><div class="button">����</div>
				<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK" value="1"><div class="button">����</div>
				<div class="UTILITY_PRICE">
				<input type="text" name="UTILITY_PRICE" id="UTILITY_PRICE"> ����
				</div>
			</div>
			<div>
				������ �׸�
				<input type="checkbox" class="UTILITY_TYPE" value="1"><div class="c_button">���ͳ�</div>
				<input type="checkbox" class="UTILITY_TYPE" value="2"><div class="c_button">����TV</div>
				<input type="checkbox" class="UTILITY_TYPE" value="3"><div class="c_button">û�Һ�</div>
				<input type="checkbox" class="UTILITY_TYPE" value="4"><div class="c_button">������</div>
				<input type="checkbox" class="UTILITY_TYPE" value="5"><div class="c_button">���ð���</div>
				<input type="checkbox" class="UTILITY_TYPE" value="6"><div class="c_button">���⼼</div>
				<input type="checkbox" class="UTILITY_TYPE" value="7"><div class="c_button">��Ÿ</div>
			</div>
		</div>
		<div class="h">��������</div>
		<div class="b">
			<input type="radio" class="PARKING" name="PARKING" value="0"><div class="button">�Ұ���</div>
			<input type="radio" class="PARKING" name="PARKING" value="1"><div class="button">����</div>
			<input type="number" name="PARKING_BILL" id="PARKING_BILL"> ����
		</div>
		<div class="h">�ݷ�����</div>
		<div class="b">
			<input type="radio" class="PET" name="PET" value="0"><div class="button">�Ұ���</div>
			<input type="radio" class="PET" name="PET" value="1"><div class="button">����</div>
		</div>
		<div class="h">����������</div>
		<div class="b">
			<input type="radio" class="ELEVATOR" name="ELEVATOR" value="0"><div class="button">����</div>
			<input type="radio" class="ELEVATOR" name="ELEVATOR" value="1"><div class="button">����</div>
		</div>
		<div class="h">������/���ڴ�</div>
		<div class="b">
			<input type="radio" class="BALCONY" name="BALCONY" value="0"><div class="button">����</div>
			<input type="radio" class="BALCONY" name="BALCONY" value="1"><div class="button">����</div>
		</div>
		<div class="h">��Ʈ��</div>
		<div class="b">
			<input type="radio" class="BUILT_IN" name="BUILT_IN" value="0"><div class="button">����</div>
			<input type="radio" class="BUILT_IN" name="BUILT_IN" value="1"><div class="button">����</div>
		</div>
		<div class="h">����</div>
		<div class="b">
			<input type="checkbox" class="STRUCTURES" value="1"><div class="c_button">����</div>
			<input type="checkbox" class="STRUCTURES" value="2"><div class="c_button">1.5��/�ֹ�и���</div>
		</div>
		<div class="h">�ɼ��׸�</div>
		<div class="b">
			<input type="checkbox" class="OPTIONS" value="1"><div class="c_button">������</div>
			<input type="checkbox" class="OPTIONS" value="2"><div class="c_button">��Ź��</div>
			<input type="checkbox" class="OPTIONS" value="3"><div class="c_button">ħ��</div>
			<input type="checkbox" class="OPTIONS" value="4"><div class="c_button">å��</div>
			<input type="checkbox" class="OPTIONS" value="5"><div class="c_button">����</div>
			<input type="checkbox" class="OPTIONS" value="6"><div class="c_button">TV</div>
			<input type="checkbox" class="OPTIONS" value="7"><div class="c_button">�Ź���</div>
			<input type="checkbox" class="OPTIONS" value="8"><div class="c_button">�����</div>
			<input type="checkbox" class="OPTIONS" value="9"><div class="c_button">����������</div>
			<input type="checkbox" class="OPTIONS" value="10"><div class="c_button">�δ���</div>
			<input type="checkbox" class="OPTIONS" value="11"><div class="c_button">���ڷ�����</div>
			<input type="checkbox" class="OPTIONS" value="12"><div class="c_button">���ڵ����</div>
			<input type="checkbox" class="OPTIONS" value="13"><div class="c_button">��</div>
		</div>
		<div class="h">�����ڱݴ���</div>
		<div class="b">
			<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="0"><div class="button">�Ұ���</div>
			<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="1"><div class="button">����</div>
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">�󼼼���</div>
	<div class="tbody">
		<div class="h">����</div>
		<div class="b"><input type="text" name="DESC_TITLE" id="DESC_TITLE" placeholder="��)"></div>
		<div class="h">�󼼼���</div>
		<div class="b"><textarea name="DESC_DETAIL" id="DESC_DETAIL" placeholder="�󼼼��� �ۼ� �� ���ǻ���&#13;&#10;����"></textarea></div>
		<div class="h">����� �޸�</div>
		<div class="b"><textarea name="DESC_SECRET" id="DESC_SECRET" placeholder="�ܺο� �������� ������, ����ڿ��Ը� �������� �޸��Դϴ�."></textarea></div>
	</div>
</div>
<div class="table">
	<div class="thead">���� ���</div>
	<div class="tbody">
		<div>
			- ������ ���η� ���� ������ �����մϴ�. (���� ������ �ּ� 800px)<br>
			- ���� �뷮�� ���� �� ��� 10MB���� ����� �����մϴ�.<br>
			- ������ �ּ� 1�� �̻� ����ؾ� �ϸ�, �ִ� 15����� �����մϴ�. �� �̻� ����� ��� ���ε� �ð��� �ټ� ������ �� �ֽ��ϴ�.
		</div>
		<div id="fileDiv">
			<p>
				<input type="file" id="file" name="file_0">
				<a href="#" class="btn" id="delete" name="delete">����</a>
			</p>
		</div>
		<a href="#addFile" class="btn" id="addFile" onclick="addFile();">���� �߰�</a>
		<div class="caution">
			���� �Ź��� ����� ��� �ϳ��濡�� ���Ƿ� ���� �� �Ź� ��ü ���� ó���˴ϴ�.
			<a href="#">�����Ź� ���� ��å Ȯ���ϱ�</a>
		</div>
	</div>
</div>
</form>
<div class="check">
	<input type="checkbox" id="check">�Ź����������� Ȯ���Ͽ�����, �Է��� ������ ���� �Ź��� �ٸ��� �����ϴ�.
</div>

<a href="#" class="btn" onclick="submit();">�Ź� ���</a>
<a href="<c:url value='/room/adminRoom'/>" class="btn">���</a>

</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>