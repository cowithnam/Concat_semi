package concat.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String memNo;
	private String categoryNo;
	private String boardTitle;
	private String boardContent;
	private int count;
	private Date issueDate;
	private String status;
	private int price;
	private Date dueDate;
	
	public Board() {}

	public Board(int boardNo, String memNo, String categoryNo, String boardTitle, String boardContent, int count,
			Date issueDate, String status, int price, Date dueDate) {
		super();
		this.boardNo = boardNo;
		this.memNo = memNo;
		this.categoryNo = categoryNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.issueDate = issueDate;
		this.status = status;
		this.price = price;
		this.dueDate = dueDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memNo=" + memNo + ", categoryNo=" + categoryNo + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", count=" + count + ", issueDate=" + issueDate
				+ ", status=" + status + ", price=" + price + ", dueDate=" + dueDate + "]";
	}
	
}
