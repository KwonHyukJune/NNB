<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script src="<c:url value='/js/nouislider/nouislider.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	
	function openDetail(obj){
		var url = obj.parent().prev().text();
		var strUrl = "<%=request.getContextPath()%>"+"/roommate/detail?id="+url;
		window.open(strUrl,'openDetail','width=426,height=623,toolbar=no,'+ 
				+'menubar=no, scrollbars=no, resizable=yes');
	};
	 $(document).ready(function(){
		$("#favMate").on("click",function(e){
			e.preventDefault();
			insertFav();
		});
	});  
	function fn_addFav(obj){
		var str = window.location.href;
		var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
		var num = obj.children('#num').text();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/roommate/addFavRoommate'/>");
		comSubmit.addParam("check", 0);
		comSubmit.addParam("RI_MEM_ID", num);
		comSubmit.addParam("MEM_ID", idChk);
		comSubmit.addParam("url", url);
		comSubmit.submit();
	}
	function fn_deleteFav(obj){
		var str = window.location.href;
		var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
		var num = obj.children('#num').text();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/roommate/addFavRoommate'/>");
		comSubmit.addParam("check", 1);
		comSubmit.addParam("RI_MEM_ID", num);
		comSubmit.addParam("MEM_ID", idChk);
		comSubmit.addParam("url", url);
		comSubmit.submit();
	}

	function fn_search(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/roommate/search'/>");
		comSubmit.addParam("IGNORE_MEM",mem);
		comSubmit.submit(frm);
	}
	
	function toggle(obj){
		if(obj.attr("class")=="fJNXpX"){
			$(".cRtqxV").attr("class","fJNXpX");
			$(".hKGAZL").attr("class","fUMVvC");
			$(".kdfXro").attr("class","bAZEbe");
			$(".fhfjff").hide();
			$(".dIVcAa").hide();
			obj.attr("class","cRtqxV");
			obj.next().show();
		}else if(obj.attr("class")=="cRtqxV"){
			obj.attr("class","fJNXpX");
			obj.next().hide();
		}
		if(obj.attr("class")=="fUMVvC"){
			$(".cRtqxV").attr("class","fJNXpX");
			$(".hKGAZL").attr("class","fUMVvC");
			$(".kdfXro").attr("class","bAZEbe");
			$(".fhfjff").hide();
			$(".dIVcAa").hide();
			obj.attr("class","hKGAZL");
			obj.next().show();
		}else if(obj.attr("class")=="hKGAZL"){
			obj.attr("class","fUMVvC");
			obj.next().hide();
		}
		if(obj.attr("class")=="bAZEbe"){
			$(".cRtqxV").attr("class","fJNXpX");
			$(".hKGAZL").attr("class","fUMVvC");
			$(".kdfXro").attr("class","bAZEbe");
			$(".fhfjff").hide();
			obj.attr("class","kdfXro");
			obj.next().show();
		}else if(obj.attr("class")=="kdfXro"){
			obj.attr("class","bAZEbe");
			obj.next().hide();
		}
	}
</script>

<%@ include file="/WEB-INF/include/header.jspf" %>
</head> 
<body>
<div class="roommateList" style="height:1000px;">
	<div class="search">
		<ul class="qUCQS">
			<li class="pbYHJ">
				<form id="frm"> 
					<div style="color:white">닉네임<p style="border:0px;"><input type="text" name="MEM_NICK"  id="MEM_NICK" ></p>
						<select id="RI_GENDER" name="RI_GENDER">
							<option value="">성별</option>
							<option value="F">여성</option>
							<option value="M">남성</option>
						</select>	
						기간<p><input type="date" id="mindate" name="mindate" >~<input type="date" id="maxdate" name="maxdate" ></p>
						<button class="button size-btn" onclick="fn_search();" type="button" id="search">검색</button>
					</div>
					<div class="hasdf">
			
						<div class="hWgOZv">
							<div class="fUMVvC" onclick="toggle($(this));">
								<p id="alks"><span style="color:white;">나이대</span></p>
								<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
							</div>
							<div class="fhfjff" style="left:0px;">
								<div class="fBFAQm">
									<h1 class="lmqlXb">나이대<p class="eavwzc" id='p3'></p></h1>
									<div class="jqwYlT">
										<input type="hidden" id="minyear"  name="minyear">
										<input type="hidden" id="maxyear"  name="maxyear">
										<div class="noUi-target noUi-ltr noUi-horizontal"></div>
									</div>
									<ul class="ghXquW">
										<li>20</li>
										<li>60</li>
										<li>무제한</li>
									</ul>
								</div>
								<div class="kaLNCK">
									<button class="dBaYDj">
										<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
										조건삭제
									</button>
								</div>
							</div>
						</div>	
						<div class="hWgOZv">
							<div class="fUMVvC" onclick="toggle($(this));">
								<p id="alks"><span style="color:white;">보증금</span></p>
								<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
							</div>
							<div class="fhfjff" style="left:0px;">
								<div class="fBFAQm">
									<h1 class="lmqlXb">보증금<p class="eavwzc" id='p1'></p></h1>
									<div class="jqwYlT">
										<input type="hidden" id="mindeposit" name="mindeposit">
										<input type="hidden" id="maxdeposit" name="maxdeposit">
										<div class="noUi-target noUi-ltr noUi-horizontal"></div>
									</div>
									<ul class="ghXquW">
										<li>0</li>
										<li>1억 1000만 원</li>
										<li>무제한</li>
									</ul>
								</div>
								<div class="kaLNCK">
									<button class="dBaYDj">
										<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
										조건삭제
									</button>
								</div>
							</div>
						</div>
						<div class="hWgOZv">
							<div class="fUMVvC" onclick="toggle($(this));">
								<p id="alks"><span style="color:white;">월세</span></p>
								<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
							</div>
							<div class="fhfjff" style="left:0px;">
								<div class="fBFAQm">
									<h1 class="lmqlXb">월세<p class="eavwzc" id='p2'></p></h1>
									<div class="jqwYlT">
										<input type="hidden" id="minrent" name="minrent" >
										<input type="hidden" id="maxrent" name="maxrent" >
										<div class="noUi-target noUi-ltr noUi-horizontal"></div>
									</div>
									<ul class="ghXquW">
										<li>0</li>
										<li>150만 원</li>
										<li>무제한</li>
									</ul>
								</div>
								<div class="kaLNCK">
									<button class="dBaYDj">
										<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
										조건삭제
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</li>
		</ul>
	</div>

	<div id="count"></div>
	<ul class="mateList" id="mateList"></ul>
	<div class="dzQBoq" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
</div>
<div>
 <%@ include file="/WEB-INF/include/footer.jspf" %>
</div>

<script type="text/javascript">
$(document).ready(function(){
	fn_selectSearchRoommateList(1);
});

function fn_search(){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/searchRoommateList'/>");
	comAjax.setCallback("fn_selectSearchRoommateListCallback");

	comAjax.addParam("minyear",$("#minyear").val());
	comAjax.addParam("maxyear",$("#maxyear").val());
	comAjax.addParam("mindeposit",$("#mindeposit").val());
	comAjax.addParam("maxdeposit",$("#maxdeposit").val());
	comAjax.addParam("minrent",$("#minrent").val());
	comAjax.addParam("maxrent",$("#maxrent").val());
	comAjax.addParam("mindate",$("#mindate").val());
	comAjax.addParam("maxdate",$("#maxdate").val());
	comAjax.addParam("RI_GENDER",$("#RI_GENDER").val());
	comAjax.addParam("MEM_NICK",$("#MEM_NICK").val());
	
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax();
}

function fn_selectSearchRoommateList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/searchRoommateList'/>"); 
	comAjax.setCallback("fn_selectSearchRoommateListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectSearchRoommateListCallback(data){ 
	var total = data.total; 
	var body = $("ul#mateList"); 
	body.empty(); 
	var count = $("#count");
	count.empty();
	
	if(total == 0){ 
		var str = "아직 등록된 사용자가 없습니다.<br>"
				+ "<a href='<c:url value='/myPage/registMyProfileForm'/>' class='btn'>룸메이트 정보 등록하러 가기</a>"; 
		body.append(str);
        	
	} else{ 
		var params = { 
			divId : "PAGE_NAVI", 
			pageIndex : "PAGE_INDEX", 
			totalCount : total, 
			eventName : "fn_selectSearchRoommateList" 
			}; 
		
		gfn_renderPaging(params); 
		count.append("<p>총 "+total+"명의 검색 결과가 있습니다.</p>");
		var str	=	"<li class='qUCQS1'>"
					+	"<p>닉네임</p>"
					+	"<p>나이</p>"
					+	"<p>성별</p>"
					+	"<p>지역</p>"
					+	"<p>부담가능금액</p>"
					+	"<p>&nbsp;&nbsp;&nbsp;</p>"
				+	"</li>"
		$.each(data.list, function(key, mate){ 
			str	+=	"<div class='id' style='display:none;'>" + mate.RI_MEM_ID + "</div>"
				+	"<li class='qUCQS2'>"
					+	"<a href='#' onclick='openDetail($(this));' class='btn'>"
						+	"<div>" + mate.MEM_NICK + "</div>"
						+	"<div>" + mate.RI_BIRTH + "</div>"
						+	"<div>";
						if(mate.RI_GENDER=='F'){
			str	+=			"여자";
						}else if(mate.RI_GENDER=='M'){
			str	+=			"남자";
						}
			str	+=			"</div>"
						+	"<div>" + mate.RI_REGION1 + "</div>"
						+	"<div>" + mate.RI_LOAN_BIG + "/" + mate.RI_LOAN_SMALL + "</div>"
					+	"</a>"
						+	"<div>";
 			if(mate.RI_MEM_ID in data.favMateNum){
						str	+=	"<div class='deleteFav' onclick='fn_deleteFav($(this));'>"
								+	"<div id='num' style='display:none;'>"
									+	mate.RI_MEM_ID
								+	"</div>"
							+	"</div>";
			}else{
						str	+=	"<div class='insertFav' onclick='fn_addFav($(this));'>"
								+	"<div id='num' style='display:none;'>"
									+	mate.RI_MEM_ID
								+	"</div>"
							+	"</div>";
			} 
					str	+=	"</div>"
				+	"</li>";
       	}); 
       	body.append(str); 
	} 
}
</script>
<script type="text/javascript">
$(function(){
	var sliders = document.getElementsByClassName('noUi-target');
	for(var i=0; i<sliders.length; i++){
		noUiSlider.create(sliders[i], {
			start: [0,100],
			step: 2,
	        connect: true,
	        margin: 2,
	        range: { 'min': 0, 'max': 100 }
		});
	}
	//보증금
	sliders[1].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#mindeposit");
		var input1 = $("#maxdeposit");
		var input_value = [];
		if(values[0]<=10){
			input_value[0] = values[0]*50;
		}else if(values[0]<=48){
			input_value[0] = values[0]*250-2000;
		}else if(values[0]<=68){
			input_value[0] = values[0]*500-14000;
		}else if(values[0]==100){
			input_value[0] = '무제한';
		}
		else{
			input_value[0] = values[0]*2500-150000;
		}
		if(values[1]<=10){
			input_value[1] = values[1]*50;
		}else if(values[1]<=48){
			input_value[1] = values[1]*250-2000;
		}else if(values[1]<=68){
			input_value[1] = values[1]*500-14000;
		}else if(values[1]==100){
			input_value[1] = '무제한';
		}
		else{
			input_value[1] = values[1]*2500-150000;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p1').text('');
		var str = '';
		if(input_value[0]=='0'){
			str += '0원';
		}else if(input_value[0]>=10000){
			str += parseInt(input_value[0]/10000) + '억' + (input_value[0]%10000==0?' 원':(input_value[0]%10000 + '만 원'));
		}else{
			str += input_value[0] + '만 원';
		}
		str += ' ~ '
			if(input_value[1]=='무제한'){
				str += '무제한';
			}else if(input_value[1]>=10000){
			str += parseInt(input_value[1]/10000) + '억' + (input_value[1]%10000==0?' 원':(input_value[1]%10000 + '만 원'));
		}else{
			str += input_value[1] + '만 원';
		}
	    $('#p1').text(str);
	    $("#search").trigger('click');
	});
	//월세
	sliders[2].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#minrent");
		var input1 = $("#maxrent");
		var input_value = [];
		if(values[0]<=40){
			input_value[0] = values[0]*2.5;
		}else if(values[0]<=60){
			input_value[0] = values[0]*5-100;
		}else if(values[0]==100){
			input_value[0] = '무제한';
		}
		else{
			input_value[0] = values[0]*25-1300;
		}
		if(values[1]<=40){
			input_value[1] = values[1]*2.5;
		}else if(values[1]<=60){
			input_value[1] = values[1]*5-100;
		}else if(values[1]==100){
			input_value[1] = '무제한';
		}
		else{
			input_value[1] = values[1]*25-1300;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p2').text('');
		var str = '';
		if(input_value[0]=='0'){
			str += '0원';
		}else{
			str += input_value[0] + '만 원';
		}
		str += ' ~ '
			if(input_value[1]=='무제한'){
				str += '무제한';
		}else{
			str += input_value[1] + '만 원';
		}
	    $('#p2').text(str);
	    $("#search").trigger('click');
	});
	//나이대
	sliders[0].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#minyear");
		var input1 = $("#maxyear");
		
		var input_value = [];
		input_value[0]=values[0]*1+20;
		var str = Number(input_value[0]) + '세 ~ ';
		if(values[1]==100){
			input_value[1] = '무제한';
			str += '무제한';
		}else {
			input_value[1] = values[1]*1+20;
			str += Number(input_value[1])+'세';
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p3').text('');
	    $('#p3').text(str);
	    $("#search").trigger('click');
	});
/* 	$("input[type=hidden]").change(function(){
		console.log("dd:");
		fn_search();
	}); */
});
</script>
</body>
</html>
