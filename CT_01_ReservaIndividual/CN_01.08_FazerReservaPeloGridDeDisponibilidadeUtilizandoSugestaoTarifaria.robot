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


*** Test Case ***
Test Case 01.08: Fazer Reserva pelo Grid de Disponibilidade Utilizando Sugestão Tarifaria
    Disables automatic screenshot capturing on failure
    Acessar a tela do Grid de Disponibilidade
    Selecionar o período da reserva no Grid de Disponibilidade
    Acessar a tela de Reserva Individual pela tela de Sugestão Tarifária
    Inserir hóspede com histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Fechar a tela do Grid de Disponibilidade
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

Acessar a tela de Reserva Individual pela tela de Sugestão Tarifária
    Move Mouse                      394    394
    Mouse Click                     1015   710
    Sleep                           10 seconds
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           8 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}
    @{ATENCAO}                      Get Application Windows
    Attach Window                   ${ATENCAO[0]}
    Click Button                    ${BUTTON_OK}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede com histórico estada
    Mouse Click                     741     341
    Sleep                           5 seconds
    @{ATENCAO}                      Get Application Windows
    Attach Window                   ${ATENCAO[0]}
    Click Button                    ${BUTTON_OK}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     741     341
    Wait Until Screen Contain       ${IMAGE_DOCHOSPEDE}  12
    Mouse Click                     137     332
    @{SELECDOCHOSP}                 Get Application Windows
    Attach Window                   ${SELECDOCHOSP[0]}
    Move Mouse                      638     181
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_DOCUMENTO}
    Input Text                      ${IMAGE_TEXT}       ${HOSP_RESIND_0108.cpf}
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONPROCURAR}
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONCONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     741     341

Preencher informações e confirmar a reserva
    Mouse Click                     87     508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPNOVO_RESIND.email}
    Click Button                    ${BUTTON_CONFIRMAR}

Fechar a tela do Grid de Disponibilidade
    Sleep                           2 seconds
    @{GRIDDISPO}                    Get Application Windows
    Attach Window                   ${GRIDDISPO[0]}
    Click Button                    ${BUTTON_SAIR}


### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}
