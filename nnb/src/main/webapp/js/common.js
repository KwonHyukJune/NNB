function gfn_isNull(str){ //null 값을 체크하는 함수
	if(str==null) return true;
	if(str=="NaN") return true;
	if(new String(str).valueOf()=="undefined") return true;
	var chkStr = new String(str);
	if(chkStr.valueOf()=="undefined") return true;
	if(chkStr==null) return true;
	if(chkStr.toString().length==0) return true;
	return false;
}

function ComSubmit(opt_formId){ 
	this.formId = gfn_isNull(opt_formId)==true? "commonForm" : opt_formId; // 값이 없으면 commonForm, 있으면 그 아이디를 formId에 넣는다. 
	this.url = ""; 
	
	if(this.formId=="commonForm"){
		var frm = $("#commonForm");
		if(frm.length>0){
			frm.remove();
		}
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"'>"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		console.log('ddd'+this.url);
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
	
	this.delParam = function delParam(){
		var del = document.getElementById(this.formId);
		while(del.firstChild){
			del.removeChild(del.firstChild);
		}
	};
}

/* ajax */
var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
	this.url = "";
	this.formId = gfn_isNull(opt_formId)==true? "commonForm": opt_formId;
	this.param = "";
	
	if(this.formId=="commonForm"){
		var frm = $("#commonForm");
		if(frm.length>0){
			frm.remove();
		}
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.setCallback = function setCallback(callBack){ //데이터를 전송한 후 호출 될 함수를 지정.
		fv_ajaxCallback = callBack;
	};
	
	this.addParam = function addParam(key,value){
		this.param = this.param+"&"+key+"="+value;
	};
	
	this.ajax = function ajax(){
		if(this.formId!="commonForm"){
			this.param += "&"+$("#"+this.formId).serialize();
		}
		$.ajax({
			url:this.url,
			type:"POST", //통신 방식을 설정. 그냥 post로 지정
			data:this.param, //서버로 전달한 인자 (parameter), 보통은 object형식으로 데이터를 지정.//여기서는 addParam또는 form 자체를 전송하기때문에 이렇게 만듬 
			async:false, 
			success:function(data,status){
				if(typeof(fv_ajaxCallback)=="function"){
					fv_ajaxCallback(data);
				}
				else{
					eval(fv_ajaxCallback+"(data);");
				}
			}
		});
	};
}
/* paging tag */
/*
/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수 
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
	var divId = params.divId; //페이징이 그려질 div id
	gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
	var totalCount = params.totalCount; //전체 조회 건수
	var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount; //페이지당 레코드 수
	if(gfn_isNull(recordCount) == true){
		recordCount = 20;
	}
	var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "";
	var postStr = "";
	var str = "";
	
	var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
	var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1; 
	var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
				"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
	}
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
					"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	}
	
	for(var i=first; i<(first+last); i++){
		if(i != currentIndex){
			str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
		}
		else{
			str += "<strong><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></strong>";
		}
	}
	$("#"+divId).append(preStr + str + postStr);
}

function _movePage(value){
	$("#"+gfv_pageIndex).val(value);
	if(typeof(gfv_eventName) == "function"){
		gfv_eventName(value);
	}
	else {
		eval(gfv_eventName + "(value);");
	}
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
//쿠키 맨
function setCookie(cookie_name, value, days) {
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + days);
	  // 설정 일수만큼 현재시간에 만료값으로 지정

	  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	  document.cookie = cookie_name + '=' + cookie_value+';path=/';
	}

function getCookie(cookie_name) {
	  var x, y;
	  var val = document.cookie.split(';');

	  for (var i = 0; i < val.length; i++) {
	    x = val[i].substr(0, val[i].indexOf('='));
	    y = val[i].substr(val[i].indexOf('=') + 1);
	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
	    if (x == cookie_name) {
	      return unescape(y); // unescape로 디코딩 후 값 리턴
	    }
	  }
	}

function addCookie(cookieName,id) {
	  var items = getCookie(cookieName); // 이미 저장된 값을 쿠키에서 가져오기
	  var maxItemNum = 50; // 최대 저장 가능한 아이템개수
	  var expire = 7; // 쿠키값을 저장할 기간
	  if (items) {
	    var itemArray = items.split(',');
	    if (itemArray.indexOf(id) != -1) {
	      // 이미 존재하는 경우 종료
	      console.log('Already exists.');
	    }
	    else {
	      // 새로운 값 저장 및 최대 개수 유지하기
	      itemArray.unshift(id);
	      if (itemArray.length > maxItemNum ) itemArray.length = 5;
	      items = itemArray.join(',');
	      setCookie(cookieName, items, expire);
	    }
	  }
	  else {
	    // 신규 id값 저장하기
	    setCookie(cookieName, id, expire);
	  }
	}