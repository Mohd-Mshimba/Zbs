package LoginDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginVar.loginVariable;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
	    String password = request.getParameter("password");
	 
	    loginVariable loginvar = new loginVariable();
	 
	    loginvar.setUsername(username);
	    loginvar.setPassword(password);
	 
	    LoginCred logincred = new LoginCred();
	 
	    try {
			String userValidate = logincred.authenticateUser(loginvar);

			 if (userValidate.equals("Distributer_Role")) {
				System.out.println("Distributer Home");
				HttpSession session = request.getSession();
				session.setAttribute("Status", "Distributer");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/home.jsp").forward(request, response);
			} else if (userValidate.equals("Receiver_Role")) {
				System.out.println("Receiver Home");
				HttpSession session = request.getSession();
				session.setAttribute("Status", "Receiver");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/home.jsp").forward(request, response);
			} else if (userValidate.equals("LabExpert_Role")) {
				System.out.println("LabExpert Home");
				HttpSession session = request.getSession();
				session.setAttribute("Status", "Lab Expart");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("home.jsp").forward(request, response);
			} else if (userValidate.equals("Customer_Role")) {
				System.out.println("Customer Home");
				HttpSession session = request.getSession();
				session.setAttribute("Status", "Customer");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("homeCust.jsp").forward(request, response);
			} else {
				System.out.println("Error message = " + userValidate);
				request.setAttribute("errMessage", userValidate);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
	    }
	    catch (IOException e1)
	    {
	        e1.printStackTrace();
	    }
	    catch (Exception e2)
	    {
	        e2.printStackTrace();
	    }
	}
	}