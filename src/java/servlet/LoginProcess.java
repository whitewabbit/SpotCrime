package servlet;



import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.DBConnection;

@WebServlet(name = "LoginProcess", urlPatterns = {"/LoginProcess"})
public class LoginProcess extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection con = DBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        
        User user = new User();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String message = "The username isn't registered yet";
        
        request.setAttribute("status", false);
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE username=?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()){
                if(rs.getString("password").equals(password)){
                    user.setLocation(rs.getString("location"));
                    user.setName(rs.getString("fname") + " " + rs.getString("mname") + " " + rs.getString("lname"));
                    user.setUsername(rs.getString("username"));
                    message = "Successful Login!";
                    request.setAttribute("status", true);
                    request.setAttribute("user", user);
                }
                else {
                    message = "Incorrect Password!";
                }
            }
        }
        catch(SQLException e){
            System.out.println("Error @LoginProcess : " + e. getMessage());
        }
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
