/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clientes;

/**
 *
  *Autor: Herik Kou Homma Kato
  * RGM: 11241101814
 */
    public class Cliente {
    
    private int pk_id;
    private String nome;
    private String cpf;
    private double saldo;
    private String email;

    // Construtor 
    public Cliente(int pk_id, String nome, String cpf, double saldo, String email) {
        this.pk_id = pk_id;
        this.nome = nome;
        this.cpf = cpf;
        this.saldo = saldo;
        this.email = email;
    }
    public Cliente(){}

    // Getters e Setters
    public int getPk_id() {
        return pk_id;
    }

    public void setPk_id(int pk_id) {
        this.pk_id = pk_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

