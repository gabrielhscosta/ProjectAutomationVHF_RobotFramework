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
Test Teardown   Fechar Modulo


*** Variable ***


*** Test Case ***
Test Case 07.10: Inserir um Walk-in Validando Status da Governaça da UH
    Disables automatic screenshot capturing on failure
    Acessar a tela de reserva WalkIn
    Inserir Cliente(Empresa) sem Contrato
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede com histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de status da governança
    Inserir parâmetros de busca da UH da reserva
    Conferir o status da UH
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

Inserir Cliente(Empresa) sem Contrato
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
    # @{CONFIRMACAO_TARBALCAO}        Get Application Windows
    # Attach Window                   ${CONFIRMACAO_TARBALCAO[0]}
    # Click Button                    text:Não
    Attach Window                   ${SCREEN_MOSTCONTRATOS}
    Click Button                    ${BUTTON_CANCELAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

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
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Mouse Click                     756     279
    Attach Window                   ${SCREEN_MONTASELEC}
    Mouse Move                      ${IMAGE_DESCUH}
    Input Text                      ${IMAGE_TEXT}       ${DADOS_RES.uh070110}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Inserir hóspede com histórico estada
    Mouse Click                     741     341
    Set White Busy Timeout          40 seconds
    Wait Until Screen Contain       ${IMAGE_DOCHOSPEDE}  12
    Mouse Click                     137     332
    Attach Window                   ${SCREEN_MONTASELEC}
    Move Mouse                      638     181
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_DOCUMENTO}
    Input Text                      ${IMAGE_TEXT}       ${HOSP_WALKIN_0710.cpf}
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONPROCURAR}
    Click                           ${IMAGE_BUTTONCONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Mouse Click                     515     370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686     237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_WALKIN.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
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
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

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
    Click                           ${IMAGE_SAIRRES}

Conferir o status da UH
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_UHOCUPADA}
    Click Button                    ${BUTTON_SAIR}
