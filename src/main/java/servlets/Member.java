package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ActionLogDAO;
import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO mdao = new MemberDAO();

		String type = request.getParameter("type");

		if (type.equals("register")) {
			MemberVO mvo = new MemberVO();
			mvo.setId(request.getParameter("register_id"));
			mvo.setPw(request.getParameter("register_pw"));
			mvo.setPermit(1);
			mvo.setNickname(request.getParameter("register_nickname"));
			mvo.setEmail(request.getParameter("register_email"));
			mvo.setPoint(100);
			try {
				out.print(mdao.register(mvo));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (type.equals("login")) {
			String login_id = request.getParameter("login_id");
			String login_pw = request.getParameter("login_pw");
			try {
				MemberVO mvo = mdao.login(login_id, login_pw);
				if (mvo != null) {
					HttpSession session = request.getSession();
					session.setAttribute("mvo", mvo);
					out.print(mvo.getNickname());
				} else {
					out.print("false");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (type.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			out.print("true");
		} else if (type.equals("ispoint")) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String point = request.getParameter("point");
			try {
				if (mdao.isPoint(mvo, point)) {
					out.print("200");
				} else {
					out.print("201");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (type.equals("todaypay")) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String action = request.getParameter("action");
			ActionLogDAO adao = new ActionLogDAO();
			try {
				if (adao.todayPay(action, mvo.getNickname())) {
					out.print("200");
				} else {
					out.print("201");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("index.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
