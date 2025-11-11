/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.Users;
import dal.EnrollmentsDAO;
import java.security.Timestamp;
import java.time.LocalDateTime;
import model.Enrollments;
import java.util.Random;


/**
 *
 * @author Admin
 */
public class RegisterCourse extends HttpServlet {
    EnrollmentsDAO enrollmentsDAO = new EnrollmentsDAO();

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterCourse at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy courseId từ request
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        // Lấy thông tin user từ session
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null ) {
            int studentId = user.getUser_id(); // Lấy user_id từ user
            java.sql.Timestamp enrolledDate = java.sql.Timestamp.valueOf(LocalDateTime.now());
            String status = "ENROLLED";
            Enrollments enrollments = Enrollments.builder()
                    .course_id(courseId)
                    .enrolled_date(enrolledDate)
                    .student_id(studentId)
                    .status(status).build();
            enrollmentsDAO.insert (enrollments);
            response.sendRedirect(request.getContextPath() + "/view/user/register_user/register_success.jsp?courseId=" + courseId);
            
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
    
  }
}
