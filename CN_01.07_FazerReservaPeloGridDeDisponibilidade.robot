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
Test Case 01.07: Fazer Reserva pelo Grid de Disponibilidade
    Disables automatic screenshot capturing on failure
    Acessar a tela do Grid de Disponibilidade
    Selecionar o período da reserva no Grid de Disponibilidade
    Acessar a tela de Reserva Individual
    Inserir hóspede novo sem histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela do Grid de Disponibilidade
    Sleep                           1 seconds
    Click                           ${IMAGE_GRIDDISPO}
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
    Move Mouse                      1214   614
    Mouse Click                     1214   710
    Sleep                           2 seconds
    @{GRIDDISPO}                    Get Application Windows
    Attach Window                   ${GRIDDISPO[0]}

Acessar a tela de Reserva Individual
    Click Button                    ${BUTTON_RESERVAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}
    Sleep                           2 seconds

Inserir hóspede novo sem histórico estada
    Mouse Click                     741    341
    Sleep                           3 seconds
    Move Mouse                      208    331
    Input Text                      ${IMAGE_SOBRENOME}  ${DADOSHOSPGRID_RESIND.sobrenome}
    Move Mouse                      323    331
    Input Text                      ${IMAGE_NOME}       ${DADOSHOSPGRID_RESIND.nome}
    Move Mouse                      434    331
    Input Text                      ${IMAGE_EMAIL}      ${DADOSHOSPGRID_RESIND.email}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Mouse Click                     47     471
    Sleep                           2 seconds
    Mouse Click                     325    369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           3 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPGRID_RESIND.cidade}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPGRID_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPGRID_RESIND.datanasc}
    Mouse Click                     741    341
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Preencher informações e confirmar a reserva
    Mouse Click                     87     508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPGRID_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPGRID_RESIND.email}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}
