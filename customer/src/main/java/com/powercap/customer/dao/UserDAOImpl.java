package com.powercap.customer.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Repository;
import com.powercap.customer.dao.UserDAO;
import com.powercap.customer.exceptions.NoDBException;


@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public boolean doLogin(String user, String password) throws NoDBException {
		String userQuery = "Select password from Users where user_name=?";
		String dbPassword = "";
		try {
			if(DBConnector.getConnection() == null) {
				throw new NoDBException();
			}
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
