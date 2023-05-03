package semi_project.nboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import semi_project.nboard.dto.NboardDTO;
import sqlmap.MybatisManager;

public class NboardDAO {
	public List<NboardDTO> nboard_list(Map<String, Object> map, String keyword) {
		List<NboardDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			keyword = "%"+keyword+"%";
			map.put("keyword", keyword);
			list = session.selectList("SP_nboard.list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int nboard_count(String subject, String keyword) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			keyword = "%"+keyword+"%";
			Map<String,Object> map = new HashMap<>();
			map.put("subject", subject);
			map.put("keyword", keyword);

			result = session.selectOne("SP_nboard.count",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void delete(int num) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.delete("SP_nboard.delete",num);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void plusReadCount(int num, HttpSession count_session) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			long read_time = 0;
			if(count_session.getAttribute("read_time_" + num) != null) {
				read_time = (long)count_session.getAttribute("read_time_" + num);
			}
			long current_time = System.currentTimeMillis();
			if(current_time - read_time > 24*60*60*1000) { //하루에 한번
				session.update("SP_nboard.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time_" + num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public NboardDTO view(int num) {
		NboardDTO dto = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_nboard.view", num);
			//String content = dto.getContent();
			/*
			 * content = content.replace(keyword, "<span style='color:red'>" + keyword +
			 * "</span>");
			 */
			//dto.setContent(content);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void update(NboardDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.update("SP_nboard.update",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public NboardDTO toupdate(int num) {
		NboardDTO dto = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_nboard.toupdate", num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void insert(NboardDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_nboard.insert", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}







}
