package semi_project.nboard;

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

import semi_project.Pager;
import semi_project.nboard.dao.NboardDAO;
import semi_project.nboard.dto.NboardDTO;


@WebServlet("/SP_ksight_nboard/*")
public class NboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		NboardDAO dao = new NboardDAO();
		if(uri.indexOf("list.do") != -1) {
			String keyword = request.getParameter("keyword");
			String subject = request.getParameter("subject");
			if(keyword == null) keyword = "";
			if(subject == null) subject = "none";
			int count = dao.nboard_count(subject,keyword);
			System.out.println(count);
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
			map.put("subject", subject);
			List<NboardDTO> list = dao.nboard_list(map,keyword);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			request.setAttribute("keyword", keyword);
			request.setAttribute("subject", subject);
			String page = "/semi_project/nboard/nboard_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("delete.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			dao.delete(num);
			String page = "/SP_ksight_nboard/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("view.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			HttpSession session = request.getSession();
			dao.plusReadCount(num,session);
			NboardDTO dto = dao.view(num);
			request.setAttribute("dto", dto);
			String page = "/semi_project/nboard/nboard_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("toupdate.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			NboardDTO dto = dao.toupdate(num);
			request.setAttribute("dto", dto);
			String page = "/semi_project/nboard/nboard_update.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			String subject = request.getParameter("subject");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			NboardDTO dto = new NboardDTO();
			dto.setNum(num);
			dto.setSubject(subject);
			dto.setTitle(title);
			dto.setContent(content);
			dao.update(dto);
			String page = "/myweb/SP_ksight_nboard/view.do?num="+num;
			response.sendRedirect(page);
		}else if(uri.indexOf("insert.do") != -1) {
			String subject = request.getParameter("subject");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			NboardDTO dto = new NboardDTO();
			dto.setSubject(subject);
			dto.setTitle(title);
			dto.setContent(content);
			dao.insert(dto);
			request.setAttribute("dto", dto);
			String page = "/semi_project/nboard/nboard_index.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);

		}




	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
