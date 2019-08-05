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
   
   function fn_deleteFile(obj){ 
      obj.parent().remove(); 
      }
   
   $(document).ready(function(){
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
   <form action="bankModify" method="post" name="bankWriteForm">
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
            <a href="#">${bank.BANK_ORIGINAL_FILE1}</a> <input type="hidden"
               id="bank_stored_file1" name="bank_stored_file1"
               velue="${bank.BANK_STORED_FILE1}"> <input type="file"
               id="bank_original_file1" name="bank_original_file1">첨부파일 1
            <a href="#" class="btn" id="delete1" name="delete1">삭제</a>
         </p>
         <p>
            <a href="#">${bank.BANK_ORIGINAL_FILE2}</a> <input type="hidden"
               id="bank_stored_file2" name="bank_stored_file2"
               velue="${bank.BANK_STORED_FILE2}"> <input type="file"
               id="bank_original_file2" name="bank_original_file2">첨부파일 2
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