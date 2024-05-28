package servlet;

import dao.UsuarioDAO;
import model.usuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Encaminhar para a página de login
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Verificar se o email e senha correspondem a um usuário no banco de dados
        usuario u = UsuarioDAO.buscarUsuarioPorEmail(email);
        
        boolean loginSucesso = false;
        
        if(u != null && u.getSenha().equals(senha)){
            loginSucesso = true;
            
        }
        if (loginSucesso) {
            
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", u);
            
            session.setAttribute("usuario", u);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("mensagem", "Email ou senha incorretos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
