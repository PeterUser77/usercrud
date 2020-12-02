package br.com.pedro.usercrud.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.pedro.usercrud.entities.User;
import br.com.pedro.usercrud.models.UserModel;

@WebServlet("/user")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public userServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if (action == null) {
			action = "findAll";
			doGetFindAll(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if (action.equals("create")) {
			doPostCreate(request, response);
		}
	}
	
	
	private void doGetFindAll(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		UserModel userModel = new UserModel();
		List<User> users = userModel.findAll();
		
		request.setAttribute("users", users);
		request.getRequestDispatcher("user/index.jsp").forward(request, response);
	}

	

	protected void doPostCreate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = new User();
		UserModel userModel = new UserModel();
		
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		
		boolean result = userModel.create(user);
		
		if(result) {
			request.setAttribute("msg", "Sucess");
		} else {
			request.setAttribute("msg", "Fail");
		}
		
		response.sendRedirect("user");
	}

}
