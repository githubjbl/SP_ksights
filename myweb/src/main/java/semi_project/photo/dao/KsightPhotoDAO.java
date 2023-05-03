package semi_project.photo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi_project.ksight.dto.KsightDTO;
import semi_project.photo.dto.KsightPhotoDTO;
import sqlmap.MybatisManager;

public class KsightPhotoDAO {

	public void upload(KsightPhotoDTO dto) {
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			session.insert("SP_photo.upload", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<KsightPhotoDTO> photolist(String sightname) {
		List<KsightPhotoDTO> list = null; 
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_photo.list", sightname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<KsightPhotoDTO> index_list(String maintitle) {
		List<KsightPhotoDTO> list = null;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			list = session.selectList("SP_photo.index_list", maintitle);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
