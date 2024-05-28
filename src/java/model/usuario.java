
package model;

import java.util.ArrayList;

public class usuario {
    
    private int id;
    private String email;
    private String senha;
    private ArrayList<Orcamento> Orcamento;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public ArrayList<Orcamento> getOrcamento() {
        return Orcamento;
    }

    public void setOrcamento(ArrayList<Orcamento> Orcamento) {
        this.Orcamento = Orcamento;
    }

    public void setNome_completo(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private static class Orcamento {

        public Orcamento() {
        }
    }
    
    
    
    
}
