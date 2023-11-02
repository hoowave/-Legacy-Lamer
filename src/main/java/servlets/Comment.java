package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import vo.CommentVO;
import vo.MemberVO;
import vo.PagingVO;

@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		CommentDAO cdao = new CommentDAO();
		String action = request.getParameter("action");

		if (action.equals("view")) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			String page = request.getParameter("page");
			try {
				PagingVO pvo = cdao.makePage(bno, page);
				ArrayList<CommentVO> clist = cdao.selectComment(bno, pvo);
				request.setAttribute("mvo", mvo);
				request.setAttribute("clist", clist);
				request.setAttribute("pvo", pvo);
				request.setAttribute("bno", bno);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("board/comment.jsp").forward(request, response);
		} else if (action.equals("write")) {
			CommentVO cvo = new CommentVO();
			int bno = Integer.parseInt(request.getParameter("bno"));
			cvo.setBno(bno);
			cvo.setContent(request.getParameter("content"));
			cvo.setWriter(mvo.getNickname());
			try {
				int groupno = cdao.lastGroupno(bno);
				cvo.setGroupno(groupno + 1);
				cdao.write(cvo);
				out.print("200");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equals("replywrite")) {
			CommentVO cvo = new CommentVO();
			int bno = Integer.parseInt(request.getParameter("bno"));
			cvo.setBno(bno);
			cvo.setContent(request.getParameter("replycontent"));
			cvo.setWriter(mvo.getNickname());
			int groupno = Integer.parseInt(request.getParameter("groupno"));
			cvo.setGroupno(groupno);
			try {
				cdao.write(cvo);
				out.print("200");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equals("modify")) {
			CommentVO cvo = new CommentVO();
			cvo.setCno(Integer.parseInt(request.getParameter("cno")));
			cvo.setContent(request.getParameter("modifycontent"));
			try {
				cdao.modify(cvo);
				out.print(200);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equals("delete")) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			try {
				cdao.delete(cno);
				out.print(200);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equals("replycontent")) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			try {
				out.print(cdao.getReplyContent(cno));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
