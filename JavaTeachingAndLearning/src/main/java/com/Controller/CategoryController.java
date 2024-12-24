package com.Controller;

import com.Dao.CategoryDao;
import com.Dao.KnowledgeDao;
import com.Dao.UserDao;
import com.Model.Category;

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

public class CategoryController extends HttpServlet {
    private static final String INSERT = "/insertCategory.jsp";
    private static final String EDIT = "/editCategory.jsp";
    private static final String LIST_CATEGORY = "/listCategory.jsp";
    private UserDao userdao;
    private KnowledgeDao knowDao;
    private CategoryDao catDao;

    public CategoryController() throws ClassNotFoundException {
        super();
        userdao = new UserDao();
        catDao = new CategoryDao();
        knowDao = new KnowledgeDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("delete")) {
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                Category category = new Category();
                category.setCategoryId(categoryID);
                catDao.deleteCategory(category);
            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                Category category = catDao.getCategoryById(categoryID);
                request.setAttribute("category", category); // Singular category for edit
            } else if (action.equalsIgnoreCase("listCategory")) {
                forward = LIST_CATEGORY;
                request.setAttribute("categories", catDao.getAllCategory());
            } else if (action.equalsIgnoreCase("insert")) {
                request.setAttribute("users", userdao.getAllUsers());
                request.setAttribute("knowledge", knowDao.getAllKnowledge());
                forward = INSERT;
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        Category category = new Category();
        category.setTitlecg(request.getParameter("titlecg"));
        category.setDesccg(request.getParameter("desccg"));

        // Convert String to Date
        String dateString = request.getParameter("datecg");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = formatter.parse(dateString);
            category.setDatecg(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (action != null && action.equalsIgnoreCase("edit")) {
            category.setCategoryId(Integer.parseInt(request.getParameter("categoryID")));
            catDao.updateCategory(category);
        } else {
            catDao.addCategory(category);
        }
        session.setAttribute("categories", category);

        RequestDispatcher view = request.getRequestDispatcher(LIST_CATEGORY);
        request.setAttribute("categories", catDao.getAllCategory());
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Category Controller";
    }
}
