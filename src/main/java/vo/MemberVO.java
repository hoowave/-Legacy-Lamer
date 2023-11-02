package vo;

import lombok.Data;

@Data
public class MemberVO {
	private int mid;
	private String id;
	private String pw;
	private int permit;
	private String spermit;
	private String nickname;
	private String email;
	private int point;
}
