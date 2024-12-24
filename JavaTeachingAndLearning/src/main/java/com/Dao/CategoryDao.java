package com.Dao;

import com.Model.Category;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private Connection connection;

    public CategoryDao() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    public void addCategory(Category category) {
        try {
            String query = "INSERT INTO categories (titlecg, desccg, datecg) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, category.getTitlecg());
            ps.setString(2, category.getDesccg());
            ps.setDate(3, new java.sql.Date(category.getDatecg().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(Category category) {
        try {
            String query = "DELETE FROM categories WHERE category_id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, category.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCategory(Category category) {
        try {
            String query = "UPDATE categories SET titlecg=?, desccg=?, datecg=? WHERE category_id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, category.getTitlecg());
            ps.setString(2, category.getDesccg());
            ps.setDate(3, new java.sql.Date(category.getDatecg().getTime()));
            ps.setInt(4, category.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setTitlecg(rs.getString("titlecg"));
                category.setDesccg(rs.getString("desccg"));
                category.setDatecg(rs.getDate("datecg"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public Category getCategoryById(int categoryId) {
        Category category = new Category();
        try {
            String query = "SELECT * FROM categories WHERE category_id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category.setCategoryId(rs.getInt("category_id"));
                category.setTitlecg(rs.getString("titlecg"));
                category.setDesccg(rs.getString("desccg"));
                category.setDatecg(rs.getDate("datecg"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }
}
