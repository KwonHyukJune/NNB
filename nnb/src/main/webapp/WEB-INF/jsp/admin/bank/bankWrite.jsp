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
	function submit(){
	    var f=document.bankWriteForm;   //폼 name
	    	f.action = "bankWrite";
		    f.submit();	 
		}
	$(document).ready(function(){
		$("a[name='delete']").on("click",function(e){	//삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});
	function fn_deleteFile(obj){
		obj.prev().prev().val('');
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
	<form method="post" name="bankWriteForm" enctype="multipart/form-data">
		<div>
			은행종류 <select name="bank_kind">
				<option>은행종류</option>
				<option value="국민">국민 은행</option>
				<option value="신한">신한 은행</option>
			</select>
		</div>
		<br />


		<div>
			제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
				id="bank_title" name="bank_title" />
		</div>
		<br />
		<div>
			내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea rows="20" cols="50" title="내용" id="bank_content"
				name="bank_content"></textarea>
		</div>

		<div>
			<br />
			<br />
			<hr>
			<p>
				<input type="file" name="bank_original_file1">첨부파일 1 <input
					type="hidden" name="bank_stored_file1" value="dd1"> <a
					href="#" class="btn" id="delete1" name="delete">삭제</a>
			</p>
			<p>
				<input type="file" name="bank_original_file2">첨부파일 2 <input
					type="hidden" name="bank_stored_file2" value="dd2"> <a
					href="#" class="btn" id="delete2" name="delete">삭제</a>
			</p>
			<hr>
			<br />
			<br /> <a href="javascript:submit()">등록</a> <a
				href="javascript:back();">닫기</a>
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
