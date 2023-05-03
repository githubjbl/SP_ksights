package semi_project.photo.dto;

import java.util.Date;

public class KsightPhotoDTO {
	private Date upload_date;
	private String photo_url; 
	private int photonum;        
	private String email;
	private String photo_sight;
	private int photo_size;
	private String id; //member의 id와 같은값. 그러나 이 테이블엔 없음
	
	public KsightPhotoDTO() {}

	public KsightPhotoDTO(Date upload_date, String photo_url, int photonum, String email, String photo_sight,
			int photo_size, String id) {
		super();
		this.upload_date = upload_date;
		this.photo_url = photo_url;
		this.photonum = photonum;
		this.email = email;
		this.photo_sight = photo_sight;
		this.photo_size = photo_size;
		this.id = id;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getPhoto_url() {
		return photo_url;
	}

	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}

	public int getPhotonum() {
		return photonum;
	}

	public void setPhotonum(int photonum) {
		this.photonum = photonum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto_sight() {
		return photo_sight;
	}

	public void setPhoto_sight(String photo_sight) {
		this.photo_sight = photo_sight;
	}

	public int getPhoto_size() {
		return photo_size;
	}

	public void setPhoto_size(int photo_size) {
		this.photo_size = photo_size;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "KsightPhotoDTO [upload_date=" + upload_date + ", photo_url=" + photo_url + ", photonum=" + photonum
				+ ", email=" + email + ", photo_sight=" + photo_sight + ", photo_size=" + photo_size + ", id=" + id
				+ "]";
	}


	
}