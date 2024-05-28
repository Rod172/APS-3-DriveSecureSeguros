package servlet;

import dao.CotacaoDAO;
import model.Cotacao;

import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;

@WebServlet(name = "AtualizarUsuarioServlet", urlPatterns = {"/AtualizarUsuarioServlet"})
public class AtualizarUsuarioServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CotacaoServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("GerenciamentodePerfil.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Obtendo os parâmetros do formulário
            String veiculo = request.getParameter("veiculo");
            String placa = request.getParameter("placa");
            String naFaculdade = request.getParameter("na_faculdade");
            String noTrabalho = request.getParameter("no_trabalho");
            String tipoContratacao = request.getParameter("tipo_contratacao");
            String nomeCompleto = request.getParameter("nome_completo");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String celular = request.getParameter("celular");
            String dataNascimento = request.getParameter("data_nascimento");
            String genero = request.getParameter("genero");
            String estadoCivil = request.getParameter("estado_civil");

            LOGGER.log(Level.INFO, "Recebendo dados do formulário: {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11}",
                    new Object[]{veiculo, placa, naFaculdade, noTrabalho, tipoContratacao, nomeCompleto, email, cpf, celular, dataNascimento, genero, estadoCivil});

            // Criando objeto Cotacao com os dados do formulário
            Cotacao cotacao = new Cotacao();
            cotacao.setVeiculo(veiculo);
            cotacao.setPlaca(placa);
            cotacao.setNa_faculdade(naFaculdade);
            cotacao.setNo_trabalho(noTrabalho);
            cotacao.setTipo_contratacao(tipoContratacao);
            cotacao.setNome_completo(nomeCompleto);
            cotacao.setEmail(email);
            cotacao.setCpf(cpf);
            cotacao.setCelular(celular);
            cotacao.setDataNascimento(dataNascimento);
            cotacao.setGenero(genero);
            cotacao.setEstadoCivil(estadoCivil);

            // Inserir Cotacao no banco de dados
            boolean sucesso = CotacaoDAO.atualizarOrcamento(cotacao);

            if (sucesso) {
                LOGGER.log(Level.INFO, "Inserção bem-sucedida.");
                response.sendRedirect("index.jsp");
            } else {
                LOGGER.log(Level.SEVERE, "Erro na inserção.");
                response.sendRedirect("erroCadastro.jsp");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Erro no processamento do formulário.", e);
            throw new ServletException("Erro ao processar o formulário", e);
        }
    }

    @Override
    public void destroy() {
        Enumeration<java.sql.Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            java.sql.Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (java.sql.SQLException ex) {
                Logger.getLogger(CotacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        super.destroy();
    }

    private static class SQLException {

        public SQLException() {
        }
    }
}
