package concat.faq.model.vo;

import java.sql.Date;

public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private int count;
	private Date createDate;
	private String status;
	private String memNo;
	
	public Faq() {}

	public Faq(int faqNo, String faqTitle, String faqContent, int count, Date createDate, String status, String memNo) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.memNo = memNo;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
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

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + ", memNo=" + memNo + "]";
	}
	
}
