package controller.login;
import dao.UserDAO;
import dao.requestDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import model.User;

@WebServlet(name="LoginControl", urlPatterns={"/login"})
public class LoginControl extends HttpServlet {
       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remenber = request.getParameter("remember");
        
        // Kiểm tra xem người dùng có nhập liệu hay không
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.getSession().setAttribute("mess", "Please enter both username and password!");
            response.sendRedirect("login");
            return;
        }
        
        UserDAO uDao = new UserDAO();
        User u = uDao.Login(username, password);
        
        if(u == null){
            // Nếu đăng nhập thất bại, lưu thông báo vào session
            request.getSession().setAttribute("mess", "Invalid username or password!");
            response.sendRedirect("login");
        } else {       
            if(u.getUser_status() == 0){
            request.getSession().setAttribute("mess", "Account has been locked!");
            response.sendRedirect("login");
            return;
            }
            // Tạo các cookie và lưu chúng vào response
            Cookie uC = new Cookie("userC", username);
            Cookie pC = new Cookie("passC", password);
            // thời gian tồn tại của cookie là * minutes 
            uC.setMaxAge(60); 
            if(remenber != null){
                pC.setMaxAge(30*60);
            }else{
                pC.setMaxAge(0);
            }
            response.addCookie(uC);
            response.addCookie(pC);
            
            HttpSession session = request.getSession();
            session.setAttribute("acc",u);
            //Thoi gian ton tai cua session *minutes 30p
            session.setMaxInactiveInterval(30*60);
            
            // -> authorization: Role  1 2 3 -> 
            if(u.getRole() == 3){
                response.sendRedirect("skill");
                return;
            }
            response.sendRedirect("Home");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Lay ra cookie trong mang
        Cookie arr[] = request.getCookies();
        for(Cookie o : arr){
            if(o.getName().equals("userC")){
                request.setAttribute("username", o.getValue());
            }
            if(o.getName().equals("passC")){
                request.setAttribute("password", o.getValue());
            }
        }
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            // Xử lý lỗi: hiển thị thông báo lỗi chi tiết cho người dùng
            request.getSession().setAttribute("mess", "An error occurred while processing your request. Please try again later.");
            response.sendRedirect("login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}




