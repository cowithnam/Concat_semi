package concat.qna.model.vo;



public class QnaReplay {
	 private int replyNo;
	 private String content;
	 private int repQno;
	 private String repWriter;
	 private String create_date;
	 private String status;

	 
	 public QnaReplay() {
		 
	 }


	public QnaReplay(int replyNo, String content, int repQno, String repWriter, String create_date, String status) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.repQno = repQno;
		this.repWriter = repWriter;
		this.create_date = create_date;
		this.status = status;
	}


	public QnaReplay(int replyNo, String content, String repWriter, String create_date) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.repWriter = repWriter;
		this.create_date = create_date;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getRepQno() {
		return repQno;
	}


	public void setRepQno(int repQno) {
		this.repQno = repQno;
	}


	public String getRepWriter() {
		return repWriter;
	}


	public void setRepWriter(String repWriter) {
		this.repWriter = repWriter;
	}


	public String getCreate_date() {
		return create_date;
	}


	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "QnaReplay [replyNo=" + replyNo + ", content=" + content + ", repQno=" + repQno + ", repWriter="
				+ repWriter + ", create_date=" + create_date + ", status=" + status + "]";
	}
	
	
	
	


	
}
