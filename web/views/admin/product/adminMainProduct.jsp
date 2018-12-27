<%@page import="com.kh.semi.admin.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>

   <!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
<style>
   .productAddBtn{
      text-align:center;
   }
   .overflowDiv{
      margin-left:430px;
      font-size:15px;   
   }
   .overInnerDiv{
      border:1px solid lightgray;
      padding:10px;
      background:#e9e9e9;
   }
   .categoryBtn{
      margin-left:90px;
   }
   .cateNames:hover{
   		background:darkgray;
   		cursor:pointer;
   }
</style>
</head>

<body>
   
   <!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarProduct.jsp" %>
    
    <div class="wrapper">
       <!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

          <div class="content">
           <div class="content-box">
           <h2 class="ui header" style="text-align:center;">상품분류 설정</h2>
           <br><br><br><br>
           <div class="overflowDiv">
         <div style="overflow:scroll; width:350px; height:400px;" class="overInnerDiv">
          <div class="ui list" id="divList">
            
          <%-- <% for (Category c : list){ %>
              <% if(c.getCateLevel() == 0) {%>
              <div class="item">
                <i class="window maximize icon"></i>
                <div class="content">
                  <div class="header1"><span class="cateNames"><input type="hidden" class="ccode" value="<%=c.getCateCode() %>"><input type="hidden" class="clevel" value="<%=c.getCateLevel() %>"><%=c.getCateName() %></span></div>
                  <div class="list">
                  <% }else{ %>
                  <% for(Category ca : list){ %>
                  <% if(c.getCateRefCode().equals(ca.getCateCode())){ %>
                    <div class="item">
                      <i class="window restore icon"></i>
                      <div class="content">
                        <div class="header2"><span class="cateNames"><input type="hidden" class="ccode" value="<%=c.getCateCode() %>"><input type="hidden" class="clevel" value="<%=c.getCateLevel() %>"><%=c.getCateName() %></span></div>
                      </div>
                    </div>
                    <% } %>
                    <% } %>
                    <% } %>
                    <% if(c.getCateLevel() == 0) {%>
                  </div>
                </div>
              </div>
              <% } %>
              <% } %> --%>
              
              
              <% for (Category c : list){ %>
              <% if(c.getCateLevel() == 0) {%>
              <div class="item">
                <i class="window maximize icon"></i>
                <div class="content">
                  <div class="header1">
                  <span class="cateNames">
                  <%=c.getCateName() %>
                  	<input type="hidden" value="<%=c.getCateCode() %>">
                  	<input type="hidden" value="<%=c.getCateName() %>">
                  	<input type="hidden" value="<%=c.getCateUrl() %>">
                  	<input type="hidden" value="<%=c.getCateMemo() %>">
                  	<input type="hidden" value="대분류">
                  	<input type="hidden" value="<%=c.getCateRefCode() %>">
                  	<input type="hidden" value="<%=c.getStatus() %>">
                  </span>
                  </div>
                  <div class="list">
                  <% }else{ continue;}%>
                  <% for(Category ca : list){ %>
                  <% if(ca.getCateLevel() == 1 && ca.getCateRefCode().equals(c.getCateCode())){ %>
                    <div class="item">
                      <i class="window restore icon"></i>
                      <div class="content">
                        <div class="header2">
                        	<span class="cateNames">
                        	<%=ca.getCateName() %>
                        		<input type="hidden" value="<%=ca.getCateCode() %>">
                        		<input type="hidden" value="<%=ca.getCateName() %>">
                        		<input type="hidden" value="<%=ca.getCateUrl() %>">
                        		<input type="hidden" value="<%=ca.getCateMemo() %>">
                        		<input type="hidden" value="중분류">
                        		<input type="hidden" value="<%=ca.getCateRefCode() %>">
                        		<input type="hidden" value="<%=ca.getStatus() %>">
                        	</span>
                        </div>
                      </div>
                    </div>
                    <% } else{ continue;} %>
                    <% } %>
                  </div>
                </div>
              </div>
              <% } %>
              
              
            </div>
         </div>
         <br>
            <div class="categoryBtn">
                 <button class="ui blue button" type="submit" onclick="cateAdd();">분류추가</button>
                 <button class="ui white button" onclick="cateDelete();">삭제</button>
              </div>
         </div>
           
         <br>
         <br>          
           <hr>
              <h2 class="ui header">분류정보</h2>
				<div class="divBox">
                <table class="ui celled table first-col">
                   
                    <tr>
                        <td>현재분류</td>
                        <td>
                            <div class="ui input"><span id="currentCategory" name="currentCategory">대분류</span></div>
                        </td>
                    </tr>
                    <tr>
                        <td>분류코드</td>
                        <td>
                            <div class="ui input"><span id="cateCode">PC00000010</span></div>
                        </td>
                    </tr>
                    <tr>
                        <td>분류URL</td>
                        <td>
                            <div class="ui input"><input type="text" name="cateUrl" size="100"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>분류명</td>
                        <td>
                            <div class="ui input"><input type="text" name="cateName" size="100"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>분류설명</td>
                        <td>
                            <div class="ui input"><input type="text" name="cateMemo" size="100"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>상품진열</td>
                        <td>
                        
                       
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">최근 등록상품이 위로</div>
                                <div class="menu">
                                    <div class="item latelyOrderby" data-value="0">최근 등록상품이 위로</div>
                                    <div class="item latelyOrderby" data-value="1">판매량이 높은순</div>
                                    <div class="item latelyOrderby" data-value="2">가격이 낮은순</div>
                                    <div class="item latelyOrderby" data-value="3">가격이 높은순</div>
                                    <div class="item latelyOrderby" data-value="4">상품명 가나다순</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>품절상품진열</td>
                        <td>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">품절상품 상관없음</div>
                                <div class="menu">
                                    <div class="item soldOut" data-value="0">최근 등록상품이 위로</div>
                                    <div class="item soldOut" data-value="1">품절상품 맨 뒤로</div>
                                    <div class="item soldOut" data-value="2">품절상품 맨 앞으로</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>표시상태</td>
                        <td>
                            <div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="status" checked="" tabindex="1" class="hidden" value="E">
                                            <label>표시함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="status" tabindex="2" class="hidden" value="D">
                                            <label>표시안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </td>
                    </tr>
                </table>
                <div class="productAddBtn">
               <button class="ui blue button" onclick="cateUpdate();">확인</button>
            </div>
                </div>
                <hr>
           
           </div>
        </div>

      
      <!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
    
    <script>
    $('#sticky1').sticky(); //네이바 상단 고정
    $('#menu').click(function () {  //사이드바 오픈 버튼
        $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
    })
    $('.content-box .ui.dropdown').dropdown();  //컨텐츠 박스의 드롭다운 실행
    $('.content-box .ui.menu .item').on('click', function () {  //컨텐츠 박스의 메뉴 아이템 클릭시 active
        $('.ui .item').removeClass('active');
        $(this).addClass('active');

    });
    $('.ui.radio.checkbox')
  .checkbox();
    
    </script>
    
    <script>
    var level = "";
    var code = "";
    
    $(function(){
		$(".cateNames").click(function(){
			$(this).parent().css({"background":"#e9e9e9"});
			$(this).parent().css({"background":"darkgray"});
		}).click(function(){
			code = $(this).children("input:nth-of-type(1)").val();
			name = $(this).children("input:nth-of-type(2)").val();
			url = $(this).children("input:nth-of-type(3)").val();
			memo = $(this).children("input:nth-of-type(4)").val();
			level = $(this).children("input:nth-of-type(5)").val();
			rcode = $(this).children("input:nth-of-type(6)").val();
			status = $(this).children("input:nth-of-type(7)").val();

			$("#currentCategory").html(level);
			$("input[name=cateCode]").val(code);
			$("input[name=cateUrl]").val(url);
			$("input[name=cateName]").val(name);
			$("input[name=cateMemo]").val(memo);
		});
	});
	
	function cateUpdate(){
		location.href="<%=request.getContextPath()%>/updateCate.product";
	}
	
	function cateAdd(){
		location.href="<%=request.getContextPath()%>/insertCate.product?level="+level+"&code="+code;
	}
	
	function cateDelete(){
		location.href="<%=request.getContextPath()%>/deleteCate.product?code="+code;
	}
	
    </script>
    
    
</body>

</html>