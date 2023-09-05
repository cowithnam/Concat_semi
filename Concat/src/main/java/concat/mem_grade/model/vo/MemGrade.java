package concat.mem_grade.model.vo;

public class MemGrade {
	
	private int gradeNo;
	private String gradeName;
	private String grade_img;

	public MemGrade() {}

	public MemGrade(int gradeNo, String gradeName) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
	}
	
	

	public MemGrade(int gradeNo, String gradeName, String grade_img) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
		this.grade_img = grade_img;
	}

	public String getGrade_img() {
		return grade_img;
	}

	public void setGrade_img(String grade_img) {
		this.grade_img = grade_img;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	@Override
	public String toString() {
		return "MemGrade [gradeNo=" + gradeNo + ", gradeName=" + gradeName + ", grade_img=" + grade_img + "]";
	}

	
}
