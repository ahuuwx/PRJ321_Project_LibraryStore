/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.DBUtils.Util;
import sample.dtos.UserDTO;

/**
 *
 * @author DELL
 */
public class UserDAO {

    public UserDTO checklogin(String userID, String password) throws SQLException {
        UserDTO check = new UserDTO("", "", "", 0, "", "", 0);
        String temp = "";
        String temp1 = "";
        String temp2 = "";
        int temp3, temp4 = 0;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Util.getConnection();
            if (conn != null) {
                String sql = "SELECT fullName,roleID,phoneNumber,address,statusID FROM tblUser WHERE userID=? AND password=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);

                rs = stm.executeQuery();

                if (rs.next()) {
                    temp = rs.getString("fullName");
                    temp3 = Integer.parseInt(rs.getString("roleID"));
                    temp1 = rs.getString("phoneNumber");
                    temp2 = rs.getString("address");
                    temp4 = Integer.parseInt(rs.getString("statusID"));
                    check.setPassword(password);
                    check.setUserID(userID);
                    check.setFullName(temp);
                    check.setRoleID(temp3);
                    check.setPhoneNumber(temp1);
                    check.setAddress(temp2);
                    check.setStatus(temp4);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

}
