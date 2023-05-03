package semi_project.ksight.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi_project.ksight.dto.KsightDTO;
import sqlmap.MybatisManager;

public class KsightDAO {

	public List<KsightDTO> ksight_list(int start, int end, String kword) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("kword", kword);
			list = session.selectList("SP_ksight.list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<KsightDTO> ksight_list_title(String kword) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.list_title", kword);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int ksight_count(String kword) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_ksight.count", kword);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<KsightDTO> profile(String sightname) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.profile", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	public List<KsightDTO> sort_list(Map<String, Object> map) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.sort_list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<KsightDTO> sort_title(Map<String, Object> map) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.sort_title", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<KsightDTO> sort_t_list(Map<String, Object> map) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.sort_t_list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<KsightDTO> sight_title(String sightname) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.sight_title", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<KsightDTO> sort_list_pager(Map<String,Object> map) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_ksight.sort_list_pager", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<KsightDTO> ksight_list_ingi(int start, int end, String sort, String type, String email) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("sort", sort);
			map.put("type", type);
			map.put("email", email);
			
			list = session.selectList("SP_ksight.list_ingi", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int ksight_count_ingi(String sort, String type, String email) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("sort", sort);
			map.put("type", type);
			map.put("email", email);
			result = session.selectOne("SP_ksight.list_ingi_count", map);
		}catch (Exception e) {
		e.printStackTrace();
		}
	return result;
	}

	public List<KsightDTO> profile_category(String sightname, String category) {
		List<KsightDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("sightname", sightname);
			map.put("category", category);
			list = session.selectList("SP_ksight.profile_category", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void sightupload(KsightDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_ksight.sightupload", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int sort_t_list_count(String title) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_ksight.sort_t_count", title);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	

}
