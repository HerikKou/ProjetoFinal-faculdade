package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import TransacaoModel.Transacao;
import Vendedor.Vendedor;
import Clientes.Cliente;
import Produtos.Produtos;
import Config.ConectaBanco;

/**
 * @author Herik
 * Data: 12/11/2025
 * Classe responsável pelo CRUD de Transações
 */
public class TransacaoDao {

    // ============================================================
    // MÉTODO CADASTRAR
    // ============================================================
    public boolean cadastrar(Transacao transacao) throws ClassNotFoundException {
        String sql = "INSERT INTO transacoes (id, cliente_id, vendedor_id, produto_id, quantidade, valor_total, data) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, transacao.getId());
            stmt.setInt(2, transacao.getCliente().getPk_id());
            stmt.setInt(3, transacao.getVendedor().getPk_id());
            stmt.setInt(4, transacao.getProduto().getId());
            stmt.setInt(5, transacao.getQuantidade());
            stmt.setDouble(6, transacao.getValorTotal());
            stmt.setTimestamp(7, Timestamp.valueOf(transacao.getData()));

            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("❌ Erro SQL ao cadastrar transação: " + e.getMessage());
            return false;
        }
    }

    // ============================================================
    // MÉTODO CONSULTAR POR ID
    // ============================================================
    public Transacao consultarPorId(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM transacoes WHERE id = ?";
        Transacao transacao = null;

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setPk_id(rs.getInt("cliente_id"));

                Vendedor vendedor = new Vendedor();
                vendedor.setPk_id(rs.getInt("vendedor_id"));

                Produtos produto = new Produtos();
                produto.setId(rs.getInt("produto_id"));

                transacao = new Transacao();
                transacao.setId(rs.getInt("id"));
                transacao.setCliente(cliente);
                transacao.setVendedor(vendedor);
                transacao.setProduto(produto);
                transacao.setQuantidade(rs.getInt("quantidade"));
                transacao.setValorTotal(rs.getDouble("valor_total"));
                transacao.setData(rs.getTimestamp("data").toLocalDateTime());
            }

        } catch (SQLException e) {
            System.out.println("❌ Erro SQL ao consultar transação: " + e.getMessage());
        }

        return transacao;
    }

    // ============================================================
    // MÉTODO LISTAR TODAS
    // ============================================================
    public List<Transacao> listarTodas() throws ClassNotFoundException {
        List<Transacao> lista = new ArrayList<>();
        String sql = "SELECT * FROM transacoes";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setPk_id(rs.getInt("cliente_id"));

                Vendedor vendedor = new Vendedor();
                vendedor.setPk_id(rs.getInt("vendedor_id"));

                Produtos produto = new Produtos();
                produto.setId(rs.getInt("produto_id"));

                Transacao transacao = new Transacao();
                transacao.setId(rs.getInt("id"));
                transacao.setCliente(cliente);
                transacao.setVendedor(vendedor);
                transacao.setProduto(produto);
                transacao.setQuantidade(rs.getInt("quantidade"));
                transacao.setValorTotal(rs.getDouble("valor_total"));
                transacao.setData(rs.getTimestamp("data").toLocalDateTime());

                lista.add(transacao);
            }

        } catch (SQLException e) {
            System.out.println("❌ Erro SQL ao listar transações: " + e.getMessage());
        }

        return lista;
    }

    // ============================================================
    // MÉTODO EXCLUIR
    // ============================================================
    public boolean excluir(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM transacoes WHERE id = ?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int linhas = stmt.executeUpdate();
            return linhas > 0;

        } catch (SQLException e) {
            System.out.println("❌ Erro SQL ao excluir transação: " + e.getMessage());
            return false;
        }
    }

    // ============================================================
    // MÉTODO ALTERAR
    // ============================================================
    public boolean alterar(Transacao transacao) throws ClassNotFoundException {
        String sql = "UPDATE transacoes SET cliente_id = ?, vendedor_id = ?, produto_id = ?, " +
                     "quantidade = ?, valor_total = ?, data = ? WHERE id = ?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, transacao.getCliente().getPk_id());
            stmt.setInt(2, transacao.getVendedor().getPk_id());
            stmt.setInt(3, transacao.getProduto().getId());
            stmt.setInt(4, transacao.getQuantidade());
            stmt.setDouble(5, transacao.getValorTotal());
            stmt.setTimestamp(6, Timestamp.valueOf(transacao.getData()));
            stmt.setInt(7, transacao.getId());

            int linhas = stmt.executeUpdate();
            return linhas > 0;

        } catch (SQLException e) {
            System.out.println("❌ Erro SQL ao alterar transação: " + e.getMessage());
            return false;
        }
    }
}
