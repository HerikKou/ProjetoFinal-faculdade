/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template

Autor: Herik Kou Homma Kato
RGM: 1124101814

*/

package DAO;

import Config.ConectaBanco;

import Vendedor.Vendedor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VendedorDao {

    // Cadastrar novo vendedor (ID manual)
    public boolean cadastrar(Vendedor vendedor) throws ClassNotFoundException {
        String sql = "INSERT INTO vendedores (pk_id, nome, cpf, saldo, email, telefone, endereco, cidade, estado, cep, cnpj) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, vendedor.getPk_id());
            stmt.setString(2, vendedor.getNome());
            stmt.setString(3, vendedor.getCpf());
            stmt.setDouble(4, vendedor.getSaldo());
            stmt.setString(5, vendedor.getEmail());
            stmt.setString(6, vendedor.getTelefone());
            stmt.setString(7, vendedor.getEndereco());
            stmt.setString(8, vendedor.getCidade());
            stmt.setString(9, vendedor.getEstado());
            stmt.setString(10, vendedor.getCep());
            stmt.setString(11, vendedor.getCnpj());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao cadastrar vendedor: " + ex.getMessage());
            return false;
        }
    }

    // Consultar todos os vendedores
    public List<Vendedor> consultarGeral() throws ClassNotFoundException {
        List<Vendedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM vendedores";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                lista.add(mapResultSetToVendedor(rs));
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar vendedores: " + ex.getMessage());
        }

        return lista;
    }

    // Consultar vendedor por ID
    public Vendedor consultarPorId(int id) throws ClassNotFoundException {
        Vendedor vendedor = null;
        String sql = "SELECT * FROM vendedores WHERE pk_id = ?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    vendedor = mapResultSetToVendedor(rs);
                }
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar vendedor por ID: " + ex.getMessage());
        }

        return vendedor;
    }

    // Consultar vendedores por nome
    public List<Vendedor> consultarPorNome(String nome) throws ClassNotFoundException {
        List<Vendedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM vendedores WHERE nome LIKE ?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + nome + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(mapResultSetToVendedor(rs));
                }
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar vendedor por nome: " + ex.getMessage());
        }

        return lista;
    }

    // Atualizar vendedor
    public boolean atualizar(Vendedor vendedor) throws ClassNotFoundException {
        String sql = "UPDATE vendedores SET nome=?, cpf=?, saldo=?, email=?, telefone=?, endereco=?, cidade=?, estado=?, cep=?, cnpj=? "
                   + "WHERE pk_id=?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, vendedor.getNome());
            stmt.setString(2, vendedor.getCpf());
            stmt.setDouble(3, vendedor.getSaldo());
            stmt.setString(4, vendedor.getEmail());
            stmt.setString(5, vendedor.getTelefone());
            stmt.setString(6, vendedor.getEndereco());
            stmt.setString(7, vendedor.getCidade());
            stmt.setString(8, vendedor.getEstado());
            stmt.setString(9, vendedor.getCep());
            stmt.setString(10, vendedor.getCnpj());
            stmt.setInt(11, vendedor.getPk_id());

            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao atualizar vendedor: " + ex.getMessage());
            return false;
        }
    }

    // Deletar vendedor
    public boolean deletar(int pk_id) throws ClassNotFoundException {
        String sql = "DELETE FROM vendedores WHERE pk_id = ?";

        try (Connection conn = ConectaBanco.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, pk_id);
            stmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao deletar vendedor: " + ex.getMessage());
            return false;
        }
    }

    // Mapeia ResultSet para Vendedor
    private Vendedor mapResultSetToVendedor(ResultSet rs) throws SQLException {
        return new Vendedor(
                rs.getInt("pk_id"),
                rs.getString("nome"),
                rs.getString("cpf"),
                rs.getDouble("saldo"),
                rs.getString("email"),
                rs.getString("telefone"),
                rs.getString("endereco"),
                rs.getString("cidade"),
                rs.getString("estado"),
                rs.getString("cep"),
                rs.getString("cnpj")
        );
    }
}
