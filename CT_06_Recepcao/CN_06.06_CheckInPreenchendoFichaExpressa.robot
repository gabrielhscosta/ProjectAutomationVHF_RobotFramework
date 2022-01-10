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
# Test Teardown   Fechar Modulo


*** Variable ***


*** Test Case ***
Test Case 06.06: Check-In Preenchendo Ficha Expressa
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Realizar Check-In da Reserva
    Cadastrar informações do hóspede
    Conferir se a tela de conclusão da reserva foi exibida
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

Realizar Check-In da Reserva
    Sleep                           1 seconds
    Move Mouse                      1015   145
    Mouse Click                     1015   170
    Click Button                    ${BUTTON_CHECKIN}
    Sleep                           3 seconds
    @{CHECKINRES}                   Get Application Windows
    Attach Window                   ${CHECKINRES[0]}
    Sleep                           1 seconds
    Window Title Should Contain     ${TITLE_CHECKIN}
    Sleep                           1 seconds
    Move Mouse                      241    181
    Sleep                           1 seconds
    Mouse Click                     1145   690
    @{ATENCAOFNRHHOSP}              Get Application Windows
    Attach Window                   ${ATENCAOFNRHHOSP[0]}
    Click Button                    ${BUTTON_SIM}

Cadastrar informações do hóspede
    Sleep                           6 seconds
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Maximize Window                 ${SCREEN_TELAFNRH}
    Get Window Title
    Sleep                           4 seconds
    Click Button                    ${BUTTON_EDITAR}
    Screen Should Contain           ${IMAGE_FEMININO}
    Mouse Move                      ${IMAGE_FEMININO}
    Mouse Click                     476    148
    Get White Busy Timeout
    Mouse Click                     260    205
    Input Text                      ${IMAGE_NUMERODOC}  ${HOSP_RECEP_0606.cpf}
    Mouse Click                     58     260
    Input Text                      ${IMAGE_CEP}        ${HOSP_RECEP_0606.cep}
    Move Mouse                      348    258
    Sleep                           1 seconds
    Input Text                      ${IMAGE_NUMEROEND}  ${HOSP_RECEP_0606.numend}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_ULTIMAPROC}
    Mouse Click                     460   422
    @{ULTPROC}                      Get Application Windows
    Attach Window                   ${ULTPROC[0]}
    Sleep                           2 seconds
    Move Mouse                      690   360
    Sleep                           1 seconds
    Click                           ${IMAGE_CONFIRMAR}
    Set White Busy Timeout          10 seconds
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_PROXIMAPROC}
    Sleep                           3 seconds
    Mouse Click                     858   422
    @{PROXDEST}                     Get Application Windows
    Attach Window                   ${PROXDEST[0]}
    Get White Busy Timeout
    Move Mouse                      540   252
    Sleep                           1 seconds
    Click                           ${IMAGE_CONFIRMAR}
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_MOTIVOVIAGEM}
    Sleep                           1 seconds
    Mouse Click                     48     458
    Mouse Move                      ${IMAGE_MEIOTRANSPOR}
    Sleep                           1 seconds
    Mouse Click                     505    459
    Click Button                    ${BUTTON_CONFIRMAR}
    Click Button                    ${BUTTON_SAIR}

Conferir se a tela de conclusão da reserva foi exibida
    Sleep                           3 seconds
    @{CARTAOCONS}                   Get Application Windows
    Attach Window                   ${CARTAOCONS[0]}
    Click Button                    ${BUTTON_NAO}
    Sleep                           2 seconds
    @{CHECKINRES}                   Get Application Windows
    Attach Window                   ${CHECKINRES[1]}
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           1 seconds
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}

Sair da Tela de Consulta Geral
    Set White Busy Timeout          10 seconds
    Click Button                    ${BUTTON_SAIR}
