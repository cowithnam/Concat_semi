package concat.sal_level.model.vo;

public class SalLevel {
	private int minScore;
	private int maxScore;
	private int gradeNo;
	
	SalLevel(){}

	public SalLevel(int minScore, int maxScore, int gradeNo) {
		super();
		this.minScore = minScore;
		this.maxScore = maxScore;
		this.gradeNo = gradeNo;
	}

	public int getMinScore() {
		return minScore;
	}

	public void setMinScore(int minScore) {
		this.minScore = minScore;
	}

	public int getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	@Override
	public String toString() {
		return "SalLevel [minScore=" + minScore + ", maxScore=" + maxScore + ", gradeNo=" + gradeNo + "]";
	}
	
}
