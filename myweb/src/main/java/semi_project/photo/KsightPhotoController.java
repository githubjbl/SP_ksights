package semi_project.photo;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import semi_project.photo.dao.KsightPhotoDAO;
import semi_project.photo.dto.KsightPhotoDTO;


@WebServlet("/SP_ksight_photo/*")
public class KsightPhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		KsightPhotoDAO dao = new KsightPhotoDAO();
		if(uri.indexOf("list.do") != -1) {
			//KsightController의 profile.do에서 처리
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
			
			//클라이언트 ip주소 가져오기
			String ip = request.getRemoteAddr();
			if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
				InetAddress inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostAddress();
			}
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
			KsightPhotoDTO dto = new KsightPhotoDTO();
			dto.setEmail(email);
			dto.setPhoto_sight(photo_sight);
			dto.setPhoto_url(filename);
			dto.setPhoto_size(filesize);
			dao.upload(dto);
			String referrerPage = request.getHeader("referer");
			response.sendRedirect(referrerPage);
		}else if(uri.indexOf("gallery.do") != -1) {
			String sightname = request.getParameter("sn");
			List<KsightPhotoDTO> plist = dao.photolist(sightname);
			request.setAttribute("sightname", sightname);
			request.setAttribute("plist", plist);
			String page = "/semi_project/ksight/ksight_gallery.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("index.do") != -1) {
			String maintitle1 = "미스터 션샤인";
			String maintitle2 = "방탄소년단";
			String maintitle3 = "암살";
			List<KsightPhotoDTO> list1 = dao.index_list(maintitle1);
			List<KsightPhotoDTO> list2 = dao.index_list(maintitle2);
			List<KsightPhotoDTO> list3 = dao.index_list(maintitle3);
			
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			Map<String,Object> map = new HashMap<>();
			map.put("title1", maintitle1);
			map.put("title2", maintitle2);
			map.put("title3", maintitle3);
			request.setAttribute("map", map);
			
			String page = "/semi_project/mainpage.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
