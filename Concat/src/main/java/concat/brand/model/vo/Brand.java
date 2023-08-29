package concat.brand.model.vo;

public class Brand {
	private int brandNo;
	private String brandName;
	private int categoryNo;
	
	public Brand() {}
	
	public Brand(int brandNo, String brandName, int categoryNo) {
		super();
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.categoryNo = categoryNo;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Brand [brandNo=" + brandNo + ", brandName=" + brandName + ", categoryNo=" + categoryNo + "]";
	}
	
}
