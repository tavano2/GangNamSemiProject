<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%


	Product SelectOneQnA = (Product)request.getAttribute("SelectOneQnA");
	ArrayList<Product> SelectReplyList = (ArrayList<Product>)request.getAttribute("SelectReplyList");
	ArrayList<Attachment> selectfileList = (ArrayList<Attachment>)request.getAttribute("selectfileList");
	String productCode = (String)request.getAttribute("productCode");
	//System.out.print("sdf"+SelectOneQnA);

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
<style type="text/css">

[type="date"] {
            background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
        }
        [type="date"]::-webkit-inner-spin-button {
            display: none;
        }
        [type="date"]::-webkit-calendar-picker-indicator {
            opacity: 0;
        }
        input {
            border: 1px solid #c4c4c4;
            border-radius: 3px;
            background-color: #fff;
            padding: 8px 5px;
        }


</style>


</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>
	
	<!-- 작성하기 역시 관리자만 접근 가능하다. -->

	<%if(loginUser != null){ %>

	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">
			product inquiry</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>상품문의</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button"
					onclick="location.href='/semi/index.jsp';">메인으로</button>
			</div>
		</div>
		<br>
		
		<form action="<%=request.getContextPath() %>/updateQnA.pd" method="post" encType="multipart/form-data" name="updateQnAForm">
		<input type="hidden" name="productCode" value="<%= productCode %>">
		<table class="ui celled table first-col">

		<tbody>
			<tr>
				<td>제목</td>
				<td>
					<div class="ui input">
					<input type="hidden" value="<%=SelectOneQnA.getBoardId() %>" name="pQnABoardId">
					<input type="hidden" value="<%=SelectOneQnA.getBoardNum() %>" name="pQnABoardnum">
						<input type="text" name="title" value="<%=SelectOneQnA.getBoardTitle()%>">
						
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<div class="ui input">
						<input type="text" value="<%=loginUser.getUserId()%>" name="userId" readonly>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<div class="ui form">
						<div class="field">
							<textarea name = "content"><%=SelectOneQnA.getBoardContent() %></textarea>
						</div>

					</div>
				</td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
				<%if(selectfileList.size()>0){ 
		
				for(Attachment a : selectfileList) { 
				///System.out.println("이거"+a.getFilePath()+a.getChangeName());
				//System.out.println(selectfileList);
				%>
					<td>첨부파일</td>
					
					<td id="Attd">
					
					<input type="hidden" name="atstatus" value="n" id="atstatus">
					<input type="hidden" name="deleteChangeName" value="<%=a.getChangeName() %>">
					<input type="hidden" name="fildId" value="<%=a.getFileId() %>">
					<span id="orginAt"><%=a.getOriginName() %></span><button onclick="deleteAt(this); return false;">삭제하기</button>
					
					</td>
				<%}}else{ %>
					<td>첨부파일</td>
					<td>
					<input type="hidden" name="insertAtt" value="n" id="insertAtt">
					<input type="file" name="file" id="file">
					</td>
				<%} %>
				</tr>
			</tfoot>
		</table>

		<div align="center">
			<button class="ui secondary button" onclick="updateBtn(); return false;">등록하기</button>
			<button type="reset" class="ui button">취소하기</button>

		</div>
		</form>
		<br>
		<hr>
		<br> <br> <br>





	</div>
	
	<%} else{ 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
		request.getRequestDispatcher("views/customer/common/errorPage.jsp");
		
	%>
		<h2>로그인을 해주세용</h2>
	<%} %>


	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>
	
	<script>
		function deleteAt(deletebtn){
			$("#atstatus").val("y");
			$("#orginAt").hide();
			$(deletebtn).hide();
			$("#Attd").append($("<input type='file' name='file' id='file'>"));
			$("#Attd").append($("<input type='hidden' name='insertAtt' value='n' id='insertAtt'>"));
		}
		
		function updateBtn(){
			if($("#file").length > 0 && $("#file").val() != "") {
				$("#insertAtt").val("y");
			}
			updateQnAForm.submit();
		}
	
	</script>

</body>

</html>