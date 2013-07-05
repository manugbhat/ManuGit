package com.powercap.customer.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Repository;
import com.powercap.customer.dao.UserDAO;


@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public boolean doLogin(String user, String password) {
		String userQuery = "Select password from Users where user_name=?";
		String dbPassword = "";
		try {
			PreparedStatement stmt = DBConnector.getConnection().prepareStatement(userQuery);
			stmt.setString(1, user);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				dbPassword = rs.getString(1);
				if(password.equals(dbPassword))
				{
					return true;
				}
				else
					return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
