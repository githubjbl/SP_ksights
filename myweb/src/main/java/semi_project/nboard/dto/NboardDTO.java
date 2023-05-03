package semi_project.nboard.dto;


public class NboardDTO {
	private int num;	//게시물번호
	private String title;	//제목
	private String write_date;	//작성일자
	private int readcount;	//조회수
	private String content;	//본문
	private String subject;	//작성글의 갈래(공지인지 이벤트인지)
	public NboardDTO() {}
	public NboardDTO(int num, String title, String write_date, int readcount, String content, String subject) {
		this.num = num;
		this.title = title;
		this.write_date = write_date;
		this.readcount = readcount;
		this.content = content;
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "NboardDTO [num=" + num + ", title=" + title + ", write_date=" + write_date + ", readcount=" + readcount
				+ ", content=" + content + ", subject=" + subject + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

}
