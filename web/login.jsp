<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - DriveSecure Seguros</title>
        <link rel="stylesheet" href="css/stylecss.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>

        <header>
            <div>
                <img src="img/logo-drivesecure.png" alt="Logo" style="max-width: 200px;margin-left: 70px;margin-top: -25px;padding-top: 20px;text-align: center;">
                <nav>
                    <ul>
                        <li><a href="index.html">HOME</a></li>
                        <li><a href="#servico">SERVIÇOS</a></li>
                        <li><a href="#depoimento">DEPOIMENTOS</a></li>
                        <li><a href="#sobre-nos">SOBRE-NÓS</a></li>
                        <li><a href="CotacaoServlet">FAÇA SUA COTAÇÃO</a></li>
                        <li><a href="CadastrarUsuarioServlet">CADASTRAR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div id="form-container" style="margin-top: 50px;">
            <form id="login-form" action="LoginServlet" method="post">
                <h2>Login</h2>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha:</label>
                    <input type="password" id="senha" name="senha" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Entrar</button>
            </form>
            <% if (request.getAttribute("mensagem") != null) {%>
            <p><%= request.getAttribute("mensagem")%></p>
            <% }%>
        </div>

        <footer>
            <p>DRIVESECURE SEGUROS</p>
            <p>© 2024 Todos os direitos reservados</p>
        </footer>

    </body>
</html>
