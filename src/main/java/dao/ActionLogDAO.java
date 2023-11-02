package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcon.DBcon;
import vo.ActionLogVO;

public class ActionLogDAO {
	public boolean insertLog(ActionLogVO avo) throws Exception {
		String query = "INSERT INTO tbl_actionlog VALUES(NULL,?,?,NOW(),?)";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, avo.getType());
		stmt.setString(2, avo.getNickname());
		stmt.setString(3, avo.getUrl());
		stmt.executeQuery();
		return true;
	}

	public boolean todayPay(String type, String nickname) throws Exception {
		String query = "SELECT COUNT(*) as result FROM tbl_actionlog WHERE type=? AND nickname=? AND date_format(date, '%Y-%m-%d') = date_format(NOW(), '%Y-%m-%d')";
		PreparedStatement stmt = DBcon.getConnect().prepareStatement(query);
		stmt.setString(1, type);
		stmt.setString(2, nickname);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		if (rs.getInt("result") != 0) {
			return true;
		}
		return false;
	}
}
