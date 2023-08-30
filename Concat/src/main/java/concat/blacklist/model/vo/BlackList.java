package concat.blacklist.model.vo;

import java.sql.Date;

public class BlackList {
	private int blNo;
	private String blTitle;
	private String blContent;
	private String blWriter;
	private String blackId;
	private int count;
	private Date blDate;
	private String status;
	
	public BlackList() {}

	public BlackList(int blNo, String blTitle, String blContent, String blWriter, String blackId, int count,
			Date blDate, String status) {
		super();
		this.blNo = blNo;
		this.blTitle = blTitle;
		this.blContent = blContent;
		this.blWriter = blWriter;
		this.blackId = blackId;
		this.count = count;
		this.blDate = blDate;
		this.status = status;
	}

	// insertBlackList 메소드
	public BlackList(int blNo, String blTitle, String blContent, String blWriter, String blackId, int count,
			Date blDate) {
		super();
		this.blNo = blNo;
		this.blTitle = blTitle;
		this.blContent = blContent;
		this.blWriter = blWriter;
		this.blackId = blackId;
		this.count = count;
		this.blDate = blDate;
	}

	// selectBlacklist 메소드
	public BlackList(int blNo, String blTitle, String blContent, String blWriter, String blackId, int count) {
		super();
		this.blNo = blNo;
		this.blTitle = blTitle;
		this.blContent = blContent;
		this.blWriter = blWriter;
		this.blackId = blackId;
		this.count = count;
	}
	
	// selectlist 메소드
	public BlackList(int blNo, String blTitle, String blWriter, int count, Date blDate) {
		super();
		this.blNo = blNo;
		this.blTitle = blTitle;
		this.blWriter = blWriter;
		this.count = count;
		this.blDate = blDate;
	}
	
	
	public int getBlNo() {
		return blNo;
	}


	public void setBlNo(int blNo) {
		this.blNo = blNo;
	}

	public String getBlTitle() {
		return blTitle;
	}

	public void setBlTitle(String blTitle) {
		this.blTitle = blTitle;
	}

	public String getBlContent() {
		return blContent;
	}

	public void setBlContent(String blContent) {
		this.blContent = blContent;
	}

	public String getBlWriter() {
		return blWriter;
	}

	public void setBlWriter(String blWriter) {
		this.blWriter = blWriter;
	}

	public String getBlackId() {
		return blackId;
	}

	public void setBlackId(String blackId) {
		this.blackId = blackId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getBlDate() {
		return blDate;
	}

	public void setBlDate(Date blDate) {
		this.blDate = blDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BlackList [blNo=" + blNo + ", blTitle=" + blTitle + ", blContent=" + blContent + ", blWriter="
				+ blWriter + ", blackId=" + blackId + ", count=" + count + ", blDate=" + blDate + ", status=" + status
				+ "]";
	}
	
}
