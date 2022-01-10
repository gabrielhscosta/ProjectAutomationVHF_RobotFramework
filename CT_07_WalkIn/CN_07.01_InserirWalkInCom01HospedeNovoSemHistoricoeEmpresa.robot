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


*** Variable ***
# ${IMAGE_DIR}        ${CURDIR}\\Img


*** Test Case ***
Test Case 07.01: Inserir um Walk-in com 01 Hospede novo sem histórico e Empresa (Validar FRNH)
    [Tags]  TS
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de reserva WalkIn
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede novo sem histórico estada
    Preencher informações e confirmar a reserva
    Cadastrar informações do hóspede
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela de reserva WalkIn
    Click                           ${IMAGE_WALKIN}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_WALKIN}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Double Click                    ${IMAGE_NOITES}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Mouse Click                     587    276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708    237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Mouse Click                     756    279
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           1 seconds
    Mouse Move                      ${IMAGE_DESCUH}
    Input Text                      ${IMAGE_TEXT}       ${DADOS_RES.uh070101}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Inserir hóspede novo sem histórico estada
    Mouse Click                     741    341
    Sleep                           3 seconds
    Move Mouse                      208    331
    Input Text                      ${IMAGE_SOBRENOME}  ${DADOSHOSPNOVO_WALKIN.sobrenome}
    Move Mouse                      323    331
    Input Text                      ${IMAGE_NOME}       ${DADOSHOSPNOVO_WALKIN.nome}
    Sleep                           1 seconds
    Move Mouse                      434    331
    Input Text                      ${IMAGE_EMAIL}      ${DADOSHOSPNOVO_WALKIN.email}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Sleep                           2 seconds
    Mouse Click                     47     471
    Sleep                           2 seconds
    Mouse Click                     325    369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2s
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPNOVO_WALKIN.cidade}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_WALKIN.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPNOVO_WALKIN.datanasc}
    Mouse Click                     741    341
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Preencher informações e confirmar a reserva
    Mouse Click                     87     508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_WALKIN.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPNOVO_WALKIN.email}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

Cadastrar informações do hóspede
    Set White Busy Timeout          10 seconds
    @{ATENCAO}                      Get Application Windows
    Attach Window                   ${ATENCAO[0]}
    Click Button                    ${BUTTON_OK}
    Sleep                           2 seconds
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Maximize Window                 ${SCREEN_TELAFNRH}
    Get Window Title
    Sleep                           1 seconds
    Screen Should Contain           ${IMAGE_FEMININO}
    Mouse Move                      ${IMAGE_FEMININO}
    Mouse Click                     476    148
    Get White Busy Timeout
    Mouse Click                     260    205
    Input Text                      ${IMAGE_NUMERODOC}  ${DADOSHOSPNOVO_WALKIN.cpf}
    Mouse Click                     58     260
    Input Text                      ${IMAGE_CEP}        ${DADOSHOSPNOVO_WALKIN.cep}
    Move Mouse                      348    258
    Sleep                           1 seconds
    Input Text                      ${IMAGE_NUMEROEND}  ${DADOSHOSPNOVO_WALKIN.numend}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_ULTIMAPROC}
    Mouse Click                     460    422
    @{ULTPROC}                      Get Application Windows
    Attach Window                   ${ULTPROC[0]}
    Sleep                           2 seconds
    Move Mouse                      690    360
    Sleep                           1 seconds
    Mouse Click                     680    543
    Set White Busy Timeout          10 seconds
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_PROXIMAPROC}
    Sleep                           3 seconds
    Move Mouse                      854    420
    Sleep                           3 seconds
    Mouse Click                     858    422
    @{PROXDEST}                     Get Application Windows
    Attach Window                   ${PROXDEST[0]}
    Get White Busy Timeout
    Move Mouse                      540    252
    Sleep                           2 seconds
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

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    @{CARTAOCONS}                   Get Application Windows
    Attach Window                   ${CARTAOCONS[0]}
    Click Button                    ${BUTTON_NAO}
    Sleep                           2 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           1 seconds
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}
