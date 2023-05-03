package semi_project.ksight;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Enumeration;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import semi_project.Pager;
import semi_project.ksight.dao.KsightDAO;
import semi_project.ksight.dto.KsightDTO;
import semi_project.photo.dao.KsightPhotoDAO;
import semi_project.photo.dto.KsightPhotoDTO;
import semi_project.review.dao.ReviewDAO;
import semi_project.review.dto.RateDTO;
import semi_project.review.dto.ReviewDTO;

@WebServlet("/SP_ksight/*")
public class KsightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		KsightDAO dao = new KsightDAO();
		if(uri.indexOf("list.do") != -1) {
			String kword = request.getParameter("kword");
			if(kword == null) kword = "";
			int count = dao.ksight_count(kword);
			System.out.println(count);
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<KsightDTO> list = dao.ksight_list(start,end,kword);
			List<KsightDTO> list2 = dao.ksight_list_title(kword);
			System.out.println(list2);
			String page = "/semi_project/ksight/ksight_search_list.jsp";
			if(!list.isEmpty()) {
				request.setAttribute("list", list);
				request.setAttribute("list2", list2);
				request.setAttribute("page", pager);
				request.setAttribute("kword", kword);
				request.setAttribute("count", count);
				System.out.println(kword);
			}else {
				String message = "입력하신 검색어에 해당하는 결과가 없습니다.";
				request.setAttribute("message", message);
				page = "/semi_project/ksight/ksight_search_fault.jsp";
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("profile.do") != -1) {
			ReviewDAO dao2 = new ReviewDAO();
			KsightPhotoDAO dao3 = new KsightPhotoDAO();
			String sightname = request.getParameter("sightname");
			List<KsightDTO> list = dao.profile(sightname);
			
			String category = "sightname";
			List<KsightDTO> list2 = dao.profile_category(sightname, category);
			
			category = "title";
			List<KsightDTO> list3 = dao.profile_category(sightname, category);
			
			List<ReviewDTO> rlist = dao2.reviewlist(sightname);
			List<KsightPhotoDTO> plist = new ArrayList<KsightPhotoDTO>();
			
			RateDTO ratedto = new RateDTO();
			plist = dao3.photolist(sightname);
			if(!rlist.isEmpty()) {
				//평점평균
				ratedto = dao2.rateCount(sightname);
				ratedto.setC_avg(Double.parseDouble(String.format("%.2f",ratedto.getC_avg())));
				
				System.out.println(ratedto);
			}else {
				ratedto.setC_1(0);
				ratedto.setC_2(0);
				ratedto.setC_3(0);
				ratedto.setC_4(0);
				ratedto.setC_5(0);
				ratedto.setC_all(0);
				ratedto.setC_avg(0.00);
				System.out.println(ratedto);
			}
			KsightPhotoDTO pdto = new KsightPhotoDTO();
			int pcount = 0;
			if(!plist.isEmpty()) {
				pdto = plist.get(0);
				pcount = plist.size();
				request.setAttribute("plist", plist);
			}else {
				pdto.setPhoto_url("empty^.jpg");
			}
			request.setAttribute("pdto", pdto);
			request.setAttribute("pcount", pcount);
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("rlist", rlist);
			request.setAttribute("ratedto", ratedto);
			request.setAttribute("sightname", sightname);
			System.out.println(list);
			String page = "/semi_project/ksight/ksight_profile.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("sort.do") != -1) {
			Map<String,Object> map = new HashMap<>();
			String sort = request.getParameter("sort");
			String member_address1 = "";
			String member_address2 = "";
			String mediatype = "";
			String initial = "";
			String initial2 = "";
			String page = "/semi_project/ksight/ksight_list.jsp";
			if(sort.equals("na")){
				member_address1 = request.getParameter("p1");
				member_address2 = request.getParameter("p2");
				if(member_address2.equals("전체")) {
					member_address2 = "";
				}
				map.put("member_address1", member_address1);
				map.put("member_address2", member_address2);
			}else if(sort.equals("me") || sort.equals("ar")){
				page = "/semi_project/ksight/ksight_list_mediatype.jsp";
				mediatype = request.getParameter("p1");
				int ini = Integer.parseInt(request.getParameter("p2"));
				initial = "";
				String arr[] = { "전체", "가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하", "힣" };
				if(ini == 0) {
					initial = arr[ini];
				}else if(ini == 15) {
					initial = "abc";
				}else {
						initial = arr[ini];
						initial2 = arr[ini+1];
				}
				map.put("mediatype", mediatype);
				map.put("initial", initial);
				map.put("initial2", initial2);
				map.put("ini", ini);
				List<KsightDTO> list2 = dao.sort_title(map);
				request.setAttribute("list2", list2);
			}
			map.put("sort", sort);
			List<KsightDTO> list = dao.sort_list(map);
			int count = list.size();
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			map.put("start", start);
			map.put("end", end);
			List<KsightDTO> list_pager = dao.sort_list_pager(map);
			map.put("count", count);
			request.setAttribute("map", map);
			request.setAttribute("list", list);
			request.setAttribute("list_pager", list_pager);
			request.setAttribute("page", pager);
			System.out.println(list_pager);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("sort_t.do") != -1) {
			String title = request.getParameter("tit");
			List<KsightDTO> list = dao.sort_t_list(title);
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			String page = "/semi_project/ksight/ksight_list_title.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("list_ingi.do") != -1) {
			String sort = request.getParameter("ingi");
			String type = request.getParameter("type");
			if(sort == null) sort = "none";
			if(type == null) type = "none";
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			System.out.println("email"+email);
			if(email == null) email = " ";
			int count = dao.ksight_count_ingi(sort,type,email);
			System.out.println(count);
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<KsightDTO> list = dao.ksight_list_ingi(start,end,sort,type,email);
			System.out.println("list"+list);
			request.setAttribute("page", pager);
			request.setAttribute("sort", sort);
			request.setAttribute("type", type);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			String page = "/semi_project/ksight/ksight_ingilist.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("upload.do") != -1) {
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("email");
			//파일 업로드 처리
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) { //업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir(); //디렉토리를 만듦
			}
			//request를 확장시킨 multipartRequest생성
			MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			String sightname = multi.getParameter("sightname");
			String title = multi.getParameter("title");
			String explain = multi.getParameter("explain");
			String mediatype = multi.getParameter("mediatype");
			String sighttype = multi.getParameter("sighttype");
			String opentime = multi.getParameter("opentime");
			if(opentime == null) opentime = "정보없음";
			String breaktime = multi.getParameter("breaktime");
			if(breaktime == null) breaktime = "정보없음";
			String holiday = multi.getParameter("holiday");
			if(holiday == null) holiday = "정보없음";
			String tel = multi.getParameter("tel");
			if(tel == null) tel = "정보없음";
			String addressdetail = multi.getParameter("addressdetail");
			String v_member_address1 = multi.getParameter("v_member_address1");
			String v_member_address2 = multi.getParameter("v_member_address2");
			String address = v_member_address1 + " " + v_member_address2 + " " + addressdetail;
			
			KsightDTO dto = new KsightDTO();
			dto.setSightname(sightname);
			dto.setTitle(title);
			dto.setExplain(explain);
			dto.setMediatype(mediatype);
			dto.setSighttype(sighttype);
			dto.setOpentime(opentime);
			dto.setBreaktime(breaktime);
			dto.setHoliday(holiday);
			dto.setTel(tel);
			dto.setAddress(address);
			
			System.out.println(dto);
			dao.sightupload(dto);
			
			//클라이언트 ip주소 가져오기
			String ip = request.getRemoteAddr();
			if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
				InetAddress inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostAddress();
			}
			System.out.println("클라이언트IP주소 : " + ip);
			String filename = " "; //공백 1개
			int filesize = 0;
			try {
				//첨부파일 집합
				Enumeration files = multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1 = (String)files.nextElement();
					filename = multi.getFilesystemName(file1);
					File f1 = multi.getFile(file1);
					if(f1 != null) {
						filesize = (int)f1.length(); //파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String photo_sight = multi.getParameter("sightname");
			System.out.println(photo_sight);
			KsightPhotoDTO pdto = new KsightPhotoDTO();
			pdto.setEmail(email);
			pdto.setPhoto_sight(photo_sight);
			pdto.setPhoto_url(filename);
			pdto.setPhoto_size(filesize);
			System.out.println(pdto);
			KsightPhotoDAO pdao = new KsightPhotoDAO();
			pdao.upload(pdto);
			String page = "/semi_project/mainpage.jsp";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('등록 되었습니다.'); location.href='"+context+page+"'</script>");
			writer.close();
		}
		


	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
