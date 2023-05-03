package semi_project.review.dto;

public class RateDTO {
	private int c_5;
	private int c_4;
	private int c_3;
	private int c_2;
	private int c_1;
	private int c_all;
	private double c_avg;
	public RateDTO() {}
	public RateDTO(int c_5, int c_4, int c_3, int c_2, int c_1, int c_all, double c_avg) {
		super();
		this.c_5 = c_5;
		this.c_4 = c_4;
		this.c_3 = c_3;
		this.c_2 = c_2;
		this.c_1 = c_1;
		this.c_all = c_all;
		this.c_avg = c_avg;
	}
	public int getC_5() {
		return c_5;
	}
	public void setC_5(int c_5) {
		this.c_5 = c_5;
	}
	public int getC_4() {
		return c_4;
	}
	public void setC_4(int c_4) {
		this.c_4 = c_4;
	}
	public int getC_3() {
		return c_3;
	}
	public void setC_3(int c_3) {
		this.c_3 = c_3;
	}
	public int getC_2() {
		return c_2;
	}
	public void setC_2(int c_2) {
		this.c_2 = c_2;
	}
	public int getC_1() {
		return c_1;
	}
	public void setC_1(int c_1) {
		this.c_1 = c_1;
	}
	public int getC_all() {
		return c_all;
	}
	public void setC_all(int c_all) {
		this.c_all = c_all;
	}
	public double getC_avg() {
		return c_avg;
	}
	public void setC_avg(double c_avg) {
		this.c_avg = c_avg;
	}
	@Override
	public String toString() {
		return "RateDTO [c_5=" + c_5 + ", c_4=" + c_4 + ", c_3=" + c_3 + ", c_2=" + c_2 + ", c_1=" + c_1 + ", c_all="
				+ c_all + ", c_avg=" + c_avg + "]";
	}
	
	
}
