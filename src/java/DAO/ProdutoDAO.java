package DAO;

import Config.ConectaBanco;
import Produtos.Produtos;
import java.sql.*;
import java.util.*;

/**
 * @author Herik Kato
 * Data: 11/11/25
 * RGM: 11241101814
 */

public class ProdutoDAO {

    // =========================================================
    // MÉTODO CADASTRAR PRODUTO
    // =========================================================
    public boolean cadastrar(Produtos prod) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            if (conn == null) {
                System.out.println("Falha na conexão com o banco!");
                return false;
            }

            String sql = "INSERT INTO produtos (pk_id, nome, valor, qtd) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, prod.getId());
            stmt.setString(2, prod.getNome());
            stmt.setFloat(3, prod.getValor());
            stmt.setInt(4, prod.getQtd());

            stmt.executeUpdate();
            conn.close();
            System.out.println("Produto cadastrado com sucesso!");
            return true;

        } catch (SQLException ex) {
            System.out.println(" Erro SQL ao cadastrar produto: " + ex.getMessage());
            return false;
        }
    }

    // =========================================================
    // MÉTODO CONSULTAR TODOS
    // =========================================================
    public List<Produtos> consultarGeral() throws ClassNotFoundException {
        List<Produtos> lista = new ArrayList<>();
        Connection conn = null;

        try {
            conn = ConectaBanco.conectar();
            if (conn == null) {
                System.out.println("Falha na conexão com o banco!");
                return lista;
            }

            String sql = "SELECT * FROM produtos";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Produtos prod = new Produtos();
                prod.setId(rs.getInt("pk_id"));
                prod.setNome(rs.getString("nome"));
                prod.setValor(rs.getFloat("valor"));
                prod.setQtd(rs.getInt("qtd"));
                lista.add(prod);
            }

            conn.close();
        } catch (SQLException ex) {
            System.out.println("❌ Erro SQL ao consultar produtos: " + ex.getMessage());
        }

        return lista;
    }

    // =========================================================
    // MÉTODO CONSULTAR POR ID
    // =========================================================
    public Produtos consultarPorId(int id) throws ClassNotFoundException {
        Connection conn = null;
        Produtos prod = null;

        try {
            conn = ConectaBanco.conectar();
            String sql = "SELECT * FROM produtos WHERE pk_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                prod = new Produtos();
                prod.setId(rs.getInt("pk_id"));
                prod.setNome(rs.getString("nome"));
                prod.setValor(rs.getFloat("valor"));
                prod.setQtd(rs.getInt("qtd"));
            }

            conn.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar produto por ID: " + ex.getMessage());
        }

        return prod;
    }

    // =========================================================
    // MÉTODO CONSULTAR POR NOME
    // =========================================================
    public List<Produtos> consultarPorNome(String nome) throws ClassNotFoundException {
        List<Produtos> lista = new ArrayList<>();
        Connection conn = null;

        try {
            conn = ConectaBanco.conectar();
            String sql = "SELECT * FROM produtos WHERE nome LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + nome + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Produtos prod = new Produtos();
                prod.setId(rs.getInt("pk_id"));
                prod.setNome(rs.getString("nome"));
                prod.setValor(rs.getFloat("valor"));
                prod.setQtd(rs.getInt("qtd"));
                lista.add(prod);
            }

            conn.close();
        } catch (SQLException ex) {
            System.out.println(" Erro SQL ao consultar produto por nome: " + ex.getMessage());
        }

        return lista;
    }

    // =========================================================
    // MÉTODO ALTERAR PRODUTO
    // =========================================================
    public boolean alterar(Produtos prod) throws ClassNotFoundException {
        Connection conn = null;

        try {
            conn = ConectaBanco.conectar();
            String sql = "UPDATE produtos SET nome=?, valor=?, qtd=? WHERE pk_id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, prod.getNome());
            stmt.setFloat(2, prod.getValor());
            stmt.setInt(3, prod.getQtd());
            stmt.setInt(4, prod.getId());

            int rows = stmt.executeUpdate();
            conn.close();
            return rows > 0;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao alterar produto: " + ex.getMessage());
            return false;
        }
    }

    // =========================================================
    // MÉTODO EXCLUIR PRODUTO
    // =========================================================
    public boolean excluir(int id) throws ClassNotFoundException {
        Connection conn = null;

        try {
            conn = ConectaBanco.conectar();
            String sql = "DELETE FROM produtos WHERE pk_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            int rows = stmt.executeUpdate();
            conn.close();

            return rows > 0;

        } catch (SQLException ex) {
            System.out.println(" Erro SQL ao excluir produto: " + ex.getMessage());
            return false;
        }
    }
}
