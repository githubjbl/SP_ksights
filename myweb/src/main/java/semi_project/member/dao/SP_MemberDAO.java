package semi_project.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import crypt.BCrypt;
import semi_project.member.dto.SP_MemberDTO;
import sqlmap.MybatisManager;

public class SP_MemberDAO {

	public int count(String keyword) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			keyword = "%"+keyword+"%";
			Map<String,Object> map = new HashMap<>();
			map.put("keyword", keyword);

			result = session.selectOne("SP_member.count",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<SP_MemberDTO> memberList(Map<String, Object> map, String keyword) {
		List<SP_MemberDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			keyword = "%"+keyword+"%";
			map.put("keyword", keyword);
			list = session.selectList("SP_member.list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public SP_MemberDTO view(String email) {
		SP_MemberDTO dto = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_member.view", email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void insert(SP_MemberDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_member.insert", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(SP_MemberDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.update("SP_member.update", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SP_MemberDTO toupdate(String email) {
		SP_MemberDTO dto = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_member.view", email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void delete(String email) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_member.delete", email);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String checklogin(String email, String password) {
		SP_MemberDTO dto = new SP_MemberDTO();
		String result = "";
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto.setEmail(email);
			dto.setPassword(password);
			String password_BC = BCrypt.hashpw(password, BCrypt.gensalt());
			dto.setPassword(password_BC);
			dto = session.selectOne("SP_member.checklogin", dto);
			if(dto != null) {
				if(BCrypt.checkpw(password, dto.getPassword())) {
					result = dto.getId() + "님 로그인";
				}else {
					result = "로그인 실패";
				}
			
			}else {
				result = "로그인 실패";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public SP_MemberDTO infologin(String email) {
		SP_MemberDTO dto = new SP_MemberDTO();
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_member.checklogin", email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public SP_MemberDTO findPassword(Map<String, Object> map) {
		SP_MemberDTO dto = new SP_MemberDTO();
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			dto = session.selectOne("SP_member.findPassword", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

		
	public void changePassword(SP_MemberDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.update("SP_member.changePassword", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int checkid(String id) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_member.checkid", id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int checkadmin(String session_email) {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_member.checkadmin", session_email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



}
