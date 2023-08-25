package concat.review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String memNo;
	private int boardNo;
	private String sellId;
	private String reviewTitle;
	private String reviewContent;
	private int count;
	private Date createDate;
	private String status;
	private int score;
	private String imgPath1;
	private String imgPath2;
	private String imgPath3;
	
	public Review() {}
	
	public Review(int reviewNo, String memNo, int boardNo, String sellId, String reviewTitle, String reviewContent,
			int count, Date createDate, String status, int score, String imgPath1, String imgPath2, String imgPath3) {
		super();
		this.reviewNo = reviewNo;
		this.memNo = memNo;
		this.boardNo = boardNo;
		this.sellId = sellId;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.score = score;
		this.imgPath1 = imgPath1;
		this.imgPath2 = imgPath2;
		this.imgPath3 = imgPath3;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getSellId() {
		return sellId;
	}

	public void setSellId(String sellId) {
		this.sellId = sellId;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getImgPath1() {
		return imgPath1;
	}

	public void setImgPath1(String imgPath1) {
		this.imgPath1 = imgPath1;
	}

	public String getImgPath2() {
		return imgPath2;
	}

	public void setImgPath2(String imgPath2) {
		this.imgPath2 = imgPath2;
	}

	public String getImgPath3() {
		return imgPath3;
	}

	public void setImgPath3(String imgPath3) {
		this.imgPath3 = imgPath3;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memNo=" + memNo + ", boardNo=" + boardNo + ", sellId=" + sellId
				+ ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + ", score=" + score + ", imgPath1=" + imgPath1
				+ ", imgPath2=" + imgPath2 + ", imgPath3=" + imgPath3 + "]";
	}
	
}
