<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
/* 	window.onload = function(){
		document.getElementById("minyear").value = document.getElementById("minyear").value;
		document.getElementById("maxyear").value = document.getElementById("maxyear").value;
	}
	$(document).ready(function(){
		$("#minyear").on("change",function(){
			fn_ageMin();
		});
		$("#minyear").on("change",function(){
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
/* 	$(document).ready(function(){
		$("#search").on("click",function(e){
			e.preventDefault();
			fn_searchBoard();;
		});
	}); */
	
	
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
			comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/roommate/search'/>");
			frm.submit();
		});
	};
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("MEM_NICK","${MEM_NICK}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("RI_GENDER","${RI_GENDER}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});

	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("minyear","${minyear}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("maxyear","${maxyear}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("minrent","${minrent}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("maxrent","${maxrent}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("mindate","${mindate}")
			e.preventDefault();
			fn_searchBoard();;
		});
	});
	$(document).ready(function(){
		$("#search").on("click",function(e){
			comAjax.addParam("maxdate","${maxdate}")
			e.preventDefault();
			fn_searchBoard();;
		});
	}); 

	function fn_search(){
		var comSubmit = new ComSubmit("frm");
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
		
	�г���<input type="text" name="MEM_NICK" id="MEM_NICK">
		<select id="RI_GENDER" name="RI_GENDER">
			<option value="">����</option>
			<option value="F">����</option>
			<option value="M">����</option>
		</select>
		���̴�<input type="text" id="minyear" name="minyear">~
	<!-- 	<input type="range" class="slider" id="ageMin" step="1" min="0" max="50" value="0"><input type="range" class="slider" id="ageMax" step="1" min="50" max="100" value="100">  -->
		<input type="text" id="maxyear" name="maxyear"><div id="maxyear"></div>
	<br/>	������ <input type="text" id="mindeposit" name="mindeposit">~<input type="text" id="maxdeposit" name="maxdeposit">
	<br/>	���� <input type="text" id="minrent" name="minrent">~<input type="text" id="maxrent" name="maxrent">
	<br/>	�Ⱓ<input type="text" id="mindate" name="mindate"><input type="text" id="maxdate" name="maxdate">
		<input type="submit" id="search"  value="�˻�">
		
	</form>
</div>
<p>�� ${Count}���� �˻� ����� �ֽ��ϴ�.</p>
<c:if test="${Count!=null && Count!=''}">
<div class="mateList">
	<div class="listheader">
		<div class="p1">�г���</div>
		<div class="p2">����</div>
		<div class="p3">����</div>
		<div class="p4">����</div>
		<div class="p5">�δ㰡�ɱݾ�</div>
		<div class="p6">���ϱ�</div>
		
	</div>
	
	<c:forEach var="mate" items="${searchRoommate}">
	<div class="mate">
	<a href="#" onclick="openDetail('/roommate/detail?id=${mate.RI_MEM_ID}');" class="btn">
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
<c:if test="${Count==null || Count==''}">
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
