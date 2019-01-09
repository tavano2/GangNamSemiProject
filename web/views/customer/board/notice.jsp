<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>NOTICE</title>


    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>
	

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content" align="center">
	
		<br> <br>
		<div align="center" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">NOTICE</div>
		<br> <br>
		<hr>

		<table class="ui single line table">
			<thead>
				<tr>
					<th>No.</th>
					<th>Content</th>
					<th>Name</th>
					<th>Date</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="/semi/views/customer/board/noticeBoard.jsp">Notice 01</a></td>
					<td>Ian</td>
					<td>2018-12-17</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="/semi/views/customer/board/noticeBoard.jsp">Notice 02</a></td>
					<td>Ian</td>
					<td>2018-12-17</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="/semi/views/customer/board/noticeBoard.jsp">Notice 03</a></td>
					<td>Ian</td>
					<td>2018-12-17</td>
				</tr>
			</tbody>
			
			<tfoot>
				<th colspan="4">
					<!--  작성하기는 관리자만 가능하다.  -->
					<div align="right">
						<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/board/insertBoard.jsp';">작성하기</button>
					</div>
				</th>
			</tfoot>
		</table>
		
		
		<hr>
		<br>
		<br>

		

		
	</div>
		
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>

    
</body>

</html>