package semi_project.ksight.dto;

import java.util.Date;

public class KsightDTO {
	private int num; //번호 primary key
	private String mediatype; //drama artist show로 구분
	private String title; //프로그램제목 가수명
	private String sightname; //촬영지 이름
	private String sighttype; //cvs(편의점1개)/shop(1개)/cafe/store/station/playground/restraunt/stay
	private String explain; //어떤 장면에서 촬영지가 나왔나 설명
	private String opentime; //영업시간
	private String breaktime; //쉬는시간
	private String holiday; //휴무일
	private String address; //촬영지 주소
	private String tel; //촬영지 전화번호
	private Date checkdate; //확인된 날짜
	private int scount; //같은장소 다른촬영으로 중복된장소가 많음. 중복갯수(테이블에 없음)
	private int tcount; //같은장소 다른촬영으로 중복된타이틀이 많음. 중복갯수(테이블에 없음)
	private int sortnum; //촬영지 index로 삼을 것(테이블에 없음)
	private String photo_url; //사진파일 경로 (테이블에 없음)
	
	public KsightDTO() {}

	public KsightDTO(int num, String mediatype, String title, String sightname, String sighttype, String explain,
			String opentime, String breaktime, String holiday, String address, String tel, Date checkdate, int scount,
			int tcount, int sortnum, String photo_url) {
		super();
		this.num = num;
		this.mediatype = mediatype;
		this.title = title;
		this.sightname = sightname;
		this.sighttype = sighttype;
		this.explain = explain;
		this.opentime = opentime;
		this.breaktime = breaktime;
		this.holiday = holiday;
		this.address = address;
		this.tel = tel;
		this.checkdate = checkdate;
		this.scount = scount;
		this.tcount = tcount;
		this.sortnum = sortnum;
		this.photo_url = photo_url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMediatype() {
		return mediatype;
	}

	public void setMediatype(String mediatype) {
		this.mediatype = mediatype;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSightname() {
		return sightname;
	}

	public void setSightname(String sightname) {
		this.sightname = sightname;
	}

	public String getSighttype() {
		return sighttype;
	}

	public void setSighttype(String sighttype) {
		this.sighttype = sighttype;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getOpentime() {
		return opentime;
	}

	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getBreaktime() {
		return breaktime;
	}

	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getCheckdate() {
		return checkdate;
	}

	public void setCheckdate(Date checkdate) {
		this.checkdate = checkdate;
	}

	public int getScount() {
		return scount;
	}

	public void setScount(int scount) {
		this.scount = scount;
	}

	public int getTcount() {
		return tcount;
	}

	public void setTcount(int tcount) {
		this.tcount = tcount;
	}

	public int getSortnum() {
		return sortnum;
	}

	public void setSortnum(int sortnum) {
		this.sortnum = sortnum;
	}

	public String getPhoto_url() {
		return photo_url;
	}

	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}

	@Override
	public String toString() {
		return "KsightDTO [num=" + num + ", mediatype=" + mediatype + ", title=" + title + ", sightname=" + sightname
				+ ", sighttype=" + sighttype + ", explain=" + explain + ", opentime=" + opentime + ", breaktime="
				+ breaktime + ", holiday=" + holiday + ", address=" + address + ", tel=" + tel + ", checkdate="
				+ checkdate + ", scount=" + scount + ", tcount=" + tcount + ", sortnum=" + sortnum + ", photo_url="
				+ photo_url + "]";
	}

	
}
