<%@ page import="model.usuario,model.Cotacao" %>
<%@ page session="true" %>
        
        <%

            usuario u = (usuario) session.getAttribute("usuarioLogado");
            if (u != null) {
                out.print(u.getEmail());
            }


        %>
<% Cotacao cotacao = (Cotacao) session.getAttribute("cotacao");%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gerenciamento de Perfil</title>
        <link rel="stylesheet" href="css/stylecss.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }

            .profile {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            #quotations {
                margin-top: 20px;
            }

            .quotation {
                margin-bottom: 10px;
            }

            .quotation span {
                font-weight: bold;
            }

            .quotation button {
                margin-left: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 8px 12px;
                cursor: pointer;
            }

            .quotation button:hover {
                background-color: #45a049;
            }

        </style>

    </head>
    <body>
        <header>
            <div>
                <img src="img/logo-drivesecure.png" alt="Logo" style="max-width: 200px; margin-left: 70px; margin-top: -25px; padding-top: 20px; text-align: center;">
                <nav>
                    <ul>
                        <li><a href="index.html">HOME</a></li>
                        <li><a href="#servico">SERVIÇOS</a></li>
                        <li><a href="#depoimento">DEPOIMENTOS</a></li>
                        <li><a href="#sobre-nos">SOBRE NÓS</a></li>
                        <li><a href="CotacaoServlet">FAÇA UMA NOVA COTAÇÃO</a></li>
                        <li><a href="LogoutServlet">SAIR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="profile">
            <h1>Bem-vindo, </h1>
            <div id="quotations">
                <div class="quotation">
                    
                    <form id="login-form" action="AtualizarCotacaoServlet" method="GET" accept-charset=utf-8>     
                        <input type="hidden"  name="email">
                        <button type="submit" class="btn btn-primary">EDITAR</button>
                        
                        
                    </form>
                    <button type="submit" class="btn btn-primary">APAGAR</button>

                    
                </div>
            </div>
        </div>

        <script>

            function editQuotation(id) {
                window.location.href = "AtualizarCotacaoServlet?id=" + id;
            }


            function deleteQuotation() {

                if (confirm("Tem certeza que deseja apagar esta cotação?")) {
                    window.location.href = "DeletarCotacaoServlet?id=" + id;
                }
            }
        </script>


        <script src="scripts.js"></script>
    </body>
</html>
