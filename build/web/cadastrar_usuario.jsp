<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar - DriveSecure Seguros</title>
        <link rel="stylesheet" href="css/stylecss.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>

            // Função para rolar a página até o topo
            function voltarAoTopo() {
                window.scrollTo({top: 0, behavior: 'smooth'});
            }

            window.addEventListener('scroll', function () {
                if (window.scrollY > 500) {
                    document.getElementById('btn-voltar-topo').style.display = 'block';
                } else {
                    document.getElementById('btn-voltar-topo').style.display = 'none';
                }
            });

        </script>
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
                        <li><a href="#sobre-nos">SOBRE NÓS</a></li>
                        <li><a href="CotacaoServlet">FAÇA SUA COTAÇÃO</a></li>
                        <li><a href="CadastrarUsuarioServlet">CADASTRAR</a></li>
                        <li><a href="LoginServlet">LOGIN</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div id="form-container" style="margin-top: 50px;">
            <h2 style="margin-bottom:50px;">Cadastre-se na DriveSecure Seguros</h2>
            <form id="login-form" action="CadastrarUsuarioServlet" method="POST">
                <div class="mb-3">
                    <label for="email" class="form-label">E-mail</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="senha" name="senha">
                </div>

                <button type="submit" class="btn btn-primary">Cadastrar</button>
            </form>
        </div>

    </div>

    <footer>
        <div class="container">
            <p>DRIVESAFE SEGUROS</p>
            <p>© 2024 Todos os direitos reservados</p>
        </div>
    </footer>

</body>
</html>
