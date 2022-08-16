package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, InstantiationException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Register servlet stating point");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            //getting all the incoming detail from  reguest
            System.out.println("Register servlet request parameter point");
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            System.out.println("before file part");
            Part part = request.getPart("user_image");
            System.out.println("between file part");

            String fileName = part.getSubmittedFileName();
            System.out.println("the file name is" + fileName);
            out.println(fileName);

            //connection..............
            try {

                Thread.sleep(2000);

                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trn", "root", "Password1");

                //query.............
                String q = "insert into user(name,password,email) values(?,?,?)";

                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1, name);
                pstmt.setString(2, password);
                pstmt.setString(3, email);

//                pstmt.executeUpdate();
                out.println("registered");

            } catch (ClassNotFoundException e) {
                out.println(e.getMessage());
            } catch (IllegalAccessException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }

            //................
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
