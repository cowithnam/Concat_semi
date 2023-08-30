package concat.wish.model.vo;

import java.sql.Date;

public class Wish {
	private int memNo;
	private int boardNo;
	private Date wishDate;
	
	public Wish() {}

	public Wish(int memNo, int boardNo, Date wishDate) {
		super();
		this.memNo = memNo;
		this.boardNo = boardNo;
		this.wishDate = wishDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getWishDate() {
		return wishDate;
	}

	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}

	@Override
	public String toString() {
		return "Wish [memNo=" + memNo + ", boardNo=" + boardNo + ", wishDate=" + wishDate + "]";
	}

}
