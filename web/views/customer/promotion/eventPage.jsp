<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

<style>
table tbody>tr:hover{
	cursor: pointer;
}

</style>
</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br><br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">EVENT</div>
		<br> <br><br>
		<hr>
		<table class="ui single line table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>게시글 제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (HashMap<String, Object> hmap : list) {
				%>
				<tr onclick="location.href='<%=request.getContextPath()%>/eventDetailPage.bo?board_num=<%=hmap.get("board_num")%>' ">
					<td><%=hmap.get("board_num")%></td>
					<td><%=hmap.get("board_title")%></td>
					<td><%=hmap.get("user_id")%></td>
					<td><%=hmap.get("board_count")%></td>
					<td><%=hmap.get("board_date")%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="5" height="50px;">
						<div align="right">
							<div class="ui action input">
								<input type="text" placeholder="Search..."> <select>
									<option value="title">제목</option>
									<option value="author">작성자</option>
									<option value="content">내용</option>
								</select>
								<div class="ui button">Search</div>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td colspan="5">
						<div align="center">
							<div class="ui pagination menu">
							    		<a class="icon item" onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage=1' "><i class="angle double left icon"></i></a>
								        <%if(currentPage <=1) {%>
								         <a class="icon item"><i class="angle left icon"></i></a>
								        <%} else{ %>
								        	<a class="icon item" onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage=<%=currentPage-1%>' "><i class="angle left icon"></i></a>
								        <%} %>
								       
								       
								       <%for(int p = startPage; p <= endPage ; p++){ 
								       
								       			if(p == currentPage){
								       %>
								       			<a class="item"><%=p %></a>
								       <%}else{ %>
								       			<a class="item" onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage=<%=p%>' "><%=p %></a>
								       <%} %>
								       
								       <%} %>
		
								        
								        <%if(currentPage >= maxPage) {%>
								        <a class="icon item"><i class="angle right icon"></i></a>
								        <%}else{ %>
								        	<a class="icon item" onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage=<%=currentPage+1%>' "><i class="angle right icon"></i></a>
								        <%} %>
								        
								        <a class="icon item" onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage=<%=maxPage%>' "><i class="angle double right icon"></i></a>
							      	</div>

						
						
						</div>

					</td>


				</tr>
			</tbody>
			<tfoot>
				<th colspan="5">
					<!--  작성하기는 관리자만 가능하다.  -->
					<div align="right">
					<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
						<button class="ui brown basic mini button"
							onclick="location.href='/semi/views/customer/board/insertEventBoard.jsp';">작성하기</button>
						<%} %>	
					</div>
				</th>
			</tfoot>
		</table>

		<hr>
		<br> <br>
		<br><br>


	</div>


	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

</body>

</html>