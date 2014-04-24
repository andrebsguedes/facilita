/*
 *Licensed under ..., see LICENSE.md
 *Authors: André Bernardes.
 *Created on: 28/03/2014, 11:23:34
 *Description: Class that change the menu.
 */

package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Menu;
import modelo.MenuDAO;


public class AlterarMenu extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
    if(session.getAttribute("menu") == null){
       response.sendRedirect("index.jsp?erro=1");
    }else{
            // TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarMenu</title>");  
            out.println("</head>");
            out.println("<body>");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String menuName = request.getParameter("menu");
                String link = request.getParameter("link");
                String icon = request.getParameter("icon");

                MenuDAO menuDB = new MenuDAO();

                menuDB.conectar();

                Menu menu = new Menu();

                menu.setId(id);
                menu.setMenu(menuName);
                menu.setLink(link);
                menu.setIcone(icon);
                menuDB.alterar(menu);

                menuDB.desconectar();

                out.print("<script language='JavaScript'>");
                out.print(" alert('Registros alterados com sucesso!');");
                out.print(" window.open('listar_menu.jsp','_parent');");
                out.print("</script>");

            } catch (Exception e) {
                out.print(e);
            }
            out.println("</body>");
            out.println("</html>");
            }
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
