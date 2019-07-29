<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> mate1 = new HashMap<String,Object>();
	mate1.put("check","1");
	mate1.put("RI_MEM_NUM","1");
	mate1.put("MEM_NICK","withfour");
	mate1.put("RI_AGE","24");
	mate1.put("RI_GENDER","����");
	mate1.put("RI_REGION1","����");
	mate1.put("RI_LOAN_BIG","300");
	mate1.put("RI_LOAN_SMALL","30");
	Map<String,Object> mate2 = new HashMap<String,Object>();
	mate2.put("check","0");
	mate2.put("RI_MEM_NUM","2");
	mate2.put("MEM_NICK","withfour");
	mate2.put("RI_AGE","24");
	mate2.put("RI_GENDER","����");
	mate2.put("RI_REGION1","����");
	mate2.put("RI_LOAN_BIG","300");
	mate2.put("RI_LOAN_SMALL","30");
	
	List<Map<String,Object>> mateList = new ArrayList<Map<String,Object>>();
	mateList.add(mate1);
	mateList.add(mate2);
	
	int count = mateList.size();
	request.setAttribute("count", count);
	request.setAttribute("mateList",mateList);
	
	request.setAttribute("MEM_ID", "id1");
%>
<!-- �׽�Ʈ�� ���� �� -->

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
/* 	window.onload = function(){
		document.getElementById("ageMinValue").value = document.getElementById("ageMin").value;
		document.getElementById("ageMaxValue").value = document.getElementById("ageMax").value;
	}
	$(document).ready(function(){
		$("#ageMin").on("change",function(){
			fn_ageMin();
		});
		$("#ageMax").on("change",function(){
			fn_ageMax();
		})
	});
	function fn_ageMin(){
		var x = document.getElementById("ageMin");
		var y = document.getElementById("ageMinValue");
		var z = document.getElementById("ageMax");
		var w = document.getElementById("ageMaxValue");
		y.value = x.value;
		w.value = z.value;
		if(z.value<x.value){
			z.value = x.value+1;
		}
		z.min = x.value;
		x.style.width = 100+Number(x.value)+"px";
		z.style.width = 100-Number(x.value)+"px";
	};
	function fn_ageMax(){
		var x = document.getElementById("ageMax");
		var y = document.getElementById("ageMaxValue");
		var z = document.getElementById("ageMin");
		var w = document.getElementById("ageMinValue");
		y.value = x.value;
		w.value = z.value;
		if(z.value>x.value){
			z.value = x.value-1;
		}
		z.max = x.value;
		x.style.width = 100-Number(x.value)+"px";
		z.style.width = 100+Number(x.value)+"px";
	}; */
	function openDetail(url){
		var strUrl = "/nnb"+url;
		window.open(strUrl);
	};
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/addFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		comAjax.ajax();
	}
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/deleteFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		comAjax.ajax();
	};
	window.onload = function(){
		$("#search").on("click",function(){
			fn_search();
		});
	};
	function fn_search(){
		var comSubmit = new ComSubmit(frm);
		comSubmit.setUrl("<c:url value='/roommate/search'/>");
		comSubmit.addParam("IGNORE_MEM",mem);
		comSubmit.submit(frm);
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="roommateList">

<div class="title">�����Ʈ ã��</div>
<div class="search">
	<form id="frm">
		���� �Ѥ� ������? �˻�����?
		<select id="gender" name="gender">
			<option value="">����</option>
			<option value="F">����</option>
			<option value="M">����</option>
		</select>
		���� 
		<input type="text" id="ageMinValue">~
<!-- 		<input type="range" class="slider" id="ageMin" step="1" min="0" max="50" value="0"><input type="range" class="slider" id="ageMax" step="1" min="50" max="100" value="100"> -->
		<input type="text" id="ageMaxValue">
		������ <input type="text" id="depositMin">~<input type="text" id="depositMax">
		���� <input type="text" id="monthlyPayMin">~<input type="text" id="monthlyPayMax">
		<a href="#" id="search" class="btn">�˻�</a>
	</form>
</div>

<p>�� ${count}���� �˻� ����� �ֽ��ϴ�.</p>
<c:if test="${count!=null && count!=''}">
<div class="mateList">
	<div class="listheader">
		<div class="p1">�г���</div>
		<div class="p2">����</div>
		<div class="p3">����</div>
		<div class="p4">����</div>
		<div class="p5">�δ㰡�ɱݾ�</div>
		<div class="p6">���ϱ�</div>
	</div>
	<c:forEach var="mate" items="${mateList}">
	<div class="mate">
	<a href="#" onclick="openDetail('/roommate/detail?num=${mate.RI_MEM_NUM}');" class="btn">
		<div class="p1">${mate.MEM_NICK}</div>
		<div class="p2">${mate.RI_AGE}</div>
		<div class="p3">${mate.RI_GENDER}</div>
		<div class="p4">${mate.RI_REGION1}</div>
		<div class="p5">${mate.RI_LOAN_BIG}/${mate.RI_LOAN_SMALL}</div>
	</a>
		<c:if test="${mate.check=='1'}">
		<div class="p6">
			<div class="deleteFav" onclick="deleteFav(${mate.RI_MEM_NUM});">
			</div>
		</div>
		</c:if>
		<c:if test="${mate.check=='0'}">
		<div class="p6">
			<div class="insertFav" onclick="insertFav(${mate.RI_MEM_NUM});">
			</div>
		</div>
		</c:if>
	</div>
	</c:forEach>
</div>
</c:if>
<c:if test="${count==null || count==''}">
	���� ��ϵ� ����ڰ� �����ϴ�.<br>
	<a href="<c:url value='/myPage/registMyProfileForm'/>" class="btn">�����Ʈ ���� ����Ϸ� ����</a>
</c:if>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
