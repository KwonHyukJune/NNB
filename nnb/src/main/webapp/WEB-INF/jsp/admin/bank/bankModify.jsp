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

   function frameclose() { 
      parent.close() 
      window.close() 
      self.close() 
      } 
   
   function submit(){
       var f=document.bankWriteForm;   //폼 name
          f.submit();    
         
      }
   
   function fn_deleteFile1(obj){ 
		obj.prev().val('');
		obj.prev().prev().val('');
		console.log("qka?:"+"${bank.BANK_STORED_FILE1!=null}");
		if("${bank.BANK_STORED_FILE1!=null}"){
			str = "<input type='hidden' name='delete1' value='1'>";
			$("form[name='bankWriteForm']").append(str);
		}
   }
   function fn_deleteFile2(obj){ 
		obj.prev().val('');
		obj.prev().prev().val('');
		if("${bank.BANK_STORED_FILE2!=null && bank.BANK_STORED_FILE2!=''}"){
			str = "<input type='hidden' name='delete2' value='1'>";
			$("form[name='bankWriteForm']").append(str);
		}
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
         var key = $("select[name='bank_kind']>option");
         for(var i=0;i<key.length;i++){
            if(key[i].value==value){
               key[i].selected = true;
            }
         };
      })();   
      (function(){
         var value = "${bank.BANK_TITLE}";
         var key = $("input[name='bank_title']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();   
      (function(){
         var value = "${bank.BANK_CONTENT}";
         var key = $("textarea[name='bank_content']");
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

   <%-- <!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> bank1 = new HashMap<String,Object>();
   bank1.put("BANK_NUM","1");
    bank1.put("BANK_CATEGORY","회원문의");
    bank1.put("BANK_TITLE","국민 은행입니다");
    bank1.put("BANK_CONTENT","국민에게 돈 빌려 드립니다 ^오^.");
   
   
   List<Map<String,Object>> bank = new ArrayList<Map<String,Object>>();
   bank.add(bank1);
  
 
   request.setAttribute("bank",bank1);
%>
<!-- 테스트용 세팅 끝 --> --%>

   <h1>
      <div>제휴은행 등록</div>
   </h1>



   <div>
      <h2>새 질문 등록</h2>
      <hr>
      <br />
   </div>
   <form action="bankModify" method="post" name="bankWriteForm" enctype="multipart/form-data">
      <input type="hidden" name="num" value="${bank.BANK_NUM}">
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
         <br /> <br />
         <hr>
         <p>
            <a href="#">${bank.BANK_ORIGINAL_FILE1}</a> 
            <input type="hidden" id="bank_stored_file1" name="bank_stored_file1" value="${bank.BANK_STORED_FILE1}"> 
            <input type="file" id="bank_original_file1" name="bank_original_file1"
            	accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
            	첨부파일 1
            <a href="#" class="btn" id="delete1" name="delete1">삭제</a>
         </p>
         <p>
            <a href="#">${bank.BANK_ORIGINAL_FILE2}</a> <input type="hidden"
               id="bank_stored_file2" name="bank_stored_file2"
               value="${bank.BANK_STORED_FILE2}"> <input type="file"
               id="bank_original_file2" name="bank_original_file2" accept='image/jpeg,image/gif,image/png' onchange='chk_file_type(this)'>
               	첨부파일 2
            <a href="#" class="btn" id="delete2" name="delete2">삭제</a>
         </p>
         <hr>
         <br />
      </div>
   </form>
   <br />
   <a href="javascript:submit(bankWriteForm)">등록</a>
   <a href="javascript:back();">취소</a>

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