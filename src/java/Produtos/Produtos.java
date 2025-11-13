/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 
** @author Herik Kato
 * Data: 11/11/25
 * RGM:11241101814

*/
package Produtos;

public class Produtos {
    //Atributos
    private int id;
    private String nome;
    private float valor;
    private int  qtd;
    
    //Métodos
    public void setId(int p_id) {
        this.id = p_id;
    }
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }
    public void setValor(float p_valor) {
        this.valor = p_valor;
    }
    public void setQtd(int p_qtd) {
        this.qtd = p_qtd;
    }
    public int getId() {
        return this.id;
    }
    public String getNome() {
        return this.nome;
    }
    public float getValor() {
        return this.valor;
    }
    public int getQtd() {
        return this.qtd;
    }          
}
