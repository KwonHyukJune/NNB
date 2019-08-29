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
		var strUrl = "<%=request.getContextPath()%>"+url;
		window.open(strUrl);
	};
	 $(document).ready(function(){
		$("#favMate").on("click",function(e){
			e.preventDefault();
			insertFav();
		});
	});  
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/addFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID","${MEM_ID}");
		comAjax.addParam("check",'0');
		comAjax.ajax();
	}
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/deleteFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID","${MEM_ID}");
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

<%@ include file="/WEB-INF/include/header.jspf" %>
</head>
<body>
<div class="roommateList" >
	<table style="min-height:1000px;">
	<div class="search">
		<ul class="qUCQS">
			<li class="pbYHJ">
			<form id="frm">
		<div style="color:white">닉네임<p><input type="text" name="MEM_NICK"  id="MEM_NICK" ></p>
		<select id="RI_GENDER" name="RI_GENDER">
			<option value="">성별</option>
			<option value="F">여성</option>
			<option value="M">남성</option>
		</select>	

		나이대:<p><input type="text" id="minyear"  name="minyear">~<input type="text" id="maxyear"  name="maxyear"></p>
	<!-- 	<input type="range" class="slider" id="ageMin" step="1" min="0" max="50" value="0"><input type="range" class="slider" id="ageMax" step="1" min="50" max="100" value="100">  -->
		보증금:<p><input type="text" id="mindeposit" name="mindeposit">~<input type="text" id="maxdeposit" name="maxdeposit"></p></div>
	<div style="color:white;">	월세:<p><input type="text" id="minrent" name="minrent" >~<input type="text" id="maxrent" name="maxrent" ></p>
		기간:<p><input type="text" id="mindate" name="mindate" >~<input type="text" id="maxdate" name="maxdate" ></p>
		지도:...
		<button>검색</button></div>
	</form></li></ul>
</div>

총 ${Count}명의 검색 결과가 있습니다.
<c:if test="${Count!=null && Count!=''}">
<div class="mateList" id="mateList">
	<ul class="qUCQS1">
		<li style="width:16%;">닉네임</li>
		<li style="width:16%;">나이</li>
		<li style="width:16%;">성별</li>
		<li style="width:16%;">지역</li>
		<li style="width:16%;">부담가능금액</li>
		<li style="width:16%;">&nbsp;&nbsp;&nbsp;</li>
	</ul>
	
	<c:forEach var="mate" items="${searchRoommate}">
	<div class="mate" id="mate">
	<a href="#" onclick="openDetail('/roommate/detail?id=${mate.RI_MEM_ID}');" class="btn">
		<ul class="qUCQS2">
		<li style="width:16%;">${mate.MEM_NICK}</li>
		<li style="width:16%;">${mate.RI_BIRTH}</li>
		<li style="width:16%;" >${mate.RI_GENDER}</li>
		<li style="width:16%;">${mate.RI_REGION1}</li>
		<li style="width:16%;">${mate.RI_LOAN_BIG}/${mate.RI_LOAN_SMALL}</li>
	<li style="width:16%;"><a href="#" class="btn" id="favMate">찜하기</a></li>
</ul>
	</a>
	</div>

		<c:if test="${mate.check=='1'}">
		<div class="p6">
			<div class="deleteFav" onclick="deleteFav(${mate.RI_MEM_ID});">
			</div>
		</div>
		</c:if>
		<c:if test="${check.equals('0')}">
		<div class="p6">
			<div class="insertFav" onclick="insertFav(${mate.RI_MEM_ID});">
			</div>
		</div>
		</c:if>
	</div>
	</c:forEach>

</div>

</c:if>
<c:if test="${Count==null || Count==''}">
	아직 등록된 사용자가 없습니다.<br>
	<a href="<c:url value='/myPage/registMyProfileForm'/>" class="btn">룸메이트 정보 등록하러 가기</a>
</c:if>

</table>
</div>
<br>
<div>
 <%@ include file="/WEB-INF/include/footer.jspf" %>

</div>
</body>
</html>
