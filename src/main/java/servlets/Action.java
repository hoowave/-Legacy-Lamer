package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import dao.ActionLogDAO;
import dao.MemberDAO;
import shell.Shell;
import vo.ActionLogVO;
import vo.MemberVO;

@WebServlet("/action")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100, location = "./")
public class Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		ActionLogDAO adao = new ActionLogDAO();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		ActionLogVO avo = new ActionLogVO();
		MemberDAO mdao = new MemberDAO();

		String type = request.getParameter("type");
		String step = request.getParameter("step");

		if (type.equals("office")) {
			String option = request.getParameter("option");
			if (option.equals("default")) {
				String filename = request.getParameter("filename");
				Shell script = new Shell(
						"(echo killall john && echo cd /var/www/html/file/ && echo wget -P ./ -m http://192.168.0.186:8090/project/files/"
								+ filename
								+ " && echo /root/JohnTheRipper/run/office2john.py /var/www/html/file/192.168.0.186:8090/project/files/"
								+ filename
								+ " ^> ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt --show ^> ./password.txt && echo find . ! -name password.txt -delete) > D:\\shell\\office_step1_default.txt");
				Shell step1 = new Shell("D:\\shell\\office_step1_default.bat");
				try {
					if (!adao.todayPay(type, mvo.getNickname())) {
						mvo = mdao.subPoint(50, mvo.getNickname());
					}
					avo.setType(type);
					avo.setNickname(mvo.getNickname());
					adao.insertLog(avo);
					session.setAttribute("mvo", mvo);
					script.executeShell();
					step1.executeShell();
					URL url = new URL("http://192.168.0.185/file/password.txt");
					BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
					String line = "";
					String temp = "";
					line = input.readLine();
					temp += line;
					String result = arrchiveRs(temp);
					out.print(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (option.equals("custom")) {
				String filename = request.getParameter("filename");
				String txtname = request.getParameter("txtname");
				Shell script = new Shell(
						"(echo killall john && echo cd /var/www/html/file/ && echo wget -P ./ -m http://192.168.0.186:8090/project/files/"
								+ filename + "&& echo wget -P ./ -m http://192.168.0.186:8090/project/files/" + txtname
								+ " && echo /root/JohnTheRipper/run/office2john.py /var/www/html/file/192.168.0.186:8090/project/files/"
								+ filename
								+ " ^> ./hash.txt && echo /root/JohnTheRipper/run/john -w:/var/www/html/file/192.168.0.186:8090/project/files/"
								+ txtname
								+ " ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt --show ^> ./password.txt && echo find . ! -name password.txt -delete) > D:\\shell\\office_step1_custom.txt");
				Shell step1 = new Shell("D:\\shell\\office_step1_custom.bat");
				try {
					if (!adao.todayPay(type, mvo.getNickname())) {
						mvo = mdao.subPoint(50, mvo.getNickname());
					}
					avo.setType(type);
					avo.setNickname(mvo.getNickname());
					adao.insertLog(avo);
					session.setAttribute("mvo", mvo);
					script.executeShell();
					step1.executeShell();
					URL url = new URL("http://192.168.0.185/file/password.txt");
					BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
					String line = "";
					String temp = "";
					line = input.readLine();
					temp += line;
					String result = arrchiveRs(temp);
					out.print(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (type.equals("archive")) {
			String option = request.getParameter("option");
			if (option.equals("default")) {
				String filename = request.getParameter("filename");
				Shell script = new Shell(
						"(echo killall john && echo cd /var/www/html/file/ && echo wget -P ./ -m http://192.168.0.186:8090/project/files/"
								+ filename
								+ " && echo /root/JohnTheRipper/run/zip2john /var/www/html/file/192.168.0.186:8090/project/files/"
								+ filename
								+ " ^> ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt --show ^> ./password.txt && echo find . ! -name password.txt -delete) > D:\\shell\\archive_step1_default.txt");
				Shell step1 = new Shell("D:\\shell\\archive_step1_default.bat");
				try {
					if (!adao.todayPay(type, mvo.getNickname())) {
						mvo = mdao.subPoint(50, mvo.getNickname());
					}
					avo.setType(type);
					avo.setNickname(mvo.getNickname());
					adao.insertLog(avo);
					session.setAttribute("mvo", mvo);
					script.executeShell();
					step1.executeShell();
					URL url = new URL("http://192.168.0.185/file/password.txt");
					BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
					String line = "";
					String temp = "";
					line = input.readLine();
					temp += line;
					String result = arrchiveRs(temp);
					out.print(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (option.equals("custom")) {
				String filename = request.getParameter("filename");
				String txtname = request.getParameter("txtname");
				Shell script = new Shell(
						"(echo killall john && echo cd /var/www/html/file/ && echo wget -P ./ -m http://192.168.0.186:8090/project/files/"
								+ filename + "&& echo wget -P ./ -m http://192.168.0.186:8090/project/files/" + txtname
								+ " && echo /root/JohnTheRipper/run/zip2john /var/www/html/file/192.168.0.186:8090/project/files/"
								+ filename
								+ " ^> ./hash.txt && echo /root/JohnTheRipper/run/john -w:/var/www/html/file/192.168.0.186:8090/project/files/"
								+ txtname
								+ " ./hash.txt && echo /root/JohnTheRipper/run/john ./hash.txt --show ^> ./password.txt && echo find . ! -name password.txt -delete) > D:\\shell\\archive_step1_custom.txt");
				Shell step1 = new Shell("D:\\shell\\archive_step1_custom.bat");
				try {
					if (!adao.todayPay(type, mvo.getNickname())) {
						mvo = mdao.subPoint(50, mvo.getNickname());
					}
					avo.setType(type);
					avo.setNickname(mvo.getNickname());
					adao.insertLog(avo);
					session.setAttribute("mvo", mvo);
					script.executeShell();
					step1.executeShell();
					URL url = new URL("http://192.168.0.185/file/password.txt");
					BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
					String line = "";
					String temp = "";
					line = input.readLine();
					temp += line;
					String result = arrchiveRs(temp);
					out.print(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (type.equals("mirroring") && step.equals("1")) {
			String url = request.getParameter("url");
			Shell script = new Shell(
					"echo " + "wget -P /var/www/html/file -m " + url + " > D:\\shell\\mirroring_step1.txt");
			Shell step1 = new Shell("D:\\shell\\mirroring_step1.bat");
			try {
				if (!adao.todayPay(type, mvo.getNickname())) {
					mvo = mdao.subPoint(50, mvo.getNickname());
				}
				session.setAttribute("mvo", mvo);
				avo.setType(type);
				avo.setNickname(mvo.getNickname());
				avo.setUrl(url);
				adao.insertLog(avo);
				script.executeShell();
				out.print(step1.executeShell());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (type.equals("mirroring") && step.equals("2")) {
			String compress = request.getParameter("compress");
			if (compress.equals("zip")) {
				Shell step3 = new Shell("D:\\shell\\mirroring_step2_zip.bat");
				try {
					out.print(step3.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (compress.equals("gzip")) {
				Shell step3 = new Shell("D:\\shell\\mirroring_step2_gzip.bat");
				try {
					out.print(step3.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (type.equals("clone") && step.equals("1")) {
			String level = request.getParameter("level");
			String url = request.getParameter("url");

			try {
				if (!adao.todayPay(type, mvo.getNickname())) {
					mvo = mdao.subPoint(50, mvo.getNickname());
				}
				session.setAttribute("mvo", mvo);
				avo.setType(type);
				avo.setNickname(mvo.getNickname());
				avo.setUrl(url);
				adao.insertLog(avo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (level.equals("lv2")) {
				Shell script = new Shell("echo " + "httrack " + url + " -O /var/www/html/file -v -S"
						+ " > D:\\shell\\clone_step1_lv2.txt");
				Shell step1 = new Shell("D:\\shell\\clone_step1_lv2.bat");
				try {
					script.executeShell();
					out.print(step1.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (level.equals("lv3")) {
				Shell script = new Shell(
						"echo " + "httrack " + url + " -O /var/www/html/file -v" + " > D:\\shell\\clone_step1_lv3.txt");
				Shell step1 = new Shell("D:\\shell\\clone_step1_lv3.bat");
				try {
					script.executeShell();
					out.print(step1.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (type.equals("clone") && step.equals("2")) {
			Shell step2 = new Shell("D:\\shell\\clone_step2.bat");
			try {
				out.print(step2.executeShell());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (type.equals("clone") && step.equals("3")) {
			String compress = request.getParameter("compress");
			if (compress.equals("zip")) {
				Shell step3 = new Shell("D:\\shell\\clone_step3_zip.bat");
				try {
					out.print(step3.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (compress.equals("gzip")) {
				Shell step3 = new Shell("D:\\shell\\clone_step3_gzip.bat");
				try {
					out.print(step3.executeShell());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (type.equals("dictionary") && step.equals("1")) {
			String num1 = request.getParameter("num1");
			String num2 = request.getParameter("num2");
			String str = request.getParameter("str");
			try {
				if (!adao.todayPay(type, mvo.getNickname())) {
					mvo = mdao.subPoint(20, mvo.getNickname());
				}
				avo.setType(type);
				avo.setNickname(mvo.getNickname());
				adao.insertLog(avo);
				session.setAttribute("mvo", mvo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Shell script = new Shell("echo crunch " + num1 + " " + num2 + " " + str
					+ " -o /var/www/html/file/result.txt > D:\\shell\\dictionary_step1.txt");
			Shell step1 = new Shell("D:\\shell\\dictionary_step1.bat");
			try {
				script.executeShell();
				out.print(step1.executeShell());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (type.equals("scan") && step.equals("all")) {
			String ip = request.getParameter("ip");

			try {
				if (!adao.todayPay(type, mvo.getNickname())) {
					mvo = mdao.subPoint(50, mvo.getNickname());
				}
				avo.setType(type);
				avo.setNickname(mvo.getNickname());
				adao.insertLog(avo);
				session.setAttribute("mvo", mvo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Shell script = new Shell(
					"echo nmap -open " + ip + " ^> /var/www/html/file/scan.txt > D:\\shell\\scan_all.txt");
			Shell step1 = new Shell("D:\\shell\\scan_all.bat");
			try {
				script.executeShell();
				step1.executeShell();
				URL url = new URL("http://192.168.0.185/file/scan.txt");
				BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
				String line = "";
				String temp = "";
				while ((line = input.readLine()) != null) {
					temp += line + "ln";
				}
				ArrayList<String> result = scanRs(ip, temp, "SERVICE", "MAC");
				JSONArray result_json = new JSONArray(result);
				out.print(result_json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (type.equals("scan") && step.equals("port")) {
			String ip = request.getParameter("ip");
			String port = request.getParameter("port");

			try {
				mvo = mdao.subPoint(10, mvo.getNickname());
				avo.setType(type);
				avo.setNickname(mvo.getNickname());
				adao.insertLog(avo);
				session.setAttribute("mvo", mvo);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Shell script = new Shell(
					"echo nmap " + ip + " -p " + port + " ^> /var/www/html/file/scan.txt > D:\\shell\\scan_port.txt");
			Shell step1 = new Shell("D:\\shell\\scan_port.bat");
			try {
				script.executeShell();
				step1.executeShell();
				URL url = new URL("http://192.168.0.185/file/scan.txt");
				BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
				String line = "";
				String temp = "";
				while ((line = input.readLine()) != null) {
					temp += line + "ln";
				}
				ArrayList<String> result = scanRs(ip, temp, "SERVICE", "MAC");
				JSONArray result_json = new JSONArray(result);
				out.print(result_json);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public ArrayList<String> scanRs(String ip, String str, String a, String b) {
		ArrayList<String> result = new ArrayList<>();
		result.add(ip);

		String[] time1 = str.split("at");
		String[] time2 = time1[1].split("Nmap scan");
		String[] time3 = time2[0].split("ln");
		result.add(time3[0].trim());

		String[] temp1 = str.split(a);
		String[] temp2 = temp1[1].split(b);
		String temp3 = temp2[0].replace("ln", "  ");
		String[] temp4 = temp3.split(" |  ");
		for (int i = 0; i < temp4.length; i++) {
			if (temp4[i].length() != 0) {
				result.add(temp4[i].trim());
			}
		}
		return result;
	}

	public String arrchiveRs(String str) {
		String[] temp = str.split(":");
		return temp[1];
	}

}
