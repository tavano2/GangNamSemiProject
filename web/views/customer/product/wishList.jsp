<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)request.getAttribute("list");

%>

<html>


<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content">
						<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">WISH LIST</div>
		<br>
		<br>
		<hr>
		<br>
				<div class="ui grid">
			<div class="twelve wide column">
				<b>위시 리스트</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/member/userMyPage.jsp'">이전으로</button>
			</div>
		</div>
		<!-- 위시리스트 내역 -->
					<table class="ui single line table">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>판매가</th>
						<th>회원 할인가</th>
						<th>적립금</th>
						<th>배송비</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<%for(HashMap<String,Object> hmap : list){ %>
					<tr>
						<td><input type="checkbox" class="productChk"></td>
						<td><img src = "/semi/image/customer/product/<%=hmap.get("change_name") %>" width="50px" height="50px"></td>
						<td><%=hmap.get("product_name") %></td>
						<td><%=hmap.get("product_amount") %>개</td>
						<td><%=hmap.get("product_price") %>원</td>
						<td><%=hmap.get("discount") %>원</td>
						<td><%=hmap.get("point") %>원</td>
						<td><%=hmap.get("post_price") %>원</td>
						<td><%=hmap.get("sum_product") %>원</td>
					</tr>
					<%} %>
					
					<tr>
					<td colspan="9">
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
			</table>
			<br>
		<hr>
		<div align="right">
		<b>선택 상품을</b>&nbsp;&nbsp;<button class="ui brown basic mini button">삭제하기</button>&nbsp;
		<button class="ui brown basic mini button">장바구니 담기</button>
		</div>
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