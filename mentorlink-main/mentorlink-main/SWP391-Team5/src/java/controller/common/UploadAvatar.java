package controller.common;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.UUID;
import model.User;

// Cấu hình xử lý dữ liệu
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UploadAvatar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadAvatar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadAvatar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
//        User sessionUser = (User) session.getAttribute("acc");
//        // Lấy user_id từ đối tượng User lấy từ session
//        String sessionUser_id = sessionUser.getUser_id();
//
//        // Lấy đối tượng Part chứa thông tin về tệp tin từ yêu cầu request dựa trên tên "file"
//        Part part = request.getPart("file");
//
//        // Trích xuất tên tệp từ đối tượng Part
//        String fileName = extractFileName(part);
//        // refines the fileName in case it is an absolute path
//        fileName = new File(fileName).getName();
//
//        // Ghi tệp tin vào thư mục upload
//        part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
//        UserDAO dao = new UserDAO();
//        session.setAttribute("avatarUrl", fileName);
//
//        try {
//            //Cập nhật avatar người dùng trong cơ sở dữ liệu
//            dao.UpdateUserAvatar(fileName, Integer.parseInt(sessionUser_id));
//
//            // Gửi phản hồi thành công
//            response.getWriter().write(fileName);
//        } catch (Exception e) {
//            // Xử lý lỗi
//            e.printStackTrace();
//
//            // Gửi phản hồi lỗi
//            response.getWriter().write("Error: " + e.getMessage());
//        }
//
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file"); // Lấy file từ request
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên file

        // Tạo một đường dẫn tới thư mục lưu trữ file tải lên
        String uploadPath = "C:\\Users\\Tuan Vinh\\OneDrive\\Documents\\GitHub\\mentorlink\\SWP391-Team5\\web\\assets\\upload";
        File uploadDirectory = new File(uploadPath);

        // Nếu thư mục chưa tồn tại, tạo nó
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdir();
        }

        String extension = "";
        int i = fileName.lastIndexOf('.');
        if (i >= 0) {
            extension = fileName.substring(i);
        }

        String uniqueFileName = System.currentTimeMillis() + extension;

        // Ghi file vào thư mục
        filePart.write(uploadPath + File.separator + uniqueFileName);

        // Cập nhật cơ sở dữ liệu với tên file mới
        // Giả sử bạn có một đối tượng User trong session và một lớp UserDao để cập nhật cơ sở dữ liệu
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("acc");
        UserDAO userDao = new UserDAO();
        session.setAttribute("avatarUrl", uniqueFileName);
        String sessionUser_id = sessionUser.getUser_id();
        userDao.UpdateUserAvatar(uniqueFileName, Integer.parseInt(sessionUser_id));

        // Trả về tên file về cho client
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(fileName);
    }

    /**
     * Trích xuất tên tệp từ một đối tượng Part trong xử lý dữ liệu đa phần
     * (multipart/form-data).
     *
     * @param part
     * @return
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    /**
     * Trả về đối tượng File đại diện cho thư mục upload.
     *
     * @return File
     */
    public File getFolderUpload() {
        File folderUpload = new File("C:\\Users\\Tuan Vinh\\OneDrive\\Documents\\GitHub\\mentorlink\\SWP391-Team5\\web\\assets\\upload");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
}
