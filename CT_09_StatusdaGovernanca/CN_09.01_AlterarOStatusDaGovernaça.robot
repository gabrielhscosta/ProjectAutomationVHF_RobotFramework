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
Test Case 09.01: Alterar o Status de Governança da UH
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de status da governança
    Inserir parâmetros de busca da governança
    Realizar ação para alterar status da governança
    Verificar se a alteração do item acima foi gravada corretamente
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
    Window Title Should Contain     ${TITLE_STATUSDAGOV}

Inserir parâmetros de busca da governança
    Move Mouse                      73    113
    Click                           ${IMAGE_STATUSDAUH}
    Mouse Click                     60    224
    Sleep                           2 seconds
    Click                           ${IMAGE_STATUSDAGOV}
    Mouse Click                     165   253

Realizar ação para alterar status da governança
    Sleep                           2 seconds
    Click Button                    ${BUTTON_SELECTODASGOV}
    Sleep                           1 seconds
    Click Item                      ${BUTTON_LIMPOGOV}
    Sleep                           2 seconds

### Conferência ###
Verificar se a alteração do item acima foi gravada corretamente
    Click Button                    ${BUTTON_DESFPROCGOV}
    Sleep                           1 seconds
    Move Mouse                      73    113
    Click                           ${IMAGE_STATUSDAUH}
    Mouse Click                     60    224
    Sleep                           2 seconds
    Click                           ${IMAGE_STATUSDAGOV}
    Mouse Click                     165   253
    Sleep                           1 seconds
    Wait For Image                  ${IMAGE_SELEC0GOV}  ${IMAGE_NOTWATENDGOV}  2
    Sleep                           1 seconds
    Click Button                    ${BUTTON_SAIR}
