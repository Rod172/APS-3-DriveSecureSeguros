<%@page import="dao.CotacaoDAO"%>
<%@page import="model.Cotacao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.usuario"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DriveSecure Seguros</title>
        <link rel="stylesheet" href="css/stylecss.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>

            // Fun��o para rolar a p�gina at� o topo
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

    <body style="background-color: #f5f5f5;">
        <%

            usuario u = (usuario) session.getAttribute("usuarioLogado");
            if (u != null) {
                out.print(u.getEmail());
            }


        %>
        
        <header>
            <div>
                <img src="img/logo-drivesecure.png" alt="Logo" style="max-width: 200px;margin-left: 70px;margin-top: -25px;padding-top: 20px;text-align: center;">
                <nav>
                    <ul>
                        <li><a href="#home">HOME</a></li>
                        <li><a href="#servico">SERVI�OS</a></li>
                        <li><a href="#depoimento">DEPOIMENTOS</a></li>
                        <li><a href="#sobre-nos">SOBRE N�S</a></li>
                        <li><a href="CotacaoServlet">FA�A SUA COTA��O</a></li>
                        <li><a href="AtualizarUsuarioServlet">PERFIL</a></li>
                        <li><a href="LogoutServlet">SAIR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section id="home" class="hero" style="background-color: #f5f5f5; padding: 50px 0;">
            <div class="container">
                <div class="row">
                    <div class="col" style="background-color: #fff; border-radius: 10px; padding: 30px;">
                        <h1>Proteja seu Caminho com DriveSecure Seguro Automotivo para uma Jornada Sem Preocupa��es</h1>
                        <p>"Bem-vindo � DriveSecure Seguros, onde sua tranquilidade ao volante � nossa prioridade n�mero um. Nosso compromisso � oferecer seguran�a e prote��o para voc� e seu ve�culo, para que cada viagem seja uma experi�ncia sem estresse. Com uma ampla gama de op��es de cobertura e um servi�o ao cliente excepcional, estamos aqui para garantir que voc� possa dirigir com confian�a, sabendo que estamos ao seu lado em qualquer estrada. Descubra como podemos cuidar do seu caminho hoje mesmo."</p>
                        <a href="CotacaoServlet" class="btn-faca-sua-cotacao">Fa�a sua cota��o</a>
                    </div>
                    <div class="col">
                        <img src="img/43055-new.png" alt="Carro" style="border-radius: 10px;">
                    </div>
                </div>
            </div>
        </section>


        <section id="servico" class="servico" style="background-color: #f5f5f5; padding: 50px 0;">
            <div class="container" style="background-color: #fff; border-radius: 10px; padding: 30px;">
                <div class="row">
                    <div class="col">
                        <h2>SERVI�OS</h2>
                        <p>Bem-vindo � DriveSecure Seguros, onde sua tranquilidade na estrada � nossa prioridade n�mero um. Com uma equipe dedicada e uma ampla gama de servi�os especializados, estamos aqui para oferecer a prote��o e o suporte que voc� precisa para enfrentar qualquer desafio nas suas viagens. Abaixo, apresentamos os nossos "Top 10 Servi�os", projetados para garantir sua seguran�a e tranquilidade em todas as situa��es. Confira e descubra como podemos ajudar a proteger o seu ve�culo e garantir sua paz de esp�rito em cada jornada.</p>
                    </div>
                    <div class="col">
                        <img src="img/Car_.png" alt="Servi�os" style="border-radius: 10px;">
                    </div>
                </div>
            </div>
        </section>

        <div class="container">
            <h2 id="depoimento" style="text-align: center; margin-top: 30px;">DEPOIMENTOS</h2>
            <br>
            <div class="row">
                <div class="col">
                    <div class="card">
                        <img class="user" src="img/budah.jpg" alt="">
                        <h3>Ana Carolina S., Cliente Satisfeita.</h3>
                        <div class="stars">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                        </div>
                        <p>Sempre confiei na DriveSecure Seguros para proteger meu ve�culo e nunca me decepcionaram. O atendimento � excepcional, e as op��es de cobertura s�o abrangentes, garantindo minha tranquilidade em cada viagem.</p>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img class="user" src="img/tue.jpg" alt="">
                        <h3>Carlos Mendon�a, Cliente Satisfeito.</h3>
                        <div class="stars">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                        </div>
                        <p>Eu estava preocupado com a seguran�a do meu carro em uma �rea de alto �ndice de roubo, mas a DriveSecure Seguros me ofereceu uma cobertura completa e me fez sentir seguro novamente. O suporte 24 horas tamb�m � um diferencial incr�vel!</p>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img class="user" src="img/vino.jpg" alt="">
                        <h3>Jo�o Silva, Cliente Satisfeito.</h3>
                        <div class="stars">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                            <img class="star" src="img/star.svg" alt="">
                        </div>
                        <p>Depois de um acidente, fiquei impressionado com a rapidez e efici�ncia com que a DriveSecure Seguros cuidou de tudo. Desde o reboque at� o processo de reivindica��o, sua equipe foi incrivelmente prestativa e profissional. Recomendo totalmente!</p>
                    </div> 
                </div>

            </div>
        </div>


        <div class="sobre-nos" id="sobre-nos" style="background-color: #f5f5f5;">
            <h2>SOBRE NOS</h2>
            <p>Bem-vindo � DriveSecure Seguros, onde a nossa miss�o � oferecer tranquilidade e prote��o aos motoristas em suas jornadas pelas estradas. Com um compromisso inabal�vel com a seguran�a e a confian�a, nos dedicamos a fornecer solu��es de seguros de carro que atendam �s necessidades individuais de cada cliente.</p>
            <p>Na DriveSecure, compreendemos que cada ve�culo tem sua pr�pria hist�ria e seu pr�prio valor para seu propriet�rio. � por isso que oferecemos uma ampla gama de op��es de cobertura para garantir que cada cliente possa encontrar o plano perfeito para proteger seu precioso ve�culo. Desde coberturas b�sicas at� pacotes abrangentes, estamos aqui para garantir que voc� possa viajar com tranquilidade, sabendo que est� protegido.</p>
            <p>Nossa equipe � composta por profissionais experientes e apaixonados pelo que fazem. Estamos sempre prontos para ajudar e orientar nossos clientes em todas as etapas do processo de seguros, desde a escolha do plano ideal at� o suporte em caso de sinistro.</p>
            <p>Na DriveSecure, n�o apenas protegemos carros, mas tamb�m constru�mos relacionamentos s�lidos com nossos clientes, baseados em confian�a e integridade. Estamos comprometidos em ser a sua escolha n�mero um quando se trata de seguran�a veicular.</p>
            <p>Junte-se a n�s na DriveSecure Seguros e experimente uma nova dimens�o de tranquilidade na estrada. Sua seguran�a � a nossa prioridade n�mero um.</p>
        </div>



        <!-- Restante do conte�do... -->

        <footer>
            <div class="container">
                <p>DRIVESAFE SEGUROS</p>
                <p>� 2024 Todos os direitos reservados</p>
            </div>
        </footer>

        <button id="btn-voltar-topo" onclick="voltarAoTopo()">Voltar ao Topo</button>

        <script src="js/script.js"></script>
    </body>
</html>
