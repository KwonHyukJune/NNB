<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='${url}'/>";
	}
})
</script>
</head>

</html>