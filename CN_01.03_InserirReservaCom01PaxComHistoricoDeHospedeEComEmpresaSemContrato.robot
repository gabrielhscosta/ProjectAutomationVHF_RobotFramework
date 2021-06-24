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
Test Case 01.03: Inserir Reserva com 01 Pax com histórico com Empresa sem Contrato (Validar FRNH)
    Disables automatic screenshot capturing on failure
    Acessar a tela de Reserva Individual
    Inserir Cliente(Empresa) sem Contrato
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede com histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela de Reserva Individual
    Sleep                           1 seconds
    Click                           ${IMAGE_RESINDIV1}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}

Inserir Cliente(Empresa) sem Contrato
    Get White Busy Timeout
    Move Mouse                      75      145
    Mouse Click                     190     165
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_RAZAOSOCIALEMP}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPNOVO_RESIND.razaosocialemp}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Get White Busy Timeout
    Screen Should Contain           ${IMAGE_CONTRATO}
    Mouse Move                      ${IMAGE_CONTRATO}
    Mouse Click                     150     199
    Attach Window                   ${SCREEN_MOSTCONTRATOS}
    Click Button                    ${BUTTON_CANCELAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Mouse Move                      ${IMAGE_NOITES}
    Double Click                    ${IMAGE_NOITES}
    SikuliLibrary.Press Special Key                     DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Mouse Click                     587     276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708     237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede com histórico estada
    Mouse Click                     741     341
    Set White Busy Timeout          40 seconds
    Wait Until Screen Contain       ${IMAGE_DOCHOSPEDE}  12
    Mouse Click                     137     332
    Attach Window                   ${SCREEN_MONTASELEC}
    Move Mouse                      638     181
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_DOCUMENTO}
    Input Text                      ${IMAGE_TEXT}       ${HOSP_RESIND_0103.cpf}
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONPROCURAR}
    Mouse Click                     605    250
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONCONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515     370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686     237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     741     341

Preencher informações e confirmar a reserva
    Move Mouse                      633    203
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPNOVO_RESIND.email}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    Move Mouse                      610   210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}
