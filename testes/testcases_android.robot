*** Settings ***
Documentation           Aqui se encontram todas as testcases para funcionamento do código

Resource                ../resources/hooks.robot
Resource                ../resources/package.robot

Test Setup              Abrir app
Test Teardown           Fechar app

*** Test Cases ***

Caso de Teste 01: Pesquisar canal “Prime Experts”
    [Tags]      Test1
    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "${BUSCA}"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito

Caso de Teste 02: Logar no YouTube
    [Tags]      Test2
    # Deslogar devido ao aparelho sempre logar na conta automaticamente quando abre o aplicativo
    Dado que o cliente não esteja logado em nenhuma conta
    E logar no aplicativo com a conta x
    E entrar no menu "Explorar"
    E usar swipe de tela até o 10 item da tela
    Então irá clicar no vídeo

Caso de Teste 03: Usar método Swipe na tela
    [Tags]      Test3
    E entrar no menu "Explorar"
    E usar swipe de tela até o 10 item da tela
    Então irá clicar no vídeo