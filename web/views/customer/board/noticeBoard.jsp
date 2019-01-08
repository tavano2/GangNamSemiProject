<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	/* .table, th, td {
		font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
		font-size: 20px;
		padding: 5px;
		text-align: center;
		 border: 1px solid black;
 		 border-collapse: collapse;
	}
	.background-color:#f9fafb; 
	 */
</style>
	<meta charset="UTF-8">
	<title>NOTICE_BOARD</title>
	<!-- noticeBoard.jsp >> Detail. -->


    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>
	

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content" align="center">
	
		<br> <br>
		<div align="center" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">BOARD</div>
		<br> <br>
		<hr>

		<table class="ui single line table">
			<thead>
				<tr>		
					<th>Content</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>공지사항 내용입니다.
					<br/>
					<br/>
					<br/>
					</td>
					
				</tr>
			</tbody>
			
			<tfoot>
				<th colspan="4">
					<!--  작성하기는 관리자만 가능하다.  -->
					<div align="center">
						<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/board/notice.jsp';">확인</button>
						<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/board/insertBoard.jsp';">수정</button>		
						<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/board/insertBoard.jsp';">삭제</button>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>

    
</body>

</html>