/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * Autor: Herik Kou Homma Kato
  *RGM: 11241101814
 */
package DAO;

import Clientes.Cliente;
import Config.ConectaBanco;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PessoaDao {

    public boolean cadastrar(Cliente cliente) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "INSERT INTO cliente(nome, cpf, saldo, email) VALUES(?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getCpf());
            stmt.setDouble(3, cliente.getSaldo());
            stmt.setString(4, cliente.getEmail());
            stmt.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao cadastrar: " + ex.getMessage());
            return false;
        }
    }

    public List<Cliente> consultarGeral() throws ClassNotFoundException {
        List<Cliente> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "SELECT * FROM cliente";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                lista.add(new Cliente(
                    rs.getInt("pk_id"),
                    rs.getString("nome"),
                    rs.getString("cpf"),
                    rs.getDouble("saldo"),
                    rs.getString("email")
                ));
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar: " + ex.getMessage());
        }
        return lista;
    }

    public Cliente consultarPorId(int id) throws ClassNotFoundException {
        Connection conn = null;
        Cliente cliente = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "SELECT * FROM cliente WHERE pk_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                cliente = new Cliente(
                    rs.getInt("pk_id"),
                    rs.getString("nome"),
                    rs.getString("cpf"),
                    rs.getDouble("saldo"),
                    rs.getString("email")
                );
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar por ID: " + ex.getMessage());
        }
        return cliente;
    }

    public List<Cliente> consultarPorNome(String nome) throws ClassNotFoundException {
        List<Cliente> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "SELECT * FROM cliente WHERE nome LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + nome + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                lista.add(new Cliente(
                    rs.getInt("pk_id"),
                    rs.getString("nome"),
                    rs.getString("cpf"),
                    rs.getDouble("saldo"),
                    rs.getString("email")
                ));
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar por nome: " + ex.getMessage());
        }
        return lista;
    }

    public boolean atualizar(Cliente cliente) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "UPDATE cliente SET nome=?, cpf=?, saldo=?, email=? WHERE pk_id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getCpf());
            stmt.setDouble(3, cliente.getSaldo());
            stmt.setString(4, cliente.getEmail());
            stmt.setInt(5, cliente.getPk_id());
            stmt.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao atualizar: " + ex.getMessage());
            return false;
        }
    }

    public boolean deletar(int pk_id) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "DELETE FROM cliente WHERE pk_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, pk_id);
            stmt.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL ao deletar: " + ex.getMessage());
            return false;
        }
    }
}
