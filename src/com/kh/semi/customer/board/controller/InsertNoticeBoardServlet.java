package com.kh.semi.customer.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Query : INSERT INTO BOARD VALUES ( SEQ_BID.NEXTVAL, 2, SEQ_BTYPE2.NEXTVAL, NULL, ?, ?, 'admin' , SYSDATE,SYSDATE,1,NULL,0,DEFAULT,NULL,'E',NULL);
// Query Ref : INSERT INTO BOARD VALUES ( SEQ_BID.NEXTVAL, 2, SEQ_BTYPE2.NEXTVAL, NULL, '공지사항 게시글입니다1', '공지사항 게시글 내용6666 입니다.', 'admin' , SYSDATE,SYSDATE,1,NULL,0,DEFAULT,NULL,'E',NULL);

// 공지사항 게시글, 내용 : Set as '?'. Type '?' 2 times. // 작성 권한 관리자에게만 있으므로 admin. // Set the date as system date (Default. Auto.) // Why the sys

/*
 * Notice 공지사항
 Ref. jspProject > Query.
selectList=SELECT RNUM, BID, BTYPE, BNO, CNAME, BTITLE, BCONTENT, NICK_NAME, BCOUNT, REF_BID, REPLY_LEVEL, BDATE, STATUS FROM (SELECT ROWNUM RNUM, BID, BTYPE, BNO, CNAME, BTITLE, BCONTENT, NICK_NAME, BCOUNT, REF_BID, REPLY_LEVEL, BDATE, STATUS FROM (SELECT B.BID, B.BTYPE, B.BNO, C.CNAME, B.BTITLE, B.BCONTENT, M.NICK_NAME, B.BCOUNT, B.REF_BID, B.REPLY_LEVEL, B.BDATE, B.STATUS FROM BOARD B JOIN MEMBER M ON(B.BWRITER = M.UNO) JOIN CATEGORY C ON(C.CID = B.CID) WHERE B.STATUS = 'Y' AND B.BTYPE = '1' AND B.REPLY_LEVEL = 0 ORDER BY BID DESC))WHERE RNUM BETWEEN ? AND ?

- *** 작성하기 버튼 > 관리자만 작성할 수 있게끔 만들기. ***
 * 
 * // 공지사항 게시글, 내용 : Set as '?'. Type '?' 2 times. // 작성 권한 관리자에게만 있으므로 admin. // Set the date as system date (Default. Auto.) // Why the sys

- 게시판 List (조회)
- 게시판 상세보기  // 공지사항이므로 수정/삭제 관리자만 가능하게끔 설정. 		(// Detail )
- 게시판 수정 // UPDATE (in query.)
- 게시판 삭제 // DELETE (in query.) // DELETE 로 날리지 않고, UPDATE BOARD SET STATUS = 'D' WHERE BOARD_ID = ? 해서 상태 수정. 
// Specify the board id in Dao.
 
STATUS << ENABLE > DISABLE >>
ENABLE 된 것만 불러오기. 


// Give priority.
// 첨부파일, 댓글은 Optional.

 * 
 * 
 * */


/**
 * Servlet implementation class InsertNoticeBoardServlet
 */
@WebServlet("/insertNoticeBoard.bo")//- 게시판 작성 :  INSERT // 
public class InsertNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
