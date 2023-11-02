package vo;

import lombok.Data;

@Data
public class ActionLogVO {
	private int lno;
	private String type;
	private String nickname;
	private String date;
	private String url;
}
