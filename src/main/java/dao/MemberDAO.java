package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcon.DBcon;
import vo.MemberVO;

public class MemberDAO {
	public boolean register(MemberVO mvo) throws Exception {
		String query = "SELECT count(*) as result FROM tbl_member WHERE id=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, mvo.getId());
		ResultSet rs = stmt.executeQuery();
		rs.next();

		if (rs.getInt("result") != 0) {
			return false;
		}

		String query2 = "INSERT INTO tbl_member VALUES(NULL,?,?,?,?,?,?)";
		PreparedStatement stmt2 = DBcon.getConnect().prepareStatement(query2);
		stmt2.setString(1, mvo.getId());
		stmt2.setString(2, mvo.getPw());
		stmt2.setInt(3, mvo.getPermit());
		stmt2.setString(4, mvo.getNickname());
		stmt2.setString(5, mvo.getEmail());
		stmt2.setInt(6, mvo.getPoint());
		stmt2.executeQuery();
		return true;
	}

	public MemberVO login(String id, String pw) throws Exception {
		String query = "SELECT count(*) as result FROM tbl_member WHERE id=? AND pw=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, id);
		stmt.setString(2, pw);
		ResultSet rs = stmt.executeQuery();
		rs.next();

		if (rs.getInt("result") == 0) {
			return null;
		}

		String query2 = "SELECT * FROM tbl_member WHERE id=? AND pw=?";
		PreparedStatement stmt2 = DBcon.getConnect().prepareStatement(query2);
		stmt2.setString(1, id);
		stmt2.setString(2, pw);
		ResultSet rs2 = stmt2.executeQuery();
		rs2.next();
		MemberVO mvo = new MemberVO();
		mvo.setMid(rs2.getInt("mid"));
		mvo.setId(rs2.getString("id"));
		mvo.setPw(rs2.getString("pw"));
		mvo.setPermit(rs2.getInt("permit"));
		if (mvo.getPermit() == 1) {
			mvo.setSpermit("일반회원");
		} else if (mvo.getPermit() == 2) {
			mvo.setSpermit("VIP회원");
		} else if (mvo.getPermit() == 9) {
			mvo.setSpermit("관리자");
		}
		mvo.setNickname(rs2.getString("nickname"));
		mvo.setEmail(rs2.getString("email"));
		mvo.setPoint(rs2.getInt("point"));
		return mvo;
	}

	public MemberVO addPoint(int point, String nickname) throws Exception {
		String query = "UPDATE tbl_member SET point=point+? WHERE nickname=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, point);
		stmt.setString(2, nickname);
		stmt.executeQuery();

		String query2 = "SELECT * FROM tbl_member WHERE nickname=?";
		PreparedStatement stmt2 = DBcon.getConnect().prepareStatement(query2);
		stmt2.setString(1, nickname);
		ResultSet rs = stmt2.executeQuery();
		rs.next();
		MemberVO mvo = new MemberVO();
		mvo.setMid(rs.getInt("mid"));
		mvo.setId(rs.getString("id"));
		mvo.setPw(rs.getString("pw"));
		mvo.setPermit(rs.getInt("permit"));
		if (mvo.getPermit() == 1) {
			mvo.setSpermit("일반회원");
		} else if (mvo.getPermit() == 2) {
			mvo.setSpermit("VIP회원");
		} else if (mvo.getPermit() == 9) {
			mvo.setSpermit("관리자");
		}
		mvo.setNickname(rs.getString("nickname"));
		mvo.setEmail(rs.getString("email"));
		mvo.setPoint(rs.getInt("point"));
		return mvo;
	}

	public MemberVO subPoint(int point, String nickname) throws Exception {
		String query = "UPDATE tbl_member SET point=point-? WHERE nickname=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setInt(1, point);
		stmt.setString(2, nickname);
		stmt.executeQuery();

		String query2 = "SELECT * FROM tbl_member WHERE nickname=?";
		PreparedStatement stmt2 = DBcon.getConnect().prepareStatement(query2);
		stmt2.setString(1, nickname);
		ResultSet rs = stmt2.executeQuery();
		rs.next();
		MemberVO mvo = new MemberVO();
		mvo.setMid(rs.getInt("mid"));
		mvo.setId(rs.getString("id"));
		mvo.setPw(rs.getString("pw"));
		mvo.setPermit(rs.getInt("permit"));
		if (mvo.getPermit() == 1) {
			mvo.setSpermit("일반회원");
		} else if (mvo.getPermit() == 2) {
			mvo.setSpermit("VIP회원");
		} else if (mvo.getPermit() == 9) {
			mvo.setSpermit("관리자");
		}
		mvo.setNickname(rs.getString("nickname"));
		mvo.setEmail(rs.getString("email"));
		mvo.setPoint(rs.getInt("point"));
		return mvo;

	}

	public boolean isPoint(MemberVO mvo, String point) throws Exception {
		String query = "SELECT * FROM tbl_member WHERE nickname=?";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, mvo.getNickname());
		ResultSet rs = stmt.executeQuery();
		rs.next();
		if (rs.getInt("point") < Integer.parseInt(point)) {
			return false;
		} else {
			return true;
		}
	}
}
