package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcon.DBcon;
import vo.BoardVO;
import vo.PagingVO;
import vo.SentenceVO;

public class BoardDAO {
	public boolean write(BoardVO bvo) throws Exception {
		String query = "INSERT INTO tbl_board VALUES(NULL,?,?,?,NOW(),?,0,'N')";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bvo.getType());
		stmt.setString(2, bvo.getTitle());
		stmt.setString(3, bvo.getContent());
		stmt.setString(4, bvo.getWriter());
		stmt.executeQuery();
		return true;
	}

	public boolean modify(BoardVO bvo) throws Exception {
		String query = "UPDATE tbl_board SET title=?,content=? WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bvo.getTitle());
		stmt.setString(2, bvo.getContent());
		stmt.setInt(3, bvo.getBno());
		stmt.executeQuery();
		return true;
	}

	public boolean delete(String bno) throws Exception {
		String query = "UPDATE tbl_board SET del_yn='Y' WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bno);
		stmt.executeQuery();
		return true;
	}

	public ArrayList<BoardVO> selectList(String type, PagingVO pvo) throws Exception {
		ArrayList<BoardVO> blist = new ArrayList<>();
		String query = "SELECT *,(SELECT COUNT(*) FROM tbl_comment AS c WHERE c.bno=rs.bno) AS commentnum FROM tbl_board AS rs WHERE type=? ORDER BY date DESC limit ?,?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, type);
		stmt.setInt(2, pvo.getStartnum());
		stmt.setInt(3, pvo.getListnum());
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			BoardVO bvo = new BoardVO();
			bvo.setBno(rs.getInt("bno"));
			bvo.setType(rs.getString("type"));
			bvo.setTitle(rs.getString("title"));
			bvo.setContent(rs.getString("content"));
			bvo.setDate(rs.getString("date"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setHit(rs.getInt("hit"));
			bvo.setDel_yn(rs.getString("del_yn"));
			bvo.setCommentnum(rs.getInt("commentnum"));
			bvo.setCommentnum(rs.getInt("commentnum"));
			blist.add(bvo);
		}
		return blist;
	}

	public BoardVO selectOne(String bno, String type) throws Exception {
		String query = "SELECT * FROM tbl_board WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bno);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		BoardVO bvo = new BoardVO();
		bvo.setBno(rs.getInt("bno"));
		bvo.setType(rs.getString("type"));
		bvo.setTitle(rs.getString("title"));
		if (type.equals("view")) {
			bvo.setContent(rs.getString("content").replace("\n", "<br>"));
		}
		if (type.equals("modify")) {
			bvo.setContent(rs.getString("content").replace("<br>", "\n"));
		}
		bvo.setDate(rs.getString("date"));
		bvo.setWriter(rs.getString("writer"));
		bvo.setHit(rs.getInt("hit"));
		bvo.setDel_yn(rs.getString("del_yn"));
		return bvo;
	}

	public PagingVO makePage(String type, String page) throws Exception {
		PagingVO pvo = new PagingVO(type, page);
		String query = "SELECT CEIL(COUNT(*)/?) as result FROM tbl_board WHERE type=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, pvo.getListnum());
		stmt.setString(2, type);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		int maxpage = rs.getInt("result");
		if (maxpage == 0) {
			maxpage = 1;
		}
		pvo.setMaxpage(maxpage);
		return pvo;
	}

	public SentenceVO selectSentence() throws Exception {
		String query = "SELECT * FROM tbl_sentence ORDER BY RAND() LIMIT 0,1";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		SentenceVO svo = new SentenceVO();
		svo.setSno(rs.getInt("sno"));
		svo.setSentense(rs.getString("sentense"));
		return svo;
	}

	public boolean isAttendance(String nickname) throws Exception {
		String query = "SELECT COUNT(*) AS result FROM tbl_board WHERE TYPE='attendance' AND writer=?  AND date_format(date, '%Y-%m-%d') = date_format(NOW(), '%Y-%m-%d')";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, nickname);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		if (rs.getInt("result") != 0) {
			return false;
		}
		return true;
	}

	public ArrayList<BoardVO> selectType() throws Exception {
		ArrayList<BoardVO> blist = new ArrayList<>();
		String query = "SELECT *,(SELECT COUNT(*) FROM tbl_comment AS c WHERE c.bno=rs.bno) AS commentnum FROM (SELECT *,RANK() OVER (PARTITION BY M.type ORDER BY M.date DESC) AS rn FROM tbl_board AS M WHERE del_yn='N') AS rs WHERE rs.rn<=3";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			BoardVO bvo = new BoardVO();
			bvo.setBno(rs.getInt("bno"));
			bvo.setType(rs.getString("type"));
			bvo.setTitle(rs.getString("title"));
			bvo.setContent(rs.getString("content"));
			bvo.setDate(rs.getString("date"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setHit(rs.getInt("hit"));
			bvo.setDel_yn(rs.getString("del_yn"));
			bvo.setCommentnum(rs.getInt("commentnum"));
			blist.add(bvo);
		}
		return blist;
	}

	public ArrayList<BoardVO> selectNewest() throws Exception {
		ArrayList<BoardVO> blist = new ArrayList<>();
		String query = "SELECT *,(SELECT COUNT(*) FROM tbl_comment AS c WHERE c.bno=rs.bno) AS commentnum FROM tbl_board AS rs order by date DESC LIMIT 0,3";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			BoardVO bvo = new BoardVO();
			bvo.setBno(rs.getInt("bno"));
			bvo.setType(rs.getString("type"));
			bvo.setTitle(rs.getString("title"));
			bvo.setContent(rs.getString("content"));
			bvo.setDate(rs.getString("date"));
			bvo.setWriter(rs.getString("writer"));
			bvo.setHit(rs.getInt("hit"));
			bvo.setDel_yn(rs.getString("del_yn"));
			bvo.setCommentnum(rs.getInt("commentnum"));
			blist.add(bvo);
		}
		return blist;
	}

	public int commentNum(String bno) throws Exception {
		String query = "SELECT COUNT(*) as result FROM tbl_comment WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bno);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return rs.getInt("result");
	}

	public void viewHit(String bno) throws Exception {
		String query = "UPDATE tbl_board SET hit=hit+1 WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, bno);
		stmt.executeQuery();
	}
}
