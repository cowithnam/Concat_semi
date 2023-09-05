package concat.mem_grade.model.vo;

public class MemGrade {
	
	private int gradeNo;
	private String gradeName;

	public MemGrade() {}

	public MemGrade(int gradeNo, String gradeName) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
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
		return "MemGrade [gradeNo=" + gradeNo + ", gradeName=" + gradeName + "]";
	}
	
}
