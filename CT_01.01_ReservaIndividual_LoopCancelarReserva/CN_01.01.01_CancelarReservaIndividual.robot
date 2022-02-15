*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
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
Test Case 01.01.01: Cancelar Reserva Individual
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Looping Cancelamento de Reservas
    Sair da Tela de Consulta Geral
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                   ${IMAGE_DIR}

### Ações ###
Acessar a tela de Consulta Geral
    Click                           ${IMAGE_CONSULTAGERAL}
    @{CONSULTAGERAL}                Get Application Windows
    Attach Window                   ${CONSULTAGERAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_CONSULTAGERAL}

Preencher os campos necessários para buscar o resultado esperado
    Sleep                           2 seconds
    @{CONSULTAGERAL1}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL1[0]}
    Click                           ${IMAGE_STATUSCG}
    Mouse Click                     295    175
    Mouse Click                     248    218
    Sleep                           1 seconds
    Click Button                    ${BUTTON_PROCURAR}

Looping Cancelamento de Reservas
    [Documentation]                 Percorre de 0 até 21
    ${VAR}                          Set Variable      ${21}
    FOR                             ${CANCELARRES}    IN RANGE    ${VAR} + 1
      Cancelar Reservas             ${CANCELARRES}
    END

Cancelar Reservas
    [Arguments]                     ${CONTLOOPING}
    Log                             Contagem do looping ${CONTLOOPING}
    Sleep                           1 seconds
    Move Mouse                      1015   145
    Mouse Click                     1015   170
    Click Button                    ${BUTTON_CANCELAR}
    @{CONFIRMCANCELRES}             Get Application Windows
    Attach Window                   ${CONFIRMCANCELRES[0]}
    Click Button                    ${BUTTON_SIM}
    Sleep                           2 seconds
    @{CANCELAMENTORES}              Get Application Windows
    Attach Window                   ${CANCELAMENTORES[0]}
    Window Title Should Contain     ${TITLE_CANCELRES}
    Sleep                           1 seconds
    Mouse Move                      ${IMAGE_MOTIVOCANCELRES}
    Click                           ${IMAGE_MOTIVOCANCELRES}
    Sleep                           1 seconds
    Click                           ${IMAGE_CANCELCMNET}
    Sleep                           1 seconds
    Click Button                    ${BUTTON_CONFIRMAR}
    Sleep                           2 seconds
    @{CANCELAMENTOOK}               Get Application Windows
    Attach Window                   ${CANCELAMENTOOK[0]}
    Get Window Title
    Click Button                    ${BUTTON_OK}
    @{CONFIRMACAOCANC}              Get Application Windows
    Attach Window                   ${CONFIRMACAOCANC[0]}
    Get Window Title
    Click Button                    ${BUTTON_NAO}
    @{CONSULTAGERAL1}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL1[0]}

Sair da Tela de Consulta Geral
    Set White Busy Timeout          10 seconds
    Click Button                    ${BUTTON_SAIR}
