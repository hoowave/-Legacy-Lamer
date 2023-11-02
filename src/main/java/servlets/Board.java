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

import dao.BoardDAO;
import dao.MemberDAO;
import vo.BoardVO;
import vo.MemberVO;
import vo.PagingVO;
import vo.SentenceVO;

@WebServlet("/board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		BoardDAO bdao = new BoardDAO();
		MemberDAO mdao = new MemberDAO();
		String action = request.getParameter("action");

		if (action.equals("list")) {
			try {

				String type = request.getParameter("type");
				String page = request.getParameter("page");
				PagingVO pvo = bdao.makePage(type, page);
				ArrayList<BoardVO> blist = bdao.selectList(type, pvo);
				request.setAttribute("type", type);
				request.setAttribute("title", transTitle(type));
				request.setAttribute("blist", blist);
				request.setAttribute("pvo", pvo);

				if (type.equals("attendance")) {
					SentenceVO svo = bdao.selectSentence();
					request.setAttribute("svo", svo);
					request.getRequestDispatcher("board/attendance.jsp").forward(request, response);
					return;
				}
				request.getRequestDispatcher("board/list.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("view")) {
			String bno = request.getParameter("bno");
			try {
				BoardVO bvo = bdao.selectOne(bno, "view");
				bdao.viewHit(bno);
				request.setAttribute("title", transTitle(bvo.getType()));
				request.setAttribute("bvo", bvo);
				request.setAttribute("commentnum", bdao.commentNum(bno));
				request.getRequestDispatcher("board/view.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("writepage")) {
			String type = request.getParameter("type");
			HttpSession session = request.getSession();

			if (session.getAttribute("mvo") == null) {
				request.setAttribute("needlogin", "on");
				request.getRequestDispatcher("board?action=list&type=" + type + "&page=1").forward(request, response);
				return;
			}
			request.setAttribute("mode", "write");
			request.setAttribute("type", type);
			request.getRequestDispatcher("board/write.jsp").forward(request, response);
		}

		if (action.equals("bwrite")) {
			BoardVO bvo = new BoardVO();
			String type = request.getParameter("type");
			bvo.setType(type);
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			bvo.setWriter(request.getParameter("writer"));
			bvo.getTitle().indexOf(0, 10);
			try {
				bdao.write(bvo);
				out.print(type);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("awrite")) {
			BoardVO bvo = new BoardVO();
			String type = request.getParameter("type");
			bvo.setType(type);
			bvo.setTitle(request.getParameter("title"));
			bvo.setWriter(request.getParameter("writer"));

			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");

			try {
				if (bdao.isAttendance(mvo.getNickname())) {
					bdao.write(bvo);
					mvo = mdao.addPoint(50, mvo.getNickname());
					session.setAttribute("mvo", mvo);
					out.print(type);
				} else {
					out.print("false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("modifypage")) {
			String bno = request.getParameter("bno");
			try {
				BoardVO bvo = bdao.selectOne(bno, "modify");
				request.setAttribute("mode", "modify");
				request.setAttribute("bvo", bvo);
				request.setAttribute("type", bvo.getType());
				request.getRequestDispatcher("board/write.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("modify")) {
			BoardVO bvo = new BoardVO();
			bvo.setBno(Integer.parseInt(request.getParameter("bno")));
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			try {
				bdao.modify(bvo);
				out.print(request.getParameter("type"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("delete")) {
			String bno = request.getParameter("bno");
			try {
				bdao.delete(bno);
				out.print(request.getParameter("type"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public String transTitle(String type) {
		String result = "";
		if (type.equals("notice")) {
			result = "공지사항";
		} else if (type.equals("free")) {
			result = "유저공간";
		} else if (type.equals("qna")) {
			result = "개발Q&A";
		} else if (type.equals("welcome")) {
			result = "가입인사";
		} else if (type.equals("attendance")) {
			result = "출석부";
		}
		return result;
	}

}
