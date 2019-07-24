<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type"text/css">
A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}
</style>
<title>새 공지 작성</title>
<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            //var title = document.form1.title.value; ==> name속성으로 처리할 경우
            //var content = document.form1.content.value;
            //var writer = document.form1.writer.value;
            var title = $("#title").val();
            var content = $("#content").val();
            var writer = $("#writer").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
</script>
</head>
<body>

<h1><div style="width:650px; text-align: center;">게시판 관리</div></h1>
<div style="width:650px; text-align: center;">
<a href="/favorite/recent-room" aria-current="page">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/favorite/preempt-room">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/favorite/recent-complex">약관관리</a>
</div>

<div>
<div style="width:650px; text-align: center;">
<h2>새 공지 등록</h2>
<hr style="width: 700px; ">
<br/>
</div>
	<div>
        유형 
        <select name="selectBox" id="selectBox" style="width:80px;" class="select_02">

      <c:forEach var="testList" items="${NT_TYPE}" varStatus="i">

         <option value="${testList.name}">${testList.name}</option>

      </c:forEach>

   </select>
   </div>
   <br/>
   
    <div>
        제목
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요" style="width: 660px; ">
    </div>
    <br/>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div style="width:650px; text-align: center;">
    <br/><br/>
        <button type="button" id="btnSave">확인</button>
        <button type="reset">취소</button>
    </div>
</form>
</body>
</html>
