package TransacaoModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 *** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814
 */

import Clientes.Cliente;
import Vendedor.Vendedor;
import Produtos.Produtos;
import java.time.LocalDateTime;

public class Transacao {

    private int id;             // ID da transação
    private Cliente cliente;    // Cliente que compra
    private Vendedor vendedor;  // Vendedor que recebe
    private Produtos produto;   // Produto comprado
    private int quantidade;     // Quantidade do produto
    private double valorTotal;  // Valor total da compra
    private LocalDateTime data; // Data da transação

    // Construtor
    public Transacao(int id, Cliente cliente, Vendedor vendedor, Produtos produto,
                     int quantidade, double valorTotal, LocalDateTime data) {
        this.id = id;
        this.cliente = cliente;
        this.vendedor = vendedor;
        this.produto = produto;
        this.quantidade = quantidade;
        this.valorTotal = valorTotal;
        this.data = data;
    }

    // Construtor vazio
    public Transacao() {}

    // Getters e Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }
    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public Produtos getProduto() {
        return produto;
    }
    public void setProduto(Produtos produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValorTotal() {
        return valorTotal;
    }
    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public LocalDateTime getData() {
        return data;
    }
    public void setData(LocalDateTime data) {
        this.data = data;
    }
}

