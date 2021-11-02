*** Settings ***
Documentation       Neste arquivo estão armazenados as keywords

*** Variables ***

${BUSCA}        Prime Experts

*** Keywords ***

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible       id=youtube_logo
    Element Attribute Should Match      xpath=//android.widget.Button[@content-desc="Home"]/android.widget.ImageView        selected       true

E pesquise um vídeo sobre "${BUSCA}"
    Wait Until Element Is Visible       accessibility_id=Search
    Click Element                       accessibility_id=Search
    Wait Until Element Is Visible       id=search_edit_text
    Input Text                          id=search_edit_text      ${BUSCA}
    Press Keycode                       66

E acessar o canal da Prime
    # Imperfeito devido ao xpath buscar pelo número de visualizações, que eventualmente mudam
    Wait Until Element Is Visible       accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutes, 38 seconds - Go to channel - Prime Control - 240 views - 1 year ago - play video
    Click Element                       xpath=//android.view.ViewGroup[@content-desc="Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutes, 38 seconds - Go to channel - Prime Control - 240 views - 1 year ago - play video"]/child::*[@content-desc='Go to channel']

Quando clicar em Inscrever-se
    Wait Until Element Is Visible       accessibility_id=Subscribe to Prime Control.
    Click Element                       accessibility_id=Subscribe to Prime Control.

Então será apresentado como Inscrito
    Wait Until Element Is Visible       accessibility_id=Unsubscribe from Prime Control.

Dado que o cliente não esteja logado em nenhuma conta
    Wait Until Element Is Visible       //android.widget.ImageView[@content-desc="Account"]
    Click Element                       //android.widget.ImageView[@content-desc="Account"]
    Wait Until Element Is Visible       id=com.google.android.youtube:id/account_name
    Click Element                       id=com.google.android.youtube:id/account_name
    Wait Until Element Is Visible       id=com.google.android.youtube:id/sign_out_footer
    Click Element                       id=com.google.android.youtube:id/sign_out_footer

E logar no aplicativo com a conta x
    Wait Until Element Is Visible       accessibility_id=Account
    Click Element                       accessibility_id=Account
    Wait Until Element Is Visible       id=com.google.android.youtube:id/button
    Click Element                       id=com.google.android.youtube:id/button
    Wait Until Element Is Visible       id=com.google.android.youtube:id/account_list
    Click Element                       xpath=//android.widget.LinearLayout[@content-desc=@*]

E entrar no menu "Explorar"
    Sleep                               2
    Wait Until Element Is Visible       accessibility_id=Explore
    Click Element                       accessibility_id=Explore

E usar swipe de tela até o 10 item da tela
    Wait Until Element Is Visible       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup
    FOR     ${I}    IN RANGE    5
        SLEEP   1
        SWIPE                   500     1600    500     200     1000
    END

Então irá clicar no vídeo
    Click Element           xpath=//android.view.ViewGroup[2]
    SLEEP                   3  