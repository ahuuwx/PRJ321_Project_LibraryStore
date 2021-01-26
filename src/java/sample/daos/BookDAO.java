/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.DBUtils.Util;
import sample.dtos.BookDTO;

/**
 *
 * @author DELL
 */
public class BookDAO {

    public List<BookDTO> getAllBookByName(String search) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Util.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID,bookName, quantity, price,bookType, author,statusID, image FROM tblBooks WHERE bookName like '%" + search + "%'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String bookName = rs.getString("bookName");
                    int quantity = Integer.parseInt(rs.getString("quantity"));

                    String price = (rs.getString("price"));
                    String bookType = rs.getString("bookType");
                    String author = rs.getString("author");
                    int statusID = Integer.parseInt(rs.getString("statusID"));

                    String image = rs.getString("image");
                    list.add(new BookDTO(bookID, bookName, quantity, new BigDecimal(price), bookType, author, statusID, image));
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
        return list;
    }

    public List<BookDTO> loadBook() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Util.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID,bookName, quantity, price,bookType, author,statusID, image FROM tblBooks";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String bookName = rs.getString("bookName");
                    int quantity = Integer.parseInt(rs.getString("quantity"));

                    String price = (rs.getString("price"));
                    String bookType = rs.getString("bookType");
                    String author = rs.getString("author");
                    int statusID = Integer.parseInt(rs.getString("statusID"));

                    String image = rs.getString("image");
                    list.add(new BookDTO(bookID, bookName, quantity, new BigDecimal(price), bookType, author, statusID, image));
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
        return list;
    }

    public void update(BookDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Util.getConnection();
            String sql = "UPDATE tblBooks SET bookName=?,quantity=?,price=?,bookType=?,author=?,statusID=?,image=?  WHERE bookID=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getBookName());
            stm.setInt(2, dto.getQuantity());
            stm.setBigDecimal(3, dto.getPrice());
            stm.setString(4, dto.getBookType());
            stm.setString(5, dto.getAuthor());
            stm.setInt(6, dto.getStatusID());
            stm.setString(7, dto.getImage());
            stm.setString(8, dto.getBookID());
            stm.executeUpdate();

        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void delete(String userID) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = Util.getConnection();
            if (conn != null) {
                String sql = "DELETE tblBooks WHERE bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    public void insert(BookDTO dto) throws SQLException, ClassNotFoundException {

        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = Util.getConnection();
            if (conn != null) {
                //ghi rõ ra
                //khi đổi thứ tự cột trong database, sẽ k bị ảnh hưởng
                String sql = "INSERT INTO tblBooks(bookID, bookName, quantity, price,bookType,author,statusID,image) VALUES(?,?,?,?,?,?,?,?)";

                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getBookID());
                stm.setString(2, dto.getBookName());
                stm.setInt(3, dto.getQuantity());
                stm.setBigDecimal(4, dto.getPrice());
                stm.setString(5, dto.getBookType());
                stm.setString(6, dto.getAuthor());
                stm.setInt(7, dto.getStatusID());
                stm.setString(8, dto.getImage());
                stm.executeUpdate();

            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean checkExistedID(String bookID) throws SQLException {
        boolean result = false;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Util.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID FROM tblBooks WHERE bookID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookID);

                rs = stm.executeQuery();

                if (rs.next()) {

                    result = true;

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

        return result;
    }
}
