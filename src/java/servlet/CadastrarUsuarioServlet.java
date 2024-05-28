package servlet;

import dao.UsuarioDAO;
import model.usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastrarUsuarioServlet", urlPatterns = {"/CadastrarUsuarioServlet"})
public class CadastrarUsuarioServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("cadastrar_usuario.jsp");

        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Processar cadastro do usuario
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        usuario u = new usuario();
        u.setEmail(email);
        u.setSenha(senha);

        boolean inserido = UsuarioDAO.inserirUsuario(u);

        if (inserido) {
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("erroCadastro.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para cadastro de usuários";
    }
}
