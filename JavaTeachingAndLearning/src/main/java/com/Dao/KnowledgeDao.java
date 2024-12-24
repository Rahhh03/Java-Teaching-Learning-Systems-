package com.Dao;

import com.Model.Category;
import com.Model.Knowledge;
import com.Model.User;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KnowledgeDao {
    private Connection connection;

    public KnowledgeDao() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    public void addKnowledge(Knowledge knowledge) {
        try (
            PreparedStatement ps = connection.prepareStatement("INSERT INTO knowledge (category_id, title, description, content, created_by, created_at) VALUES (?, ?, ?, ?, ?, ?)")) {
            ps.setInt(1, knowledge.getCategory().getCategoryId());
            ps.setString(2, knowledge.getTitle());
            ps.setString(3, knowledge.getDescription());
            ps.setString(4, knowledge.getContent());
            ps.setInt(5, knowledge.getUser().getUserId());
            ps.setDate(6, new java.sql.Date(knowledge.getCreatedAt().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteKnowledge(Knowledge knowledge) {
        try (PreparedStatement ps = connection.prepareStatement("DELETE FROM knowledge WHERE knowledge_id = ?")) {
            ps.setInt(1, knowledge.getKnowledgeId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateKnowledge(Knowledge knowledge) {
        try (PreparedStatement ps = connection.prepareStatement("UPDATE knowledge SET category_id = ?, title = ?, description = ?, content = ?, created_by = ?, created_at = ? WHERE knowledge_id = ?")) {
            ps.setInt(1, knowledge.getCategory().getCategoryId());
            ps.setString(2, knowledge.getTitle());
            ps.setString(3, knowledge.getDescription());
            ps.setString(4, knowledge.getContent());
            ps.setInt(5, knowledge.getUser().getUserId());
            ps.setDate(6, new java.sql.Date(knowledge.getCreatedAt().getTime()));
            ps.setInt(7, knowledge.getKnowledgeId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Knowledge> getAllKnowledge() {
        List<Knowledge> knowledges = new ArrayList<>();
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT k.*, c.titlecg, u.name FROM knowledge k JOIN categories c ON k.category_id = c.category_id JOIN users u ON k.created_by = u.user_id")) {
            while (rs.next()) {
                Knowledge knowledge = new Knowledge();
                knowledge.setKnowledgeId(rs.getInt("knowledge_id"));
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setTitlecg(rs.getString("titlecg"));
                knowledge.setCategory(category);
                knowledge.setTitle(rs.getString("title"));
                knowledge.setDescription(rs.getString("description"));
                knowledge.setContent(rs.getString("content"));
                User user = new User();
                user.setUserId(rs.getInt("created_by"));
                user.setName(rs.getString("name"));
                knowledge.setUser(user);
                knowledge.setCreatedAt(rs.getDate("created_at"));
                knowledges.add(knowledge);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return knowledges;
    }

    public Knowledge getKnowledgeById(int knowledgeId) {
        Knowledge knowledge = new Knowledge();
        try (PreparedStatement ps = connection.prepareStatement("SELECT k.*, c.titlecg, u.name FROM knowledge k JOIN categories c ON k.category_id = c.category_id JOIN users u ON k.created_by = u.user_id WHERE k.knowledge_id = ?")) {
            ps.setInt(1, knowledgeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                knowledge.setKnowledgeId(rs.getInt("knowledge_id"));
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setTitlecg(rs.getString("titlecg"));
                knowledge.setCategory(category);
                knowledge.setTitle(rs.getString("title"));
                knowledge.setDescription(rs.getString("description"));
                knowledge.setContent(rs.getString("content"));
                User user = new User();
                user.setUserId(rs.getInt("created_by"));
                user.setName(rs.getString("name"));
                knowledge.setUser(user);
                knowledge.setCreatedAt(rs.getDate("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return knowledge;
    }

    public List<Knowledge> getKnowledgeByCategory(int categoryId) {
    List<Knowledge> knowledges = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement("SELECT k.*, c.titlecg, u.name FROM knowledge k JOIN categories c ON k.category_id = c.category_id JOIN users u ON k.created_by = u.user_id WHERE k.category_id = ?")) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Knowledge knowledge = new Knowledge();
                knowledge.setKnowledgeId(rs.getInt("knowledge_id"));
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setTitlecg(rs.getString("titlecg"));
                knowledge.setCategory(category);
                knowledge.setTitle(rs.getString("title"));
                knowledge.setDescription(rs.getString("description"));
                knowledge.setContent(rs.getString("content"));
                User user = new User();
                user.setUserId(rs.getInt("created_by"));
                user.setName(rs.getString("name"));
                knowledge.setUser(user);
                knowledge.setCreatedAt(rs.getDate("created_at"));
                knowledges.add(knowledge);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return knowledges;
    }

}
