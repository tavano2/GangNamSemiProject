<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MY
			BOARD</div>
		<br> <br> <b>리뷰 게시판 관리</b>
		<hr>
		<table class="ui single line table">
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>게시글 번호</th>
					<th>게시글 제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="reviewTbody">
			</tbody>
												<tfoot>
				<th colspan="6">
					<div align="right">
					<button class="ui brown basic mini button">삭제하기</button>
				</div>
				</th>
			</tfoot>
		</table>

		<hr>
		<br>
		<br> <b>Q&A 게시물 관리</b>
		<hr>
		<table class="ui single line table">
			<thead>
				<tr>
				<th><input type="checkbox"></th>
					<th>게시글 번호</th>
					<th>게시글 제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td><input type="checkbox"></td>
					<td><a href="/semi/views/customer/board/detailBoardPage.jsp">1</a>	</td>
					<td>제목입니당</td>
					<td>임수철</td>
					<td>0</td>
					<td>2018/12/14</td>
				</tr>
			</tbody>
									<tfoot>
				<th colspan="6">
					<div align="right">
					<button class="ui brown basic mini button">삭제하기</button>
				</div>
				</th>
			</tfoot>
			
			
		</table>
		<hr>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	

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

</body>

<script type="text/javascript">
	/* 리뷰 게시판 ajax 처리 */
	$(function(){
		
		
		
		var currentPageJs = 1;
		
		$.ajax({
			url : "<%=request.getContextPath()%>/uesrMyBoardReviewList.bo",
			data : {currentPage : currentPageJs},	
			type : "get",
			success : function(data){
				console.log(data);
				
				$tableBody = $("#reviewTbody");
				$tableBody.html('');
				
				//테이블 리스트 구현
				for(var key in data.resultList){
					$tr = $("<tr class='reviewTr' >");
					var $chkTd = $("<td>");
					var $chk = $("<input type='checkbox'>");
					var $boardNoTd = 	$("<td>").text(data.resultList[key].board_num);
					var $boardTitleTd = $("<td>").text(decodeURIComponent(data.resultList[key].board_title));
					var $boardUserIdTd = $("<td>").text(decodeURIComponent(data.resultList[key].user_id));
					var $boardCountTd = $("<td>").text(decodeURIComponent(data.resultList[key].board_count));
					var $boardDateTd = $("<td>").text(data.resultList[key].board_date);
					$chkTd.append($chk);
					$tr.append($chkTd);
					$tr.append($boardNoTd);
					$tr.append($boardTitleTd);
					$tr.append($boardUserIdTd);
					$tr.append($boardCountTd);
					$tr.append($boardDateTd);
					$tableBody.append($tr);
				}
				
				
				function pageData(pageData){
					//페이징 처리
					$trPage = $("<tr>");
					$tdPage = $("<td colspan='5' >");
					$centerDiv = $("<div align='center'>");
					$paginationDiv = $("<div class='ui pagination menu'>");
					
					currentPageJs = 1;
					$currentPageOne = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+data.resultPi.currentPage+"\'\">");				
					$angleIcon = $("<i class='angle double left icon'>");
					
					$currentPageOne.append($angleIcon);
					$paginationDiv.append($currentPageOne);
					
					if(data.resultPi.currentPage <= 1){
						$leftIconDisable = $("<a class='icon item'>");
						$angleIcon2 = $("<i class='angle left icon' >");
						$leftIconDisable.append($angleIcon2);
						$paginationDiv.append($leftIconDisable);
					}else{ 
						<%-- $leftIconAble = $("<a class='icon item' onclick='location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage= (data.resultPi.currentPage-1)' >' "); --%>
						$leftIconAble = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+(data.resultPi.currentPage-1)+"\'\">");
						$angleIcon3 = $("<i class='angle left icon' >");
						$leftIconAble.append($angleIcon3);
						$paginationDiv.append($leftIconAble);
					}
					
					for(var i = data.resultPi.startPage; i <= data.resultPi.endPage; i++){
						if( i == data.resultPi.currentPage){
							$item1 = $("<a class='item' >").text(i);
							$paginationDiv.append($item1);
						}else{
							currentPageJs = i;
							<%-- $item2 = $("<a class='item' onclick='location.href='<%=request.getContextPath()%>/eventPageList.bo?currentPage='+i+>' "); --%>
							/* $item2 = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+i+"\'\">").text(i); */
							$item2 = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+i+"\'\">").text(i);
							$item23 = $("<a class=\"icon item\" onclick=\"" + "\">").text(i);
							console.log($item23);
							$paginationDiv.append($item23);
						}
					}
					
					if(data.resultPi.currentPage >= data.resultPi.maxPage){
						$rightIconDisable = $("<a class='icon item'>");
						$angleIcon4 = $("<i class='angle right icon' >");
						$rightIconDisable.append($angleIcon4);
						$paginationDiv.append($rightIconDisable);
					}else{
						$rightIconAble = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+(data.resultPi.currentPage+1)+"\'\">");
						$angleIcon5 = $("<i class='angle right icon' >");
						$rightIconAble.append($angleIcon5);
						$paginationDiv.append($rightIconAble);
					}
					
					$currentMaxPage = $("<a class=\"icon item\" onclick=\"location.href=\'\/semi\/uesrMyBoardReviewList.bo?currentPage="+data.resultPi.maxPage+"\'\">");	
					$angleIcon6 = $("<i class='angle double right icon'>");
					$currentMaxPage.append($angleIcon6);
					$paginationDiv.append($currentMaxPage);
					$centerDiv.append($paginationDiv);
					$tdPage.append($centerDiv);
					$trPage.append($tdPage);
					$tableBody.append($trPage);
				}
				
				pageData();
				
			},
			error:function(data){
				console.log("데이터 통신 실패");
			}
		});
	});

		
	
	
	/* qna 게시판 gson 처리 */
</script>



</html>