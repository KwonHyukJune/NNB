<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 수정 폼</title>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminBank.css'/>"/>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#update").on("click", function(e){ //작성하기 버튼
		updateBoard();
	});
		
	function updateBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/bankModify'/>");
		comSubmit.submit();
	}
});

   function frameclose() { 
      parent.close() 
      window.close() 
      self.close() 
      } 
   

   
   function fn_deleteFile1(obj){ 
		obj.prev().val('');
		obj.prev().prev().val('');
		console.log("qka?:"+"${bank.BANK_STORED_FILE1!=null}");
		if("${bank.BANK_STORED_FILE1!=null}"){
			str = "<input type='hidden' name='delete1' value='1'>";
			$("form[name='bankWriteForm']").append(str);
		}
		obj.prev().prev().prev().text('');
   }
   function fn_deleteFile2(obj){ 
		obj.prev().val('');
		obj.prev().prev().val('');
		if("${bank.BANK_STORED_FILE2!=null && bank.BANK_STORED_FILE2!=''}"){
			str = "<input type='hidden' name='delete2' value='1'>";
			$("form[name='bankWriteForm']").append(str);
		}
		obj.prev().prev().prev().text('');
   }
   
   $(document).ready(function(){
		$("a[name='delete1']").on("click",function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile1($(this));
		});
		$("a[name='delete2']").on("click",function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile2($(this));
		});
      (function(){
         var value = "${bank.BANK_KIND}";
         var key = $("select[name='BANK_KIND']>option");
         for(var i=0;i<key.length;i++){
            if(key[i].value==value){
               key[i].selected = true;
            }
         };
      })();   
      (function(){
         var value = "${bank.BANK_TITLE}";
         var key = $("input[name='BANK_TITLE']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();   
      (function(){
         var value = "${bank.BANK_CONTENT}";
         var key = $("textarea[name='BANK_CONTENT']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();
   });
	function chk_file_type(obj) {
		 var file_kind = obj.value.lastIndexOf('.');
		 var file_name = obj.value.substring(file_kind+1,obj.length);
		 var file_type = file_name.toLowerCase();

		 check_file_type=['jpg','gif','png','jpeg','bmp'];

		 if(check_file_type.indexOf(file_type)==-1){
		  alert('이미지 파일만 선택할 수 있습니다.');
		  var parent_Obj=obj.parentNode;
		  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
		  return false;
		 }
	 }
</script>
</head>
<body>


<div class="jtRefx">
	<h1 class="title kuldyr">제휴 은행 관리</h1>
</div>
<div>
		<h2 class="cYaAqA">제휴 은행 수정</h2>
		
		<br />
</div>
   <form method="post" name="frm" id="frm" enctype="multipart/form-data">
		<input type="hidden" name="BANK_NUM" value="${bank.BANK_NUM}">
		<div class="eugBve">
		<ul class="hIJwlj">
			<li>
				<p class="efvxco">은행 종류</p>
				<select class="freEbZ hRFrgm" name="BANK_KIND">
					<option>은행 종류 선택</option>
					<option value="국민">국민 은행</option>
					<option value="신한">신한 은행</option>
					<option value="우리">우리 은행</option>
					<option value="카카오">카카오 은행</option>
				</select>
			</li>
			<li>
				<p class="efvxco">제목</p>
				<input autocomplete="off" class="styled__TitleInput-sc-1v9ngdo-6 ilgADB Input-sfsekm-0 kTQnUD" 
					id="BANK_TITLE" name="BANK_TITLE">
			</li>
			<li>
				<p class="efvxco">내용</p>
				<textarea class="styled__InquiryArea-sc-1v9ngdo-7 bqTGEL Textarea-sc-6jro6l-0 hunnDM" id="BANK_CONTENT"
				name="BANK_CONTENT" placeholder="내용을 입력하세요.">
				</textarea>
			</li>
			<br>
		<br>
		<p align="center">
				<input type="file" name="BANK_ORIGINAL_FILE1" accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
				첨부파일 1
				<a href="#" class="btn" id="delete1" name="delete">삭제</a>
			</p>
			<br>
			<p align="center">
				<input type="file" name="BANK_ORIGINAL_FILE2" accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
				첨부파일 2 
				<a href="#" class="btn" id="delete2" name="delete">삭제</a>
			</p>
			<br>
			<br>
			<br>
		</ul>
			<div align="center">
			<button class="kcMULl" onclick="location.href='/nnb/admin/openAdminBankList'">취소</button>
			<button class="iEZQG" id="update">등록</button>
			</div>
		</div>
	</form>
	
   <br />
   <br />
   <br />
   <br />
   <br /> &nbsp;&nbsp;&nbsp;&nbsp;
   <div>
      <%@include file="/WEB-INF/include/footer.jspf"%>
   </div>
</body>
</html>