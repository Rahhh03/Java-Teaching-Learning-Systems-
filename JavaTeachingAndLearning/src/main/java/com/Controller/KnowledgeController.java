package com.Controller;

import com.Dao.CategoryDao;
import com.Dao.KnowledgeDao;
import com.Dao.UserDao;
import com.Model.Category;
import com.Model.Knowledge;
import com.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class KnowledgeController extends HttpServlet {
    private static final String INSERT = "/insertKnowledge.jsp";
    private static final String EDIT = "/editKnowledge.jsp";
    private static final String LIST_KNOWLEDGE = "/listKnowledge.jsp";
    private static final String MAIN = "/Main.jsp";
    private UserDao userdao;
    private KnowledgeDao knowDao;
    private CategoryDao catDao;

    public KnowledgeController() throws ClassNotFoundException {
        super();
        userdao = new UserDao();
        catDao = new CategoryDao();
        knowDao = new KnowledgeDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = MAIN; // Default forward to Main.jsp
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("delete")) {
                int knowledgeID = Integer.parseInt(request.getParameter("knowledgeID"));
                Knowledge knowledge = new Knowledge();
                knowledge.setKnowledgeId(knowledgeID);
                knowDao.deleteKnowledge(knowledge);
                forward = LIST_KNOWLEDGE;
            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                int knowledgeID = Integer.parseInt(request.getParameter("knowledgeID"));
                Knowledge knowledge = knowDao.getKnowledgeById(knowledgeID);
                request.setAttribute("knowledge", knowledge);
            } else if (action.equalsIgnoreCase("listKnowledge")) {
                forward = LIST_KNOWLEDGE;
            } else if (action.equalsIgnoreCase("insert")) {
                forward = INSERT;
            }
        }

        request.setAttribute("categories", catDao.getAllCategory());
        request.setAttribute("knowledges", knowDao.getAllKnowledge());
        request.setAttribute("users", userdao.getAllUsers());

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        Knowledge knowledge = new Knowledge();
        String categoryIdStr = request.getParameter("categoryId");
        String createdByStr = request.getParameter("createdBy");
        
        if (categoryIdStr == null || categoryIdStr.isEmpty() || createdByStr == null || createdByStr.isEmpty()) {
            request.setAttribute("error", "Category and Created By fields cannot be empty.");
            request.setAttribute("categories", catDao.getAllCategory());
            request.setAttribute("users", userdao.getAllUsers());
            request.setAttribute("knowledge", knowledge);
            RequestDispatcher view = request.getRequestDispatcher(INSERT);
            view.forward(request, response);
            return;
        }

        try {
            Category category = new Category();
            category.setCategoryId(Integer.parseInt(categoryIdStr));
            knowledge.setCategory(category);

            User user = new User();
            user.setUserId(Integer.parseInt(createdByStr));
            knowledge.setUser(user);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
            request.setAttribute("categories", catDao.getAllCategory());
            request.setAttribute("users", userdao.getAllUsers());
            request.setAttribute("knowledge", knowledge);
            RequestDispatcher view = request.getRequestDispatcher(INSERT);
            view.forward(request, response);
            return;
        }

        knowledge.setTitle(request.getParameter("title"));
        knowledge.setDescription(request.getParameter("description"));
        knowledge.setContent(request.getParameter("content"));

        // Convert String to Date
        String dateString = request.getParameter("createdAt");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = formatter.parse(dateString);
            knowledge.setCreatedAt(date);
        } catch (ParseException e) {
            request.setAttribute("error", "Invalid date format.");
            request.setAttribute("categories", catDao.getAllCategory());
            request.setAttribute("users", userdao.getAllUsers());
            request.setAttribute("knowledge", knowledge);
            RequestDispatcher view = request.getRequestDispatcher(INSERT);
            view.forward(request, response);
            return;
        }

        if (action != null && action.equalsIgnoreCase("edit")) {
            knowledge.setKnowledgeId(Integer.parseInt(request.getParameter("knowledgeID")));
            knowDao.updateKnowledge(knowledge);
        } else {
            knowDao.addKnowledge(knowledge);
        }
        session.setAttribute("knowledge", knowledge);

        request.setAttribute("categories", catDao.getAllCategory());
        request.setAttribute("knowledges", knowDao.getAllKnowledge());

        RequestDispatcher view = request.getRequestDispatcher(LIST_KNOWLEDGE);
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Knowledge Controller";
    }
}
