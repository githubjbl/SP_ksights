package semi_project.review.dto;

public class ReviewDTO {
	private int rnum; //댓글의 번호
	private String rsightname;	//ksight의 sightname과 동일
	private String id;	//member의 id
	private String email; //member의 email
	private String content;
	private int rate;
	private String write_date;
	private String show;
	private int board_group;
	private int bg_seq;	//게시물그룹의 순번(시퀀스 쓴거 아님.)
	private String reply_grade;	//답변 단계
	
	public ReviewDTO() {}

	public ReviewDTO(int rnum, String rsightname, String id, String email, String content, int rate,
			String write_date, String show, int board_group, int bg_seq, String reply_grade) {
		super();
		this.rnum = rnum;
		this.rsightname = rsightname;
		this.id = id;
		this.email = email;
		this.content = content;
		this.rate = rate;
		this.write_date = write_date;
		this.show = show;
		this.board_group = board_group;
		this.bg_seq = bg_seq;
		this.reply_grade = reply_grade;
	}

	@Override
	public String toString() {
		return "ReviewDTO [rnum=" + rnum + ", rsightname=" + rsightname + ", id=" + id + ", email="
				+ email + ", content=" + content + ", rate=" + rate + ", write_date=" + write_date + ", show=" + show
				+ ", board_group=" + board_group + ", bg_seq=" + bg_seq + ", reply_grade=" + reply_grade + "]";
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRsightname() {
		return rsightname;
	}

	public void setRsightname(String rsightname) {
		this.rsightname = rsightname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBg_seq() {
		return bg_seq;
	}

	public void setBg_seq(int bg_seq) {
		this.bg_seq = bg_seq;
	}

	public String getReply_grade() {
		return reply_grade;
	}

	public void setReply_grade(String reply_grade) {
		this.reply_grade = reply_grade;
	}

}
