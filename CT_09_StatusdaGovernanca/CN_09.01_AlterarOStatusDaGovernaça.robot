*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
Resource        ../Resource/GuestData.robot
Resource        ../Resource/LoginDesktop.robot
Resource        ../Resource/ConferenceDesktop.robot
Library         WhiteLibrary
Documentation   Sikuli Library Demo
Library         SikuliLibrary       mode=NEW
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server
Test Setup      Add Needed Image Path
Test Teardown   Fechar Modulo


*** Variable ***


*** Test Case ***
Test Case 09.01: Alterar o Status da Governança da UH
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de status da governança
    Inserir parâmetros de busca da UH da reserva
    Conferir o status da UH

    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela de status da governança
    Set White Busy Timeout          10 seconds
    Click                           ${IMAGE_GOVERNANCA}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_STATUSGOV}

Inserir parâmetros de busca da UH da reserva
    Move Mouse                      73    113
    Click                           ${IMAGE_STATUSDAUH}
    Mouse Click                     60    208
    Sleep                           1 seconds
    Move Mouse                      287   197
    Mouse Click                     327   197
    Input Text                      ${IMAGE_TEXTUHGOV}      ${DADOS_RES.uh070110}
    Sleep                           1 seconds
    Mouse Click                     410   197
    Input Text                      ${IMAGE_TEXTUHGOV}      ${DADOS_RES.uh070110}
    Mouse Click                     548   418

### Conferência ###
Conferir o status da UH
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_UHOCUPADA}
    Click Button                    ${BUTTON_SAIR}
