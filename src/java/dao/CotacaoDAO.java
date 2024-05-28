package dao;

import com.mysql.cj.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Cotacao;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CotacaoDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private static final String SELECT_BY_EMAIL_SQL = "SELECT * FROM dadosseguro WHERE email = ?";
    private static final String INSERT_SQL = "INSERT INTO drivesecure_seguros.dadosseguro (veiculo, placa, na_faculdade, no_trabalho, tipo_contratacao, nome_completo, email, cpf, celular, data_nascimento, genero, estado_civil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_SQL = "UPDATE drivesecure_seguros.dadosseguro SET veiculo = ?, placa = ?, na_faculdade = ?, no_trabalho = ?, tipo_contratacao = ?, nome_completo = ?, email = ?, cpf = ?, celular = ?, data_nascimento = ?, genero = ?, estado_civil = ? WHERE id = ?";
    private static final String DELETE_SQL = "DELETE FROM drivesecure_seguros.dadosseguro WHERE id = ?";

    private static final Logger LOGGER = Logger.getLogger(CotacaoDAO.class.getName());

public static Cotacao buscarOrcamentoDoUsuario(String email) throws SQLException {
        Cotacao o = null;

        try (Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = c.prepareStatement(SELECT_BY_EMAIL_SQL)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                o = new Cotacao();
                o.setId(rs.getInt("id"));
                o.setVeiculo(rs.getString("veiculo"));
                o.setPlaca(rs.getString("placa"));
                o.setNa_faculdade(rs.getString("na_faculdade"));
                o.setNo_trabalho(rs.getString("no_trabalho"));
                o.setTipo_contratacao(rs.getString("tipo_contratacao"));
                o.setNome_completo(rs.getString("nome_completo"));
                o.setEmail(rs.getString("email"));
                o.setCpf(rs.getString("cpf"));
                o.setCelular(rs.getString("celular"));
                o.setDataNascimento(rs.getString("data_nascimento"));
                o.setGenero(rs.getString("genero"));
                o.setEstadoCivil(rs.getString("estado_civil"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Tratamento de exceções de SQL
        }
        return o;
    }


    public static boolean inserirOrcamento(Cotacao orcamento) {
        boolean sucesso = false;

        try {
            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(INSERT_SQL);

            stmt.setString(1, orcamento.getVeiculo());
            stmt.setString(2, orcamento.getPlaca());
            stmt.setString(3, orcamento.getNa_faculdade());
            stmt.setString(4, orcamento.getNo_trabalho());
            stmt.setString(5, orcamento.getTipo_contratacao());
            stmt.setString(6, orcamento.getNome_completo());
            stmt.setString(7, orcamento.getEmail());
            stmt.setString(8, orcamento.getCpf());
            stmt.setString(9, orcamento.getCelular());
            stmt.setString(10, orcamento.getDataNascimento());
            stmt.setString(11, orcamento.getGenero() != null ? orcamento.getGenero().name() : null);
            stmt.setString(12, orcamento.getEstadoCivil() != null ? orcamento.getEstadoCivil().name() : null);

            int rowsAffected = stmt.executeUpdate();
            sucesso = rowsAffected > 0;

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erro ao inserir orçamento.", e);
            e.printStackTrace();
        }

        return sucesso;
    }

    public static boolean atualizarOrcamento(Cotacao orcamento) {
        boolean sucesso = false;

        try (Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement stmt = c.prepareStatement(UPDATE_SQL)) {

            stmt.setString(1, orcamento.getVeiculo());
            stmt.setString(2, orcamento.getPlaca());
            stmt.setString(3, orcamento.getNa_faculdade());
            stmt.setString(4, orcamento.getNo_trabalho());
            stmt.setString(5, orcamento.getTipo_contratacao());
            stmt.setString(6, orcamento.getNome_completo());
            stmt.setString(7, orcamento.getEmail());
            stmt.setString(8, orcamento.getCpf());
            stmt.setString(9, orcamento.getCelular());
            stmt.setString(10, orcamento.getDataNascimento());
            stmt.setString(11, orcamento.getGenero() != null ? orcamento.getGenero().name() : null);
            stmt.setString(12, orcamento.getEstadoCivil() != null ? orcamento.getEstadoCivil().name() : null);

            int rowsAffected = stmt.executeUpdate();
            sucesso = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            LOGGER.log(Level.SEVERE, "Erro ao inserir orçamento.", e);
        }

        return sucesso;
    }

    public static boolean removerOrcamento(int id) {
        boolean sucesso = false;

        try (Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement stmt = c.prepareStatement(DELETE_SQL)) {

            stmt.setInt(1, id);

            int rowsAffected = stmt.executeUpdate();
            sucesso = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Considere usar um logger
        }

        return sucesso;
    }

  
}
