<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
/* �ǹ� ������ ���� ���� �ɼ� �޶����� */
/* �ּ� API */
/* ����/���� �����ϸ� �ݾ��Է� â �߰� */
/* div �����ϸ� ���� üũ�ǰ� div ��Ÿ�� �ٲ� */
/* ������ ���� ������ UTILITY_PRICE ���̰� */
/* div �����ϸ� üũ�ڽ� üũ�ǰ� div ��Ÿ�� �ٲ� */
/* �������� 1�̸� �����ݾ� ����Ұ����� ���氡������ �ٲ�� */
/* �������� 0�̸� �����ݾ� ���氡�ɿ��� ����Ұ��� �ٲ�� ��� ���� */
/* ���� ����� �� �̹��� ���ϸ� ��ϵǰ� �����Ѱ�? ���� �����ϰ���.. */
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
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="room.jspf" %>
<div class="roomWrite">

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
				<input type="radio" name="trade_type" class="trade_type" value="����"><div class="button">����</div>
				<input type="radio" name="trade_type" class="trade_type" value="����"><div class="button">����</div>
			</div>
			<div id="monthly">
				<input type="number" name="deposit" id="deposit" placeholder="������">/
				<input type="number" name="pay" id="pay" placeholder="����"> ����
			</div>
			<div id="jeonsediv">
				<input type="number" name="jeonse" id="jeonse" placeholder="����"> ����
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
				<input type="number" name="sup_p" id="sup_p"> �� 
				<input type="number" name="sup_m" id="sup_m"> m2
			</div>
			<div>
				���� ���� 
				<input type="number" name="real_p" id="real_p"> �� 
				<input type="number" name="real_m" id="real_m"> m2
			</div>
		</div>
		<div class="h">�ǹ� ����</div>
		<div class="b">
			<div>
				�ǹ� ����
				<select name="building_story" id="building_story">
					<option>--�ǹ� ���� ����--</option>
					<c:forEach var="i" begin="1" end="50">
					<option value="${i}">${i}��</option>
					</c:forEach>
				</select>
			</div>
			<div>
				�ش� ����
				<select name="room_floor" id="room_floor">
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
			<select name="heating_system" id="heating_system">
				<option>--���� ���� ����--</option>
				<option value="1">�߾ӳ���</option>
				<option value="2">��������</option>
				<option value="3">��������</option>
			</select>
		</div>
		<div class="h">���� ������</div>
		<div class="b"><input type="date" name="move_in_date" id="move_in_date"></div>
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
			<input type="checkbox" class="OPTIONS" value="4"><div class="c_button">����</div>
			<input type="checkbox" class="OPTIONS" value="5"><div class="c_button">TV</div>
			<input type="checkbox" class="OPTIONS" value="6"><div class="c_button">�Ź���</div>
			<input type="checkbox" class="OPTIONS" value="7"><div class="c_button">�����</div>
			<input type="checkbox" class="OPTIONS" value="8"><div class="c_button">����������</div>
			<input type="checkbox" class="OPTIONS" value="9"><div class="c_button">�δ���</div>
			<input type="checkbox" class="OPTIONS" value="10"><div class="c_button">���ڷ�����</div>
			<input type="checkbox" class="OPTIONS" value="11"><div class="c_button">���ڵ����</div>
			<input type="checkbox" class="OPTIONS" value="12"><div class="c_button">��</div>
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