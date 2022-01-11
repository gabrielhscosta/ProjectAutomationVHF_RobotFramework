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


*** Variable ***


*** Test Case ***
Test Case 12.01.01: Encerramento de Contas Sem Saldo(Check-Out)
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Looping Encerramento de Contas
    Sair da Tela de Consulta Geral
    Conferir se a tela principal do modulo VHF foi exibida
    Fechar Modulo
    Encerramento Automatico VHFCaixa


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
    Mouse Click                     248    232
    Sleep                           1 seconds
    Click Button                    ${BUTTON_PROCURAR}

Looping Encerramento de Contas
    [Documentation]                 Percorre de 0 até 1
    ${VAR}                          Set Variable      ${1}
    FOR                             ${ENCERCONTAS}    IN RANGE    ${VAR} + 1
      Realizar o Encerramento de Conta                ${ENCERCONTAS}
    END

Realizar o Encerramento de Conta
    [Arguments]                     ${CONTLOOPING}
    Log                             Contagem do Looping ${CONTLOOPING}
    Sleep                           1 seconds
    Move Mouse                      1015   145
    Mouse Click                     1015   170
    Click Button                    ${BUTTON_CAIXA}
    Sleep                           25 seconds
    Attach Application By Name      VHFCaixa
    Attach Window                   ${SCREEN_VHFCAIXA}
    Screen Should Contain           ${IMAGE_SALDOCAIXA}
    Click Button                    ${BUTTON_ENCERCONTAS}
    @{ATENCAOCONFIRCHECKOUT}        Get Application Windows
    Attach Window                   ${ATENCAOCONFIRCHECKOUT[0]}
    Click Button                    ${BUTTON_SIM}
    Sleep                           2 seconds
    @{CONFIRSAIDAHOSP}              Get Application Windows
    Attach Window                   ${CONFIRSAIDAHOSP[0]}
    Click Button                    ${BUTTON_SIM}
    Sleep                           3 seconds
    @{INFOPROCESSFINAL}             Get Application Windows
    Attach Window                   ${INFOPROCESSFINAL[0]}
    Click Button                    ${BUTTON_OK}
    Sleep                           2 seconds
    Attach Application By Name      VHF
    Attach Window                   ${SCREEN_TELAPRINCIPAL}
    Maximize Window
    Sleep                           1 seconds
    @{CONSULTAGERAL}                Get Application Windows
    Attach Window                   ${CONSULTAGERAL[0]}
    Sleep                           1 seconds

Sair da Tela de Consulta Geral
    Sleep                           2 seconds
    Click Button                    ${BUTTON_SAIR}

Fechar Modulo
    Sleep                           4 seconds
    WhiteLibrary.Close Application

Encerramento Automatico VHFCaixa
    @{ENCAUTOMATICOCAIXA}           Get Application Windows
    Attach Window                   ${ENCAUTOMATICOCAIXA[0]}
    Window Title Should Contain     Encerramento Automático
    Sleep                           1 seconds
    Click Button                    ${BUTTON_SIM}
