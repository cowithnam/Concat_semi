package concat.board.model.vo;

public class Board {
	private int boardNo;
	private String memNo;
	private String categoryNo;
	private String brand;
	private String boardTitle;
	private String boardContent;
	private int count;
	private String issueDate;
	private String status;
	private int price;
	private String dueDate;
	private String openkakao;
	
	public Board() {}

	public Board(int boardNo, String memNo, String categoryNo, String brand, String boardTitle, String boardContent,
			int count, String issueDate, String status, int price, String dueDate, String openkakao) {
		super();
		this.boardNo = boardNo;
		this.memNo = memNo;
		this.categoryNo = categoryNo;
		this.brand = brand;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.issueDate = issueDate;
		this.status = status;
		this.price = price;
		this.dueDate = dueDate;
		this.openkakao = openkakao;
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

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
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

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getOpenkakao() {
		return openkakao;
	}

	public void setOpenkakao(String openkakao) {
		this.openkakao = openkakao;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memNo=" + memNo + ", categoryNo=" + categoryNo + ", brand=" + brand
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", count=" + count + ", issueDate="
				+ issueDate + ", status=" + status + ", price=" + price + ", dueDate=" + dueDate + ", openkakao="
				+ openkakao + "]";
	}

}
