package semi_project.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi_project.review.dto.RateDTO;
import semi_project.review.dto.ReviewDTO;
import sqlmap.MybatisManager;

public class ReviewDAO {
	
	public List<ReviewDTO> reviewlist(String sightname) {
		List<ReviewDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_review.sight_review", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void insert(Map<String, Object> map) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_review.insert", map);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String findId(String email) {
		String id="";
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			id = session.selectOne("SP_review.findId", email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	public double rateAvg(String sightname) {
		double result = 0.0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_review.rateAvg", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void delete(int rnum) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.delete("SP_review.delete", rnum);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public RateDTO rateCount(String sightname) {
		RateDTO result = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("SP_review.rateCount", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
