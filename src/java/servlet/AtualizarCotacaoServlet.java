package servlet;

import dao.CotacaoDAO;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cotacao;

@WebServlet(name = "AtualizarCotacaoServlet", urlPatterns = {"/AtualizarCotacaoServlet"})
public class AtualizarCotacaoServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AtualizarCotacaoServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Verificar se o ID foi fornecido
        if (email == null || email.isEmpty()) {
            LOGGER.log(Level.SEVERE, "ID não fornecido para atualização.");
            response.sendRedirect("erro.jsp"); // Redireciona para página de erro
            return;
        }

        // Buscar a cotação com base no ID
        Cotacao c = null;
        try {
            c = CotacaoDAO.buscarOrcamentoDoUsuario(email);
        } catch (SQLException ex) {
            Logger.getLogger(AtualizarCotacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Verificar se a cotação foi encontrada
        if (c == null) {
            LOGGER.log(Level.SEVERE, "Cotação não encontrada para o ID fornecido: " + email);
            response.sendRedirect("erro.jsp"); // Redireciona para página de erro
            return;
        }

        // Armazenar a cotação na sessão
        HttpSession session = request.getSession();
        session.setAttribute("cotacao", c);

        // Encaminhar para a página de atualização de dados
        RequestDispatcher rd = request.getRequestDispatcher("atualizar_dados.jsp");
        rd.forward(request, response);
    }

    @Override
    public void destroy() {
        Enumeration<java.sql.Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            java.sql.Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (java.sql.SQLException ex) {
                Logger.getLogger(AtualizarCotacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        super.destroy();
    }
}
