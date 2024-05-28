<%@ page import="model.Cotacao, dao.CotacaoDAO" %>
<%@ page session="true" %>
        <%

            usuario u = (usuario) session.getAttribute("usuarioLogado");
            if (u != null) {
                out.print(u.getEmail());
            }


        %>
<%
       Cotacao cotacao = (Cotacao) session.getAttribute("cotacao");

    %>
<!DOCTYPE html>
<html lang="pt">   
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Dados</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <h1>Editar Dados</h1>
        <form action="AtualizarCotacaoServlet" method="GET" accept-charset=utf-8>
            <input type="hidden" name="email" value="<%= cotacao.getEmail()%>">
            <label for="veiculo">Veículo:</label>
            <input type="text"  name="veiculo" value="<%= cotacao.getVeiculo()%>" required><br><br>

            <label for="placa">Placa:</label>
            <input type="text"  name="placa" value="<%= cotacao.getPlaca()%>" required><br><br>

            <label for="na_faculdade">Na Faculdade:</label>
            <input type="text"  name="na_faculdade" value="<%= cotacao.getNa_faculdade()%>"><br><br>

            <label for="no_trabalho">No Trabalho:</label>
            <input type="text"  name="no_trabalho" value="<%= cotacao.getNo_trabalho()%>"><br><br>

            <label for="tipo_contratacao">Tipo de Contratação:</label>
            <input type="text"  name="tipo_contratacao" value="<%= cotacao.getTipo_contratacao()%>"><br><br>

            <label for="nome_completo">Nome Completo:</label>
            <input type="text" name="nome_completo" value="<%= cotacao.getNome_completo()%>" required><br><br>

            <label for="email">Email:</label>
            <input type="email"  name="email" value="<%= cotacao.getEmail()%>" required><br><br>

            <label for="cpf">CPF:</label>
            <input type="text"  name="cpf" value="<%= cotacao.getCpf()%>" required><br><br>

            <label for="celular">Celular:</label>
            <input type="text"  name="celular" value="<%= cotacao.getCelular()%>"><br><br>

            <label for="data_nascimento">Data de Nascimento:</label>
            <input type="date"  name="data_nascimento" value="<%= cotacao.getDataNascimento()%>" required><br><br>

            <label for="genero">Gênero:</label>
            <input type="text"  name="genero" value="<%= cotacao.getGenero()%>"><br><br>

            <label for="estado_civil">Estado Civil:</label>
            <input type="text"  name="estado_civil" value="<%= cotacao.getEstadoCivil()%>"><br><br>

            <input type="submit" value="Salvar Alterações">
        </form>
    </body>
</html>
