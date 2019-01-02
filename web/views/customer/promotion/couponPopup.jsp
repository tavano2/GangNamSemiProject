<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="dataSelect"></div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$.ajax({
		type : "get",
		url : "<%=request.getContextPath()%>/views/customer/product/mainOrder.jsp";
		dataType : "json",
		error:function (data){
			console.log("통신 실패!");
		},
		success : function(data){
			console.log(data);
		}
		
	});


</script>


</html>