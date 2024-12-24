package com.Controller;

import com.Dao.UserDao;
import com.Dao.CategoryDao;
import com.Dao.KnowledgeDao;
import com.Model.User;
import com.Model.Category;
import com.Model.Knowledge;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

public class UserController extends HttpServlet {
    private static final String INSERT = "/registerUser.jsp";
    private static final String EDIT = "/editUser.jsp";
    private static final String LIST_USER = "/listUser.jsp";
    private static final String HOME = "/Main.jsp";
    private UserDao userdao;
    private CategoryDao catDao;
    private KnowledgeDao knowDao;

    public UserController() throws ClassNotFoundException {
        super();
        userdao = new UserDao();
        catDao = new CategoryDao();
        knowDao = new KnowledgeDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String forward = "";
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("delete")) {
                int userID = Integer.parseInt(request.getParameter("userID"));
                userdao.deleteUser(userID);
                forward = LIST_USER;
                request.setAttribute("users", userdao.getAllUsers());
            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                int userID = Integer.parseInt(request.getParameter("userID"));
                User user = userdao.getUserById(userID);
                request.setAttribute("user", user);
            } else if (action.equalsIgnoreCase("listUser")) {
                forward = LIST_USER;
                request.setAttribute("users", userdao.getAllUsers());
            } else if (action.equalsIgnoreCase("insert")) {
                forward = INSERT;
            } else if (action.equalsIgnoreCase("home")) {
                List<Category> categories = catDao.getAllCategory();
                List<Knowledge> knowledge = knowDao.getAllKnowledge();
                request.setAttribute("categories", categories);
                request.setAttribute("knowledge", knowledge);
                forward = HOME;
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

        if ("login".equalsIgnoreCase(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User user = userdao.getUserByUsernameAndPassword(username, password);

            if (user != null) {
                session.setAttribute("user", user);
                List<Category> categories = catDao.getAllCategory();
                List<Knowledge> knowledge = knowDao.getAllKnowledge();
                request.setAttribute("categories", categories);
                request.setAttribute("knowledge", knowledge);
                RequestDispatcher view = request.getRequestDispatcher("/welcomeLoggedIn.jsp");
                view.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
                view.forward(request, response);
            }
        }
        else {
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setPhoneNum(request.getParameter("phoneNum"));
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setRole(request.getParameter("role"));

            if ("edit".equalsIgnoreCase(action)) {
                user.setUserId(Integer.parseInt(request.getParameter("userID")));
                userdao.updateUser(user);
            } else {
                userdao.addUser(user);
            }

            session.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
            request.setAttribute("users", userdao.getAllUsers());
            view.forward(request, response);
        }
    }
}
