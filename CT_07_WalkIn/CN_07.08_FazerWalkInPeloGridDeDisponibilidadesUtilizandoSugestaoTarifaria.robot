*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
Resource        ../Resource/GuestData.robot
Resource        ../Resource/ConferenceDesktop.robot
Library         WhiteLibrary
Library         FakerLibrary
Documentation   Sikuli Library Demo
Library         SikuliLibrary       mode=NEW
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server
Test Setup      Add Needed Image Path


*** Variable ***


*** Test Case ***
Test Case 07.08: Fazer Walk-in pelo Grid de Disponibilidades Utilizando Sugestao Tarifaria
    Disables automatic screenshot capturing on failure
    Acessar a tela do Grid de Disponibilidade
    Selecionar o período da reserva no Grid de Disponibilidade
    Acessar a tela de reserva WalkIn pela tela de Sugestão Tarifária
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede com histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Sair da Tela de Disponibilidade de UHs
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela do Grid de Disponibilidade
    Sleep                           1 seconds
    Click                           ${IMAGE_GRIDDISPO1}
    @{GRIDDISPO}                    Get Application Windows
    Attach Window                   ${GRIDDISPO[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_DISPODEUHS}

Selecionar o período da reserva no Grid de Disponibilidade
    Move Mouse                      29     290
    Mouse Click                     141    291
    Mouse Click                     307    291
    @{SUGTARIFA}                    Get Application Windows
    Attach Window                   ${SUGTARIFA[0]}
    Maximize Window                 ${SCREEN_SUGESTARIFA}
    Get Window Title
    Sleep                           1 seconds


Acessar a tela de reserva WalkIn pela tela de Sugestão Tarifária
    Move Mouse                      394    394
    Mouse Click                     840    710
    Sleep                           10 seconds
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Sleep                           8 seconds
    Window Title Should Contain     ${TITLE_WALKIN}
    @{ATENCAO}                      Get Application Windows
    Attach Window                   ${ATENCAO[0]}
    Click Button                    ${BUTTON_OK}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Mouse Click                     756    279
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           1 seconds
    Mouse Move                      ${IMAGE_DESCUH}
    Input Text                      ${IMAGE_TEXT}       ${DADOS_RES.uh070108}
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
    Input Text                      ${IMAGE_TEXT}       ${HOSP_WALKIN_0708.cpf}
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
    Mouse Click                     87     508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_WALKIN.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}
    Move Mouse                      208    508
    ${EMAIL_WALKIN}                 Email
    Input Text                      ${IMAGE_NUMERO}     ${EMAIL_WALKIN}
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
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}

Sair da Tela de Disponibilidade de UHs
    Sleep                           2 seconds
    @{GRIDDISPO}                    Get Application Windows
    Attach Window                   ${GRIDDISPO[0]}
    Click Button                    ${BUTTON_SAIR}
