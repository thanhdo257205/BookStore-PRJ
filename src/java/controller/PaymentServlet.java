/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.CartItemDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Product;

/**
 *
 * @author dotha
 */
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "":
                request.getRequestDispatcher("/view/user/payment.jsp").forward(request, response);
                break;
            case "add-product": {
                try {
                    addProduct(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
            case "viewcard":
                viewCart(request, response);
                break;
            case "remove":
                removeProductInCartItem(request, response);
                break;
            default:
                throw new AssertionError();
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

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        
        if (account == null) {
            response.sendRedirect("Login");
            return;
        }
        
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCartByAccountId(account.getId());
        
        if (cart == null) {
            int cartId = cartDAO.createCart(account);
            if (cartId == -1) {
                throw new RuntimeException("Cannot create cart");
            }
            cart = new Cart();
            cart.setId(cartId);
            cart.setAccountId(account.getId());
        }
        
        CartItemDAO cartItemDAO = new CartItemDAO();
        
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int cartId = cart.getId();
        boolean checkUniqueKey = cartItemDAO.checkUniquekey(cartId, productId);
        
        if (!checkUniqueKey) {
            cartItemDAO.addProducttoCart(cart.getId(), productId, quantity);
        } else {
            cartItemDAO.updateCartQuantity(cartId, productId, quantity);
        }
        
        List<CartItem> listCartItem
                = cartItemDAO.getCartItemsByCartId(cart.getId());
        
        request.setAttribute("listCartItem", listCartItem);
        request.getRequestDispatcher("/view/user/payment.jsp")
                .forward(request, response);
    }
    
    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCartByAccountId(account.getId());
        if (cart == null) {
            int id = cartDAO.createCart(account);
            if (id == -1) {
                throw new RuntimeException("Cannot create cart");
            }
            cart = new Cart();
            cart.setId(id);
            cart.setAccountId(account.getId());
        }
        List<CartItem> listCartItem = new CartItemDAO().getCartItemsByCartId(cart.getId());
        request.setAttribute("cart", cart);
        request.setAttribute("listCartItem", listCartItem);
        request.getRequestDispatcher("/view/user/payment.jsp")
                .forward(request, response);
    }

    private void removeProductInCartItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int cartid = Integer.parseInt(request.getParameter("cartid"));
        int productid = Integer.parseInt(request.getParameter("productid"));
        CartItemDAO cartItemDAO = new CartItemDAO();
        cartItemDAO.removeProduct(cartid, productid);
        response.sendRedirect(request.getContextPath() + "/Payment?action=viewcard");
    }
    
}
