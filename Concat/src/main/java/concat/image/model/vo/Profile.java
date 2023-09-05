package concat.image.model.vo;

import java.sql.Date;

public class Profile {
	private int fileNo;
	private int memNo;
	private String originName;
	private String updateName;
	private String filePath;
	private Date issueDate;
	
	public Profile() {}

	public Profile(int fileNo, int memNo, String originName, String updateName, String filePath, Date issueDate) {
		super();
		this.fileNo = fileNo;
		this.memNo = memNo;
		this.originName = originName;
		this.updateName = updateName;
		this.filePath = filePath;
		this.issueDate = issueDate;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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

	@Override
	public String toString() {
		return "profile [fileNo=" + fileNo + ", memNo=" + memNo + ", originName=" + originName + ", updateName="
				+ updateName + ", filePath=" + filePath + "]";
	}

}
