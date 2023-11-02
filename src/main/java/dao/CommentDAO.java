package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcon.DBcon;
import vo.CommentVO;
import vo.PagingVO;

public class CommentDAO {
	public boolean write(CommentVO cvo) throws Exception {
		String query = "INSERT INTO tbl_comment VALUES(NULL,?,?,NOW(),?,'N',?)";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, cvo.getBno());
		stmt.setString(2, cvo.getContent());
		stmt.setString(3, cvo.getWriter());
		stmt.setInt(4, cvo.getGroupno());
		stmt.executeQuery();
		return true;
	}

	public int lastGroupno(int bno) throws Exception {
		String query = "SELECT * FROM tbl_comment WHERE bno=? ORDER BY groupno DESC LIMIT 0,1";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, bno);
		ResultSet rs = stmt.executeQuery();
		rs.last();
		if (rs.getRow() == 0) {
			return 0;
		} else {
			return rs.getInt("groupno");
		}
	}

	public ArrayList<CommentVO> selectComment(int bno, PagingVO pvo) throws Exception {
		ArrayList<CommentVO> clist = new ArrayList<>();
		String query = "SELECT * FROM (SELECT *,RANK() OVER (PARTITION BY groupno ORDER BY date asc) AS rn FROM tbl_comment WHERE bno=?) AS rs LIMIT ?,?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, bno);
		stmt.setInt(2, pvo.getStartnum());
		stmt.setInt(3, pvo.getListnum());
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			CommentVO cvo = new CommentVO();
			cvo.setCno(rs.getInt("cno"));
			cvo.setBno(rs.getInt("bno"));
			cvo.setContent(rs.getString("content"));
			cvo.setDate(rs.getString("date"));
			cvo.setWriter(rs.getString("writer"));
			cvo.setDel_yn(rs.getString("del_yn"));
			cvo.setGroupno(rs.getInt("groupno"));
			cvo.setRn(rs.getInt("rn"));
			clist.add(cvo);
		}
		return clist;
	}

	public PagingVO makePage(int bno, String page) throws Exception {
		PagingVO pvo = new PagingVO(page);
		String query = "SELECT CEIL(COUNT(*)/?) as result FROM tbl_comment WHERE bno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, pvo.getListnum());
		stmt.setInt(2, bno);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		int maxpage = rs.getInt("result");
		if (maxpage == 0) {
			maxpage = 1;
		}
		pvo.setMaxpage(maxpage);
		return pvo;
	}

	public String getReplyContent(int cno) throws Exception {
		String query = "SELECT * FROM tbl_comment where cno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, cno);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		return rs.getString("content");
	}

	public void modify(CommentVO cvo) throws Exception {
		String query = "UPDATE tbl_comment SET content=? WHERE cno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, cvo.getContent());
		stmt.setInt(2, cvo.getCno());
		stmt.executeQuery();
	}

	public void delete(int cno) throws Exception {
		String query = "UPDATE tbl_comment SET del_yn='Y' WHERE cno=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, cno);
		stmt.executeQuery();
	}
}
