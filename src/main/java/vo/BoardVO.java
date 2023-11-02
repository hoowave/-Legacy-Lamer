package vo;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String type;
	private String title;
	private String content;
	private String date;
	private String writer;
	private int hit;
	private String del_yn;
	private int commentnum;
}
