package vo;

import lombok.Data;

@Data
public class CommentVO {
	private int cno;
	private int bno;
	private String content;
	private String date;
	private String writer;
	private String del_yn;
	private int groupno;
	private int rn;
}
