<%@page import="com.kh.semi.customer.board.model.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> list = (HashMap<String, Object>)request.getAttribute("list");
	ArrayList<Board> bList = (ArrayList<Board>)list.get("bList");
	HashMap<String, Attachment> atMap = (HashMap<String, Attachment>)list.get("atMap");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String categ = (String)request.getAttribute("categ");
	String search = (String)request.getAttribute("search");
	String cateName = "";
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>FAQ</title>
	
	<!-- Semantic UI CSS CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	
	<!-- Common css -->
	<link href="/semi/css/customer/common/main.css" rel="stylesheet">

	<style>
		.table th:first-child {
			width: 40px;
		}
		.table th:nth-child(2) {
			width: 160px;
		}
	</style>

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>

	<div class="content">
		<br> <br>
		<div align="center" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">자주묻는질문</div>
		<br> <br>
		<hr>
		<button class="ui grey basic button" onclick="cateSel('');">전체</button>
		<button class="ui grey basic button" onclick="cateSel(1);">주문관련</button>
		<button class="ui grey basic button" onclick="cateSel(2);">결제관련</button>
		<button class="ui grey basic button" onclick="cateSel(3);">배송관련</button>
		<button class="ui grey basic button" onclick="cateSel(4);">교환/환불/반품관련</button>
		<button class="ui grey basic button" onclick="cateSel(5);">적립금관련</button>
		<button class="ui grey basic button" onclick="cateSel(6);">품절관련</button>
		<button class="ui grey basic button" onclick="cateSel(7);">쿠폰관련</button>
		<button class="ui grey basic button" onclick="cateSel(8);">기타</button>
		
		<table class="ui single line table accordion">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
				</tr>
			</thead>
			
			<tbody>
				<%for(Board b : bList){ %>
				<tr>
					<td><%= b.getBoardNum() %></td>
					<td>
					<% switch(b.getBoardCate()) {
					case "1": cateName="주문관련"; break;
					case "2": cateName="결제관련"; break;
					case "3": cateName="배송관련"; break;
					case "4": cateName="교환/환불/반품관련"; break;
					case "5": cateName="적립금관련"; break;
					case "6": cateName="품절관련"; break;
					case "7": cateName="쿠폰관련"; break;
					case "8": cateName="기타"; break;
					}%>
					<%= cateName %>
					</td>
					<td>
						<div class="title"><%= b.getBoardTitle() %></div>
						<div class="content">
							<div class="ui segment">
								<p><%= b.getBoardContent() %></p>
							</div>
						</div>
					</td>
				</tr>
				<%} %>
			</tbody>
			
			<tfoot>
				<th colspan="3" class="center aligned">
					<div class="ui pagination menu" id="paging">
			    		<a class="icon item"><i class="angle double left icon"></i></a>
				        <a class="icon item"><i class="angle left icon"></i></a>
				        <a class="item active">1</a>
				        <a class="icon item"><i class="angle right icon"></i></a>
				        <a class="icon item"><i class="angle double right icon"></i></a>
			      	</div>
				</th>
			</tfoot>
		</table>
		
		<div class="ui grid">
			<div class="eight wide column left aligned">
				<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
				<button class="ui button" onclick="location.href='/semi/views/customer/board/FAQinsert.jsp';">작성하기</button>
				<%} %>
			</div>

			<div class="eight wide column right aligned">
				<form method="post" name="searchFrom">
					<input type="hidden" name="categ" id="categ" value="<%= categ %>">
					<div class="ui action input">
						<input type="text" placeholder="Search..." name="search" value="<%= search %>">
						<button class="ui button">Search</button>
					</div>
				</form>
			</div>
		</div>
		
		
		
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

	<script>
		function cateSel(num){
			$("#categ").val(num);
			searchFrom.action = "<%= request.getContextPath()%>/selectFAQList.bo";
			searchFrom.submit();
		}
		
		$('.ui.accordion').accordion();
	</script>

</body>

</html>