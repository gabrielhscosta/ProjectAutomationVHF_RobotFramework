*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
Resource        ../Resource/GuestData.robot
Resource        ../Resource/ConferenceDesktop.robot
Library         WhiteLibrary
Documentation   Sikuli Library Demo
Library         SikuliLibrary       mode=NEW
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server
Test Setup      Add Needed Image Path


*** Variable ***


*** Test Case ***
Test Case 07.09: Inserir um Walk-in Lancando Diária e Requerimento no Momento do Check-in
    [Tags]  TS
    Disables automatic screenshot capturing on failure
    Acessar a tela de reserva WalkIn
    Inserir Cliente(Empresa) com Contrato
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede com histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela de reserva WalkIn
    Sleep                           1 seconds
    Click                           ${IMAGE_WALKIN1}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_WALKIN}

Inserir Cliente(Empresa) com Contrato
    Get White Busy Timeout
    Move Mouse                      75      145
    Mouse Click                     190     165
    Attach Window                   ${SCREEN_MONTASELEC}
    Mouse Move                      ${IMAGE_RAZAOSOCIALEMP}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPNOVO_WALKIN.razaosocialemp}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Get White Busy Timeout
    Screen Should Contain           ${IMAGE_CONTRATO}
    Mouse Move                      ${IMAGE_CONTRATO}
    Mouse Click                     150     199
    Sleep                           1 seconds
    Attach Window                   ${SCREEN_MOSTCONTRATOS}
    Mouse Click                     772     227
    Click Button                    ${BUTTON_OK}
    Set White Busy Timeout          20 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Mouse Move                      ${IMAGE_NOITES}
    Double Click                    ${IMAGE_NOITES}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Mouse Click                     587     276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708     237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Mouse Click                     756     279
    Attach Window                   ${SCREEN_MONTASELEC}
    Mouse Move                      ${IMAGE_DESCUH}
    Input Text                      ${IMAGE_TEXT}       ${DADOS_RES.uh070109}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Inserir hóspede com histórico estada
    Mouse Click                     741     341
    Set White Busy Timeout          20 seconds
    Wait Until Screen Contain       ${IMAGE_DOCHOSPEDE}  12
    Mouse Click                     137     332
    @{SELECDOCHOSP}                 Get Application Windows
    Attach Window                   ${SELECDOCHOSP[0]}
    Move Mouse                      638     181
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_DOCUMENTO}
    Input Text                      ${IMAGE_TEXT}            ${HOSP_WALKIN_0709.cpf}
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONPROCURAR}
    Click                           ${IMAGE_BUTTONCONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           1 seconds
    Mouse Click                     741     341

Preencher informações e confirmar a reserva
    Move Mouse                      633    203
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_WALKIN.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPNOVO_WALKIN.email}
    Sleep                           1 seconds
    Click Item                      ${ITEM_DADOSCOMPLEMENT}
    Click                           ${IMAGE_LANCARDIARIAS}
    Click                           ${IMAGE_LANCARREQUERIMENTOS}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    @{ATENCAOMODTARIFA}             Get Application Windows
    Attach Window                   ${ATENCAOMODTARIFA[0]}
    Click Button                    ${BUTTON_OK}
    Sleep                           1 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Click Button                    ${BUTTON_CONFIRMAR}

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    @{CARTAOCONS}                   Get Application Windows
    Attach Window                   ${CARTAOCONS[0]}
    Click Button                    ${BUTTON_NAO}
    Set White Busy Timeout          40 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      610   210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click Button                    ${BUTTON_CONTA}
    @{DIRECDESPE}                   Get Application Windows
    Attach Window                   ${DIRECDESPE[0]}
    Maximize Window                 ${SCREEN_DIRECIONADESP}
    Sleep                           1 seconds
    Move Mouse                      112   100
    Sleep                           1 seconds
    Mouse Click                     112   170
    Sleep                           1 seconds
    Mouse Click                     112   196
    Sleep                           1 seconds
    Mouse Click                     112   220
    Sleep                           1 seconds
    Mouse Click                     112   246
    Sleep                           1 seconds
    Mouse Click                     112   270
    Sleep                           1 seconds
    Mouse Click                     112   320
    Sleep                           1 seconds
    Mouse Click                     112   346
    Sleep                           1 seconds
    Mouse Click                     112   370
    Sleep                           1 seconds
    Mouse Click                     112   396
    Sleep                           1 seconds
    Mouse Click                     112   420
    Move Mouse                      350   280
    Sleep                           2 seconds
    Mouse Click                     396   176
    Click Button                    ${BUTTON_CONFIRMAR}
    Sleep                           2 seconds
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}
    Sleep                           20 seconds
    @{DIARIASLANC}                  Get Application Windows
    Attach Window                   ${DIARIASLANC[0]}
    Click Button                    ${BUTTON_OK}
    Sleep                           2 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           10 seconds
    @{REQUERLANC}                   Get Application Windows
    Attach Window                   ${REQUERLANC[0]}
    Click Button                    ${BUTTON_OK}
