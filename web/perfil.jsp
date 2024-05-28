<%@ page import="model.usuario" %>
<%@ page session="true" %>
<%
    usuario usuario = (usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil</title>
</head>
<body>
    <h1>Perfil</h1>
    <form action="AtualizarUsuarioServlet" method="post">
        usuario <%= usuario.getUsuario" name="password" value="<%= usuario.getSenha() %>" required><br>
        Email: <input type="email" name="email" value="<%= usuario.getEmail() %>" required><br>
        Nome Completo: <input type="text" name="nomeCompleto" value="<%= usuario.getNomeCompleto() %>" required><br>
        Data de Nascimento: <input type="date" name="dataNascimento" value="<%= usuario.getDataNascimento() %>" required><br>
        Gênero: <input type="text" name="genero" value="<%= usuario.getGenero() %>" required><br>
        Estado Civil: <input type="text" name="estadoCivil" value="<%= usuario.getEstadoCivil() %>" required><br>
        <input type="submit" value="Atualizar">
    </form>
    <form action="DeletarServlet" method="post">
        <input type="submit" value="Deletar Conta">
    </form>
</body>
</html>
