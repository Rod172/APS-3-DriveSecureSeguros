package dao;

import com.mysql.cj.jdbc.Driver;
import model.usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private static final String SELECT_SQL = "SELECT * FROM drivesecure_seguros.usuarios";
    private static final String SELECT_BY_EMAIL_SQL = "SELECT * FROM drivesecure_seguros.usuarios WHERE email = ?";
    private static final String UPDATE_SQL = "UPDATE drivesecure_seguros.usuarios SET email = ?, senha = ? WHERE id = ?";
    private static final String DELETE_SQL = "DELETE FROM drivesecure_seguros.usuarios WHERE id = ?";
    private static final String INSERT_SQL = "INSERT INTO drivesecure_seguros.usuarios (email, senha) VALUES (?, ?)";

    public static ArrayList<usuario> buscarUsuarios() {

        ArrayList<usuario> usuarios = new ArrayList();

        try {

            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(SELECT_SQL);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("id");
                String email = rs.getString("email");
                String senha = rs.getString("senha");

                usuario u = new usuario();
                u.setId(id);
                u.setEmail(email);
                u.setSenha(senha);

                usuarios.add(u);

            }

            stmt.close();
            c.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    public static usuario buscarUsuarioPorEmail(String email) {
        usuario u = null;

        try {
            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(SELECT_BY_EMAIL_SQL);

            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String senha = rs.getString("senha");

                u = new usuario();
                u.setId(id);
                u.setEmail(email);
                u.setSenha(senha); 
            }

            c.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    public static boolean inserirUsuario(usuario u) {

        boolean sucesso = false;

        try {

            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(INSERT_SQL);

            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                sucesso = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sucesso;
    }

    public static boolean atualizarUsuario(usuario u) {

        boolean sucesso = false;
        try {

            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(UPDATE_SQL);

            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());
            stmt.setInt(3, u.getId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                sucesso = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sucesso;
    }

    public static boolean deletarUsuario(usuario u) {

        boolean sucesso = false;

        try {

            Driver driver = new Driver();
            DriverManager.registerDriver(driver);

            Connection c = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = c.prepareStatement(DELETE_SQL);

            stmt.setInt(1, u.getId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                sucesso = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sucesso;
    }

    public static usuario buscarUsuarioPorEmail(String email, String senha) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    public static usuario getUserByEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

}
