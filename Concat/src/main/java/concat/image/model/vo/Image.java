package concat.image.model.vo;

import java.sql.Date;

public class Image {
	private int fileNo;
	private int boardNo;
	private String originName;
	private String updateName;
	private String filePath;
	private Date issueDate;
	private String titleimg;
	
	public Image() {}
	
	public Image(int fileNo, String originName, String updateName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.updateName = updateName;
		this.filePath = filePath;
	}

	public Image(int fileNo, int boardNo, String originName, String updateName, String filePath, Date issueDate,
			String titleimg) {
		super();
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.originName = originName;
		this.updateName = updateName;
		this.filePath = filePath;
		this.issueDate = issueDate;
		this.titleimg = titleimg;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getTitleimg() {
		return titleimg;
	}

	public void setTitleimg(String titleimg) {
		this.titleimg = titleimg;
	}

	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", boardNo=" + boardNo + ", originName=" + originName + ", updateName="
				+ updateName + ", filePath=" + filePath + ", issueDate=" + issueDate + ", titleimg=" + titleimg + "]";
	}
	
}
