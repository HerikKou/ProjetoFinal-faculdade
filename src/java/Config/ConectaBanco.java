package Config;
import java.sql.*;

/**
 * @Autor: Herik Kou Homma Kato
 * Data: 11/11/2025
 * Hora: 12:00
 * RGM: 11241101814
 */
public class ConectaBanco {

    public static Connection conectar() throws ClassNotFoundException {
        Connection conn = null;
        try {
            // Carrega o driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Parâmetros de conexão
            String url = "jdbc:mysql://localhost:3306/pessoas?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";

            // Tenta conectar
            conn = DriverManager.getConnection(url, usuario, senha);
            System.out.println(" Conectado com sucesso ao banco de dados!");
            return conn;

        } catch (SQLException ex) {
            System.out.println(" Erro SQL ao conectar com o banco: " + ex.getMessage());
          
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println(" Driver do MySQL não encontrado!");
            return null;
        }
    }
}

