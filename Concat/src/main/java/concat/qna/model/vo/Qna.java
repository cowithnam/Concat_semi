package concat.qna.model.vo;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private int count;
	private Date createDate;
	private String status;
	private String qnaWriter;
	private String qnaWriterNick;
	private String qnaAnswer;
	
	public Qna() {}

	
	
	

	public Qna(int qnaNo, String qnaTitle, String qnaContent, int count, Date createDate, String status,
			String qnaWriter, String qnaWriterNick, String qnaAnswer) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.qnaWriter = qnaWriter;
		this.qnaWriterNick = qnaWriterNick;
		this.qnaAnswer = qnaAnswer;
	}





	public Qna(int qnaNo, String qnaTitle, String qnaContent , String qnaWriter,  int count , Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.count = count;
		this.createDate = createDate;
	}

	public Qna(int qnaNo, String qnaTitle,  Date createDate , String qnaWriterNick) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.createDate = createDate;
		this.qnaWriterNick = qnaWriterNick;
		
	}





	public Qna(int qnaNo, String qnaTitle, String qnaContent, String qnaWriter, String qnaWriterNick , Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaWriterNick = qnaWriterNick;
		this.createDate = createDate;
	}





	public int getQnaNo() {
		return qnaNo;
	}





	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}





	public String getQnaTitle() {
		return qnaTitle;
	}





	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}





	public String getQnaContent() {
		return qnaContent;
	}





	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
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





	public String getQnaWriter() {
		return qnaWriter;
	}





	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}





	public String getQnaWriterNick() {
		return qnaWriterNick;
	}





	public void setQnaWriterNick(String qnaWriterNick) {
		this.qnaWriterNick = qnaWriterNick;
	}





	public String getQnaAnswer() {
		return qnaAnswer;
	}





	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}





	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + ", qnaWriter=" + qnaWriter + ", qnaWriterNick="
				+ qnaWriterNick + ", qnaAnswer=" + qnaAnswer + "]";
	}
	

	
	
}
