package semi_project.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crypt.BCrypt;
import semi_project.Pager;
import semi_project.member.dao.SP_MemberDAO;
import semi_project.member.dto.SP_MemberDTO;


@WebServlet("/SP_ksight_member/*")
public class SP_mController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		SP_MemberDAO dao = new SP_MemberDAO();
		if(uri.indexOf("list.do") != -1) {
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			int count = dao.count(keyword);
				//페이지 나누기
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			List<SP_MemberDTO> list = dao.memberList(map, keyword);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			String page = "/semi_project/member/member_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("view.do") != -1) {
			String email = request.getParameter("email");
			HttpSession session = request.getSession();
			String session_email = (String)session.getAttribute("email");
			int member_level = dao.checkadmin(session_email);
			SP_MemberDTO dto = dao.view(email);
			request.setAttribute("dto", dto);
			String page = "/semi_project/member/member_view.jsp";
			if(member_level == 3) {
				page = "/semi_project/member/member_view_admin.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("register.do") != -1) {
			String email = request.getParameter("emailId");
			String id = request.getParameter("id");
			String password = request.getParameter("pwd");
			password = BCrypt.hashpw(password, BCrypt.gensalt());
			String member_name = request.getParameter("member_name");
			String member_address1 = request.getParameter("v_member_address1");
			String member_address2 = request.getParameter("v_member_address2");
			String gender = request.getParameter("gender");
			String mediatype = request.getParameter("mediatype");
			String phone = request.getParameter("phone");
			//String으로 입력받은 생일 Date로 타입변경 & yyyymmdd 에서 yyyy-mm-dd로 변경
			String inputbrithday = request.getParameter("birthday");
			SimpleDateFormat bdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat adf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date tempDate = null; 
			try {
				tempDate = bdf.parse(inputbrithday);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String transDate = adf.format(tempDate);
			Date birthday = Date.valueOf(transDate);
			
			SP_MemberDTO dto = new SP_MemberDTO();
			dto.setEmail(email);
			dto.setId(id);
			dto.setPassword(password);
			dto.setMember_name(member_name);
			dto.setMember_address1(member_address1);
			dto.setMember_address2(member_address2);
			dto.setGender(gender);
			dto.setMediatype(mediatype);
			dto.setPhone(phone);
			dto.setBirthday(birthday);
			dao.insert(dto);
			String page = "/semi_project/index.jsp";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("toupdate.do") != -1) {
			String email = request.getParameter("email");
			SP_MemberDTO dto = dao.toupdate(email);
			request.setAttribute("dto", dto);
			String page = "/semi_project/member/member_update.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			String password = request.getParameter("pwd");
			String member_address1 = request.getParameter("v_member_address1");
			String member_address2 = request.getParameter("v_member_address2");
			String mediatype = request.getParameter("mediatype");
			String phone = request.getParameter("phone");
			SP_MemberDTO dto = new SP_MemberDTO();
			dto.setEmail(email);
			dto.setId(id);
			dto.setPassword(password);
			dto.setMember_address1(member_address1);
			dto.setMember_address2(member_address2);
			dto.setMediatype(mediatype);
			dto.setPhone(phone);
			dao.update(dto);
			String page = "/semi_project/member/member_index.jsp";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("delete.do") != -1) {
			String email = request.getParameter("email");
			dao.delete(email);
			String page = "/semi_project/member/member_index.jsp";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("login.do") != -1) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			SP_MemberDTO dto = new SP_MemberDTO();
			String result = dao.checklogin(email,password);
			if(!result.equals("로그인 실패")) {
				request.setAttribute("result", result);
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("password", password);
				dto = dao.infologin(email);
				int level = dto.getMember_level();
				session.setAttribute("member_level", level);
				request.setAttribute("dto", dto);
				String page = "/semi_project/member/member_login.jsp";
				String page2 = "/semi_project/member/member_register.jsp";
				String page3 = "/semi_project/member/member_findpassword.jsp";
				String referrerPage = request.getHeader("referer");
				if(referrerPage.indexOf(page) != -1 || referrerPage.indexOf(page2) != -1 || referrerPage.indexOf(page3) != -1) {
					response.sendRedirect(context+"/semi_project/index.jsp");
				}else {
					response.sendRedirect(referrerPage);
				}
			}else {
				request.setAttribute("result", result);
				String page = "/semi_project/member/member_login.jsp";

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다.'); location.href='"+context+page+"'</script>");
				writer.close();
			}
		}else if(uri.indexOf("findPassword.do") != -1) {
			String email = request.getParameter("emailid");
			String member_name = request.getParameter("member_name");
			String inputbrithday = request.getParameter("birthday");
			Date birthday = Date.valueOf(inputbrithday);
			Map<String,Object> map = new HashMap<>();
			SP_MemberDTO dto = new SP_MemberDTO();
			map.put("email", email);
			map.put("member_name", member_name);
			map.put("birthday", birthday);
			dto = dao.findPassword(map);
			if(dto.getJoin_date() != null) {
				request.setAttribute("dto", dto);
				String page = "/semi_project/member/member_changePassword.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
				String page = "/semi_project/member/member_findpassword.jsp";

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('입력하신 회원은 존재하지 않습니다.'); location.href='"+context+page+"'</script>");
				writer.close();
			}
		}else if(uri.indexOf("changePassword") != -1) {
			String email = request.getParameter("emailid");
			String password = request.getParameter("pwd");
			SP_MemberDTO dto = new SP_MemberDTO();
			dto.setEmail(email);
			dto.setMember_name(password);
			dao.changePassword(dto);
			String page = "/semi_project/index.jsp";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호가 변경되었습니다.'); location.href='"+context+page+"'</script>");
			writer.close();
		}else if(uri.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate();
			String page = "/semi_project/index.jsp";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그아웃 되었습니다.'); location.href='"+context+page+"'</script>");
			writer.close();
		}else if(uri.indexOf("loginbox.do") != -1) {
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			SP_MemberDTO dto = dao.toupdate(email);
			request.setAttribute("dto", dto);
			String page = "/semi_project/member/member_login_success.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("mypage.do") != -1) {
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			SP_MemberDTO dto = dao.toupdate(email);
			request.setAttribute("dto", dto);
			String page = "/semi_project/member/member_update.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("checkid.do") != -1) {
			String id = request.getParameter("id");
			int checkid = dao.checkid(id);
			String check = "";
			if(checkid == 0) {
				check = "y";
			}else {
				check = "n";
			}
			request.setAttribute("check", check);
			request.setAttribute("id", id);
			String page = "/semi_project/member/member_checkid.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("update_admin.do") != -1) {
			String email = request.getParameter("email");
			int member_level = Integer.parseInt(request.getParameter("member_level"));
			
			SP_MemberDTO dto = new SP_MemberDTO();
			dto.setEmail(email);
			dto.setMember_level(member_level);
			
			dao.update_admin(dto);
			String page = "/semi_project/index.jsp";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원등급이 변경되었습니다.'); location.href='"+context+page+"'</script>");
			writer.close();
		}
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
