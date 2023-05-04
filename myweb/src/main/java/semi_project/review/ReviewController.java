package semi_project.review;

import java.io.IOException;
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

import semi_project.review.dao.ReviewDAO;
import semi_project.review.dto.ReviewDTO;

@WebServlet("/SP_ksight_review/*")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		ReviewDAO dao = new ReviewDAO();
		if(uri.indexOf("list.do") != -1) {
			//KsightController의 profile.do에 댓글리스트 생성기능 포함되어있음.
		}else if(uri.indexOf("insert.do") != -1) {
			String rsightname = request.getParameter("rsightname");
			String rateId = request.getParameter("rate");
			int rate = Integer.parseInt(rateId.substring(rateId.length()-1));
			String content = request.getParameter("content");
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			String id = dao.findId(email);
			Map<String,Object> map = new HashMap<>();
			map.put("email", email);
			map.put("rsightname", rsightname);
			map.put("rate", rate);
			map.put("content", content);
			map.put("id", id);
			dao.insert(map);
			String loc = new String(rsightname.getBytes("utf-8"),"8859_1");
			String page = "/SP_ksight/profile.do?sightname=";
			response.sendRedirect(context+page+loc);
		}else if(uri.indexOf("delete.do") != -1) {
			int rnum = Integer.parseInt(request.getParameter("rnum"));
			String rsightname = request.getParameter("rsightname");
			dao.delete(rnum);
			String page = "/SP_ksight/profile.do?sightname=";
			String loc = new String(rsightname.getBytes("utf-8"),"8859_1");
			response.sendRedirect(context+page+loc);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
