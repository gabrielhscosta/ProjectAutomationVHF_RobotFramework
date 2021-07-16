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
${DESCNOVACONTA}                     NOVACONTA_HOSP


*** Test Case ***
Test Case 12.01: Transferir lançamentos para outra conta (Diárias, PDV, Etc.)
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Acessar a Operação de Caixa da Reserva
    Realizar Lançamento do Item de PDV na Conta
    Realizar Lançamento de Diária Antecipada
    Transferir Lançamentos para Outra Conta
    Sair da Tela de Operação de Caixa
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
    Mouse Click                     248    232
    Sleep                           1 seconds
    Mouse Click                     345    175
    Input Text                      ${IMAGE_NUMEROUHCG}     ${DADOS_RES.uh070101}
    Mouse Click                     1122   652
    Click Button                    ${BUTTON_PROCURAR}

Acessar a Operação de Caixa da Reserva
    Sleep                           1 seconds
    Move Mouse                      1015   145
    Mouse Click                     1015   170
    Click Button                    ${BUTTON_CAIXA}

Realizar Lançamento do Item de PDV na Conta
    Sleep                           25 seconds
    Attach Application By Name      VHFCaixa
    Attach Window                   ${SCREEN_VHFCAIXA}
    Sleep                           1 seconds
    Mouse Click                     102    222
    Screen Should Contain           ${IMAGE_SALDOCAIXA}
    Sleep                           2 seconds
    Click Button                    ${BUTTON_LANCAR}
    Mouse Click                     58     350
    Sleep                           4 seconds
    Mouse Click                     245    350
    Get Application Windows
    Attach Window                   ${SCREEN_LANCFRIGCAIXA}
    Window Title Should Contain     ${TITLE_LANCITENSPDV}
    Sleep                           2 seconds
    Move Mouse                      175    85
    Click                           ${IMAGE_LANCITEMP}
    Sleep                           2 seconds
    Click                           ${IMAGE_ITEMPDV}
    Sleep                           2 seconds
    Click                           ${IMAGE_QTDLANC1}
    Sleep                           2 seconds
    Click Button                    ${BUTTON_CONFIRMAR}
    Sleep                           4 seconds
    @{OPERCAIXALANC}                Get Application Windows
    Attach Window                   ${OPERCAIXALANC[0]}

Realizar Lançamento de Diária Antecipada
    Mouse Click                     148    350
    Sleep                           4 seconds
    Mouse Click                     246    433
    Sleep                           4 seconds
    Move Mouse                      1012   364
    Input Text                      ${IMAGE_VALORITEMCAIXA}    ${DADOS_RES.valordiar}
    Sleep                           2 seconds
    Click Button                    ${BUTTON_LANCAR}
    Sleep                           4 seconds
    Click Button                    ${BUTTON_VOLTAR}

Transferir Lançamentos para Outra Conta
    Sleep                           1 seconds
    @{OPERCAIXA}                    Get Application Windows
    Attach Window                   ${OPERCAIXA[0]}
    Screen Should Contain           ${IMAGE_LANCREST}
    Sleep                           1 seconds
    Click Text                      ${TEXT_RESTAURANTE}
    Sleep                           2 seconds
    # Mouse Click                     302    372
    Click Text                      ${TEXT_DIARIAANTEC}
    Sleep                           2 seconds
    Mouse Click                     1280   430
    Sleep                           1 seconds
    @{OPERCAIXANOVACONTA}           Get Application Windows
    Attach Window                   ${OPERCAIXANOVACONTA[0]}
    Window Title Should Contain     ${TITLE_NOVACONTA}
    Input Text                      ${IMAGE_DESIGNACAOCONTA}    ${DESCNOVACONTA}
    Sleep                           1 seconds
    Click Button                    ${BUTTON_CONFIRMAR}
    Sleep                           6 seconds
    @{OPERCAIXA}                    Get Application Windows
    Attach Window                   ${OPERCAIXA[0]}
    Mouse Click                     238    222

Sair da Tela de Operação de Caixa
    Sleep                           2 seconds
    Click Button                    ${BUTTON_SAIR}
    @{ATENCAOSAIRCAIXA}             Get Application Windows
    Attach Window                   ${ATENCAOSAIRCAIXA[0]}
    Click Button                    ${BUTTON_SIM}

Sair da Tela de Consulta Geral
    Sleep                           4 seconds
    Attach Application By Name      VHF
    Attach Window                   ${SCREEN_TELAPRINCIPAL}
    Sleep                           1 seconds
    @{CONSULTAGERAL}                Get Application Windows
    Attach Window                   ${CONSULTAGERAL[0]}
    Click Button                    ${BUTTON_SAIR}
