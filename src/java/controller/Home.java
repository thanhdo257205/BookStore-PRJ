/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Constant;
import model.PageControl;
import model.Product;

/**
 *
 * @author dotha
 */
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        PageControl pageControl = new PageControl();
        final int numberRecordPerPage = Constant.NUMBER_RECORD_PER_PAGE;
        String action = request.getParameter("action");
        request.setAttribute("listCategory", listCategoryAll(request, response));
        if (action == null) {
            try {
                request.setAttribute("listProduct", listProductAll(request, response, pageControl, numberRecordPerPage));
            } catch (SQLException ex) {
                Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            switch (action) {
                case "category":
                    String name = request.getParameter("name");
                    int totalPage = new ProductDAO().getTotalRecordByCategory(name);
                    setPageControl(pageControl, totalPage, request, numberRecordPerPage);
                    pageControl.setUrl(request.getRequestURL().toString() + "?action=category&name=" + name + "&");
                    int page = pageControl.getPage();
                    request.setAttribute("listProduct", new ProductDAO().findByCategory(name, page));
                    break;
                case "search":
                    String keyword = request.getParameter("keyword");
                    request.setAttribute("listProduct", new ProductDAO().findProductByName(keyword));
                    setPageControl(pageControl, new ProductDAO().findProductByName(keyword).size(), request, numberRecordPerPage);
                    pageControl.setUrl(request.getRequestURL().toString() + "?action=search&keyword=" + keyword + "&");
                    break;
                default:
                    throw new AssertionError();
            }
        }
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("view/user/home.jsp").forward(request, response);
    }

    private List<Product> listProductAll(HttpServletRequest request, HttpServletResponse response, PageControl pageControl, int numberRecordPerPage) throws SQLException {
        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        List<Product> listProduct = new ProductDAO().findAll(page);
        int totalRecord = new ProductDAO().countTotalrecord("SELECT COUNT(*) AS CountProduct FROM Product");
        int totalPage = (totalRecord % numberRecordPerPage) == 0 ? totalRecord / numberRecordPerPage : (totalRecord / numberRecordPerPage) + 1;
        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setTotalpage(totalPage);
        String url = request.getRequestURL().toString();
        pageControl.setUrl(url + "?");
        return listProduct;
    }

    private void setPageControl(PageControl pageControl, int totalPagee, HttpServletRequest request, int numberRecordPerPage) {
        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        int totalRecord = totalPagee;
        int totalPage = (totalRecord % numberRecordPerPage) == 0 ? totalRecord / numberRecordPerPage : (totalRecord / numberRecordPerPage) + 1;
        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setTotalpage(totalPage);
    }

    private Map<String, Integer> listCategoryAll(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Integer> listCategory = new CategoryDAO().findCategoryQuantity();
        return listCategory;
    }

    private List<Category> getCategory() {
        return new CategoryDAO().findAll();
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
        processRequest(request, response);
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
