package vo;

import lombok.Data;

@Data
public class PagingVO {
	private String type;
	private int listnum;
	private int page;
	private int maxpage;
	private int startnum;

	public PagingVO(String type, String spage) {
		this.type = type;
		int page = Integer.parseInt(spage);
		this.listnum = 10;
		this.page = page;
		this.startnum = (this.listnum * this.page) - this.listnum;
	}

	public PagingVO(String spage) {
		int page = Integer.parseInt(spage);
		this.listnum = 10;
		this.page = page;
		this.startnum = (this.listnum * this.page) - this.listnum;
	}
}
