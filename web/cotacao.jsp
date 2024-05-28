<%@page import="java.util.ArrayList"%>
<%@page import="dao.CotacaoDAO"%>
<%@page import="model.usuario"%>
<%@page import="model.Cotacao"%>
        
        <%

            usuario u = (usuario) session.getAttribute("usuarioLogado");
            if (u != null) {
                out.print(u.getEmail());
            }


        %>
<% Cotacao cotacao = (Cotacao) session.getAttribute("cotacao");%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Faça sua Cotação</title>
        <link rel="stylesheet" href="css/stylecss.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>    
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1, h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .input-field {
                margin-bottom: 20px;
            }

            .input-field label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .input-field input, .input-field select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .button {
                display: block;
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: #fff;
                font-size: 18px;
                cursor: pointer;
            }

            .button:hover {
                background-color: #0056b3;
            }

            .vehicle-option {
                margin-bottom: 20px;
            }

            .option-title {
                font-weight: bold;
            }

            .options {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }

            .option {
                width: 45%;
            }

            .vehicle-link {
                text-decoration: none;
                color: #333;
                display: block;
                padding: 10px;
                border-radius: 5px;
                border: 2px solid transparent;
                transition: all 0.3s ease;
            }

            .vehicle-link:hover {
                background-color: #f0f0f0;
            }

            .vehicle-link.selected {
                border-color: #007bff;
            }

            button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #007bff;
                color: #fff;
            }

            #submit-button {
                background-color: #28a745; /* Cor verde */
            }

            #back-button {
                background-color: #dc3545; /* Cor vermelha */
            }
            
            input.none{
                display: none;
            }
        </style>
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
                        <li><a href="AtualizarUsuarioServlet">PERFIL</a></li>
                        <li><a href="LogoutServlet">SAIR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <form id="parte1" class="container" action="CotacaoServlet" method="POST" accept-charset=utf-8>
            <h1>Insira os dados do veículo</h1>

            <!-- QUAL O SEU VEÍCULO -->
            <div class="vehicle-option">
                <p class="option-title">Qual o seu veículo</p>
                <div class="options">
                    <div class="option">

                        <label for="vehicle-link-moto">
                            <input type="radio" value="moto" id="vehicle-link-moto" class="none" name="veiculo"  />
                            <a href="#"class="vehicle-link" data-type="moto">
                                <svg xmlns="http://www.w3.org/2000/svg" width="52" height="30" viewBox="0 0 52 30" fill="none">
                                <path d="M30.2043 20.7234H23.3363C23.1422 20.7234 22.9819 20.563 22.9819 20.369V15.4965C22.9819 15.3024 23.1422 15.1421 23.3363 15.1421H32.3811C32.6215 15.1421 32.7819 15.3868 32.6848 15.6104L30.5291 20.5124C30.4743 20.6432 30.3477 20.7234 30.2043 20.7234Z" fill="#6EAD2E"/>
                                <path d="M22.3573 13.9138H18.3791C14.6625 13.9138 11.6504 10.9017 11.6504 7.18506L22.3573 8.54769V13.918V13.9138Z" fill="#133D31"/>
                                <path d="M25.6603 5.80568L4.84126 3.55292C4.65985 3.53182 4.52908 3.71744 4.60501 3.88197L5.35593 5.4935C5.38546 5.561 5.44875 5.6074 5.52468 5.62427L22.0955 8.06265" fill="#6EAD2E"/>
                                <path d="M39.9069 8.83864L40.5313 8.60662C40.7338 8.53068 40.8646 8.3324 40.8519 8.11725L40.641 4.48499C40.6325 4.34578 40.565 4.21922 40.4596 4.13063L37.9199 2.06771C37.8103 1.97912 37.671 1.94115 37.5318 1.96224L36.0933 2.36723L39.2783 8.59396C39.3965 8.82599 39.6665 8.93145 39.9111 8.83864" fill="#6EAD2E"/>
                                <path d="M34.6759 3.28735L30.82 3.83577C29.2676 4.14373 27.791 4.75543 26.4748 5.63713L22.8932 8.04176C22.5599 8.26535 22.3574 8.64081 22.3574 9.0458V13.3826C22.3574 13.5598 22.5009 13.7032 22.678 13.7032H32.1658C32.478 13.7032 32.7775 13.5808 33.0011 13.3657L37.5403 8.88549C37.92 8.51847 38.0213 7.94474 37.7808 7.47225L35.9837 3.92436C35.739 3.44344 35.2032 3.18188 34.6717 3.28735" fill="#6EAD2E"/>
                                <path d="M34.5743 4.46411L30.2966 5.31205C28.7441 5.62001 27.2676 6.23172 25.9514 7.11342L22.3698 9.51805C22.0365 9.74164 21.834 10.1171 21.834 10.5221V15.1795H31.6423C31.9545 15.1795 32.2541 15.0571 32.4776 14.842L37.4388 10.0623C37.8184 9.69523 37.9197 9.12149 37.6792 8.64901L35.8821 5.10112C35.6374 4.62019 35.1016 4.35864 34.5701 4.46411H34.5743Z" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M29.0563 20.7561H22.1884C21.9943 20.7561 21.834 20.5958 21.834 20.4017V15.5292C21.834 15.3351 21.9943 15.1748 22.1884 15.1748H31.7436L29.3811 20.5409C29.3263 20.6717 29.1998 20.7519 29.0563 20.7519V20.7561Z" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M29.6431 1.86557L30.3771 1.21169C30.5543 1.05138 30.7905 0.979659 31.0268 1.00497L34.06 1.35934C34.3469 1.39309 34.5958 1.57449 34.6337 1.65464L43.649 21.0056" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M25.171 6.71241L4.352 4.45965C4.1706 4.43856 4.03982 4.62418 4.11576 4.78871L4.86667 6.40023C4.8962 6.46773 4.95949 6.51414 5.03542 6.53101L21.6063 8.96939" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M4.58412 6.63696L1.54248 9.80938" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M21.8383 15.1797H17.8601C14.1435 15.1797 11.1313 12.1676 11.1313 8.45093L21.8383 9.81356V15.1797Z" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M35.2451 2.54496L36.6837 2.13998C36.8229 2.11888 36.9621 2.15685 37.0718 2.24544L39.6114 4.30836C39.7211 4.39695 39.7844 4.52351 39.7928 4.66273L40.0038 8.29498C40.0164 8.51014 39.8856 8.71263 39.6831 8.78857L38.6327 9.1809" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M39.502 8.85179L41.3919 8.22321C42.2525 7.93634 43.1848 7.96587 44.0286 8.30336L48.4455 10.0794" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M21.5724 16.7744L10.3593 20.6303C9.74757 20.8412 9.42273 21.5035 9.63366 22.1152C9.84459 22.7269 10.5069 23.0518 11.1186 22.8408L21.7538 19.1833" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M13.2069 19.3015C12.4012 18.3354 11.1862 17.7195 9.82779 17.7195C7.39785 17.7195 5.42773 19.6896 5.42773 22.1195C5.42773 24.5495 7.39785 26.5196 9.82779 26.5196C12.2577 26.5196 14.2278 24.5495 14.2278 22.1195" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M15.7804 18.6688C14.5907 16.6185 12.3675 15.239 9.82788 15.239C6.0311 15.239 2.94727 18.3186 2.94727 22.1196C2.94727 25.9206 6.02688 29.0002 9.82788 29.0002C13.6289 29.0002 16.7085 25.9206 16.7085 22.1196C16.7085 21.8032 16.6874 21.4911 16.6452 21.1831" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M43.6446 25.8109C46.296 25.8109 48.4454 23.6615 48.4454 21.0101C48.4454 18.3586 46.296 16.2092 43.6446 16.2092C40.9932 16.2092 38.8438 18.3586 38.8438 21.0101C38.8438 23.6615 40.9932 25.8109 43.6446 25.8109Z" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M43.6442 28.4896C47.7751 28.4896 51.1239 25.1408 51.1239 21.0099C51.1239 16.879 47.7751 13.5303 43.6442 13.5303C39.5133 13.5303 36.1646 16.879 36.1646 21.0099C36.1646 25.1408 39.5133 28.4896 43.6442 28.4896Z" stroke="#133B2F" stroke-width="1.52" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                Moto
                            </a></label>
                    </div>
                    <div class="option">

                        <label for="vehicle-link-carro">
                            <input type="radio" value="carro" id="vehicle-link-carro" class="none" name="veiculo"  />
                            <a href="#" class="vehicle-link" data-type="carro">

                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="28" viewBox="0 0 50 28" fill="none">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M10.0844 13.0411C12.3683 13.0411 14.3581 14.4363 15.4064 16.4964H33.5064C34.5548 14.4363 36.5445 13.0411 38.8284 13.0411C41.1123 13.0411 43.102 14.4363 44.1504 16.4964H48.8786V16.3896C48.8786 13.1836 46.1561 10.3398 43.5246 9.59773C42.6153 9.34244 40.6577 8.78437 40.1335 8.68938C39.1065 8.50533 38.684 8.12537 37.5768 7.16359C33.2283 3.37583 28.5856 0.448922 22.2741 0.110518C14.3688 -0.311004 7.70962 0.199571 2.46789 6.58177C1.12002 8.2263 0.745605 9.90051 0.745605 11.3966C0.745605 13.0946 0.745605 14.7985 0.745605 16.5024H4.76784C5.81618 14.4423 7.8059 13.0471 10.0898 13.0471" fill="#6EAD2E"/>
                                <path d="M10.0846 16.4907C12.7055 16.4907 14.8343 18.8536 14.8343 21.7627C14.8343 24.6718 12.7055 27.0347 10.0846 27.0347C7.46374 27.0347 5.33496 24.6718 5.33496 21.7627C5.33496 18.8536 7.46374 16.4907 10.0846 16.4907Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M18.1451 4.86597C16.4817 4.86597 14.4973 4.99064 12.5343 5.64964C10.6248 6.28489 7.87026 7.87599 7.17493 10.0667C6.90215 10.9157 7.45841 11.9309 8.39444 11.9309H18.2307C18.5249 11.9309 18.8779 11.7528 19.1132 11.456C19.3058 11.2244 19.4342 10.886 19.4342 10.5595V6.28489C19.4342 5.53684 18.8619 4.86597 18.1558 4.86597H18.1451Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M15.9359 23.7572C16.1124 23.1279 16.2034 22.4571 16.2034 21.7624C16.2034 18.0162 13.4648 14.9765 10.0898 14.9765C6.71476 14.9765 3.97622 18.0162 3.97622 21.7624C3.97622 22.3621 4.04576 22.9498 4.17947 23.502C2.29673 22.9676 0.745605 21.6021 0.745605 18.8949C0.745605 17.0366 0.745605 15.1784 0.745605 13.3261C0.745605 11.83 1.12002 10.1557 2.46789 8.51121C7.70962 2.12901 14.3688 1.61844 22.2741 2.03996C28.5856 2.37837 33.2337 5.30527 37.5768 9.09303C38.684 10.0548 39.1119 10.4348 40.1335 10.6188C40.6577 10.7138 42.6153 11.2659 43.5246 11.5212C46.1561 12.2633 48.8786 15.1071 48.8786 18.319V20.2426C48.8786 22.184 47.4666 23.7513 45.7175 23.7513H44.6799C44.851 23.122 44.9473 22.4571 44.9473 21.7624C44.9473 18.0162 42.2088 14.9765 38.8338 14.9765C35.4587 14.9765 32.7202 18.0162 32.7202 21.7624C32.7202 22.4571 32.8164 23.122 32.9876 23.7572H15.9413H15.9359Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M23.2314 4.86604C26.7241 4.83042 31.645 6.65306 33.8058 9.59184C33.977 9.82338 34.0679 10.0846 34.0947 10.3399C34.1802 11.1414 33.624 11.9191 32.8217 11.9251H23.1512C22.857 11.9251 22.504 11.7469 22.2687 11.4501C22.0761 11.2186 21.9478 10.8802 21.9478 10.5536V6.27903C21.9478 5.53098 22.4773 4.87198 23.2261 4.86011L23.2314 4.86604Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M10.0846 24.1849C11.2898 24.1849 12.2669 23.1004 12.2669 21.7626C12.2669 20.4248 11.2898 19.3403 10.0846 19.3403C8.87937 19.3403 7.90234 20.4248 7.90234 21.7626C7.90234 23.1004 8.87937 24.1849 10.0846 24.1849Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M38.8283 24.1849C40.0335 24.1849 41.0105 23.1004 41.0105 21.7626C41.0105 20.4248 40.0335 19.3403 38.8283 19.3403C37.623 19.3403 36.646 20.4248 36.646 21.7626C36.646 23.1004 37.623 24.1849 38.8283 24.1849Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M38.8283 16.4907C41.4491 16.4907 43.5779 18.8536 43.5779 21.7627C43.5779 24.6718 41.4491 27.0347 38.8283 27.0347C36.2074 27.0347 34.0786 24.6718 34.0786 21.7627C34.0786 18.8536 36.2074 16.4907 38.8283 16.4907Z" stroke="#133B2F" stroke-width="1.24" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                Carro
                            </a></label>
                    </div>
                </div>
            </div>

            <!-- PLACA -->
            <div class="input-field">
                <label for="placa-veiculo">Placa</label>
                <input id="placa-veiculo" type="text" placeholder="AAA-1234" maxlength="7" name="placa">
            </div>

            <!-- NA FACULDADE -->
            <div class="input-field">
                <label for="na-faculdade-colegio">Na faculdade / colégio, veículo é guardado em estacionamento?</label>
                <select id="na-faculdade-colegio" name="na_faculdade">
                    <option value="">Selecione</option>
                    <option value="nao-utilizo">Não utilizo para ir pra faculdade/colégio</option>
                    <option value="utilizo-estacionamento">Utilizo e guardo em estacionamento</option>
                    <option value="utilizo-nao-estacionamento">Utilizo, mas não guardo em estacionamento</option>
                </select>
            </div>

            <!-- NO TRABALHO -->
            <div class="input-field">
                <label for="no-trabalho">No trabalho, veículo é guardado em estacionamento?</label>
                <select id="no-trabalho" name="no_trabalho">
                    <option value="">Selecione</option>
                    <option value="nao-utilizo">Não utilizo para ir trabalhar</option>
                    <option value="utilizo-estacionamento">Utilizo e guardo em estacionamento/garagem</option>
                    <option value="utilizo-nao-estacionamento">Utilizo, mas não guardo em estacionamento/garagem</option>
                </select>
            </div>


            <!-- TIPO DE CONTRATAÇÃO -->
            <div class="input-field">
                <label for="tipo-contratacao">Tipo de contratação</label>
                <select id="tipo-contratacao" name="tipo_contratacao">
                    <option value="">Selecione</option>
                    <option value="novo">Novo</option>
                    <option value="renovacao-outra-seguradora">Renovação outra seguradora</option>
                    <option value="renovacao-suhai">Renovação Suhai</option>
                </select>
            </div>
            
             <!-- DADOS PESSOAIS -->
            <h2>Para finalizar, insira seus dados pessoais</h2>
            <div class="input-field">
                <label for="nome">Nome completo</label>
                <input id="nome" type="text" placeholder="Seu nome" name="nome_completo">
            </div>

            <div class="input-field">
                <label for="email">E-mail</label>
                <input id="email" type="email" placeholder="Seu e-mail" name="email">
            </div>

            <div class="input-field">
                <label for="cpf">CPF</label>
                <input id="cpf" type="text" placeholder="___.___.___-__" name="cpf">
            </div>

            <div class="input-field">
                <label for="celular">Celular</label>
                <input id="celular" type="text" placeholder="(__) _____-____" name="celular">
            </div>

            <div class="input-field">
                <label for="data_de_nascimento">Data de nascimento</label>
                <input id="data_de_nascimento" type="date" name="data_nascimento">
            </div>

            <div class="input-field">
                <label for="genero">Gênero</label>
                <select id="genero" name="genero">
                    <option value="">Selecione</option>
                    <option value="masculino">Masculino</option>
                    <option value="feminino">Feminino</option>
                    <option value="outro">Outro</option>
                </select>
            </div>

            <div class="input-field">
                <label for="estado_civil">Estado Civil</label>
                <select id="estado_civil" name="estado_civil">
                    <option value="">Selecione</option>
                    <option value="solteiro">Solteiro(a)</option>
                    <option value="casado">Casado(a)</option>
                    <option value="divorciado">Divorciado(a)</option>
                    <option value="viuvo">Viúvo(a)</option>
                </select>
            </div>

            <!-- Botão de enviar -->
            <button id="submit-button"type="submit">Enviar</button>  
            
        </form>
        
     
        

        <script>
            
            $(window).on('load', function () {

                console.log('teste teste');

                $('.vehicle-link').on('click', function () {

                $('.vehicle-link.selected').removeClass('selected');
                
                $(this).addClass('selected');
                
                $(this).prev().click();


                });




            });
        </script>

        <script src="script.js"></script>
    </body>
</html>
