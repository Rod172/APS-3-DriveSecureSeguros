package model;

public class Cotacao {

    private int id;
    private String nome_completo;
    private String email;
    private String cpf;
    private String celular;
    private String dataNascimento;
    private Genero genero;
    private EstadoCivil estadoCivil;
    private String veiculo;
    private String placa;
    private String na_faculdade;
    private String no_trabalho;
    private String tipo_contratacao;
    
    

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
 
      
    

    public String getNa_faculdade() {
        return na_faculdade;
    }

    public void setNa_faculdade(String na_faculdade) {
        this.na_faculdade = na_faculdade;
    }

    public String getNo_trabalho() {
        return no_trabalho;
    }

    public void setNo_trabalho(String no_trabalho) {
        this.no_trabalho = no_trabalho;
    }

    
    
    public String getNome_completo() {
        return nome_completo;
    }

    public void setNome_completo(String nome_completo) {
        this.nome_completo = nome_completo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public EstadoCivil getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }


    public String getTipo_contratacao() {
        return tipo_contratacao;
    }

    public void setTipo_contratacao(String tipo_contratacao) {
        this.tipo_contratacao = tipo_contratacao;
    }

    public void setIdUsuario(String IdUsuario) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    public void setId(String id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }


    // Enum para Genero
    public enum Genero {
        MASCULINO,
        FEMININO,
        OUTRO
    }

    // Enum para EstadoCivil
    public enum EstadoCivil {
        SOLTEIRO,
        CASADO,
        DIVORCIADO,
        VIUVO
    }

    public void setGenero(String generoStr) {
        if (generoStr != null && !generoStr.isEmpty()) {
            try {
                this.genero = Genero.valueOf(generoStr.toUpperCase());
            } catch (IllegalArgumentException e) {
                this.genero = null;
            }
        } else {
            this.genero = null;
        }
    }

    public void setEstadoCivil(String estadoCivilStr) {
        if (estadoCivilStr != null && !estadoCivilStr.isEmpty()) {
            try {
                this.estadoCivil = EstadoCivil.valueOf(estadoCivilStr.toUpperCase());
            } catch (IllegalArgumentException e) {
                this.estadoCivil = null;
            }
        } else {
            this.estadoCivil = null;
        }
    }
    
    
}
