<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 등록 폼</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#write").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/bankWrite'/>");
		comSubmit.submit();
	}
});
	$(document).ready(function(){
		$("a[name='delete']").on("click",function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});
	function fn_deleteFile(obj){
		obj.prev().val('');
	}
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

	<h1>
		<div>제휴은행 등록</div>
	</h1>



	<div>
		<h2>새 질문 등록</h2>
		<hr>
		<br />
	</div>
	<form method="post" name="frm" id="frm" enctype="multipart/form-data">
		<div>
			은행종류 <select name="BANK_KIND">
				<option>은행종류</option>
				<option value="국민">국민 은행</option>
				<option value="신한">신한 은행</option>
			</select>
		</div>
		<br />


		<div>
			제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="BANK_TITLE" name="BANK_TITLE" />
		</div>
		<br />
		<div>
			내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea rows="20" cols="50" title="내용" id="BANK_CONTENT"
				name="BANK_CONTENT"></textarea>
		</div>

		<div>
			<br />
			<br />
			<hr>
			<p>
				<input type="file" name="BANK_ORIGINAL_FILE1" accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
				첨부파일 1
				<a href="#" class="btn" id="delete1" name="delete">삭제</a>
			</p>
			<p>
				<input type="file" name="BANK_ORIGINAL_FILE2" accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
				첨부파일 2 
				<a href="#" class="btn" id="delete2" name="delete">삭제</a>
			</p>
			<hr>
			<br />
			<br /> <a href=# id="write">등록</a>
		<button type="button" onclick="fn_back();">취소</button>
		</div>
	</form>

	<br />
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
