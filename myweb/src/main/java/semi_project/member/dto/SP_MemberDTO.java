package semi_project.member.dto;

import java.util.Date;

public class SP_MemberDTO {
	private String id;			//회원아이디
	private String password;	//비밀번호
	private String member_name;		//회원이름
	private String member_address1;	//회원주소 시도
	private String member_address2;	//회원주소 시군구
	private String email;		//이메일주소 *primary key
	private String gender;		//성별
	private String mediatype;	//최애(작품,아티스트)
	private String phone;		//전화번호
	private int member_level;	//회원등급
	private Date join_date;		//가입날짜
	private Date birthday;		//생년월일
	public SP_MemberDTO() {}
	public SP_MemberDTO(String id, String password, String member_name, String member_address1, String member_address2,
			String email, String gender, String mediatype, String phone, int member_level, Date join_date,
			Date birthday) {
		super();
		this.id = id;
		this.password = password;
		this.member_name = member_name;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.email = email;
		this.gender = gender;
		this.mediatype = mediatype;
		this.phone = phone;
		this.member_level = member_level;
		this.join_date = join_date;
		this.birthday = birthday;
	}

	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "SP_MemberDTO [id=" + id + ", password=" + password + ", member_name=" + member_name
				+ ", member_address1=" + member_address1 + ", member_address2=" + member_address2 + ", email=" + email
				+ ", gender=" + gender + ", mediatype=" + mediatype + ", phone=" + phone + ", member_level="
				+ member_level + ", join_date=" + join_date + ", birthday=" + birthday + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_address1() {
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMediatype() {
		return mediatype;
	}
	public void setMediatype(String mediatype) {
		this.mediatype = mediatype;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
}
