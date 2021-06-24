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
Test Case 01.04: Inserir Reserva com Hospede Cortesia
    Disables automatic screenshot capturing on failure
    Acessar a tela de Reserva Individual
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede cortesia novo sem histórico estada
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

Preencher os campos obrigatórios para gerar orçamento da reserva
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Mouse Move                      ${IMAGE_NOITES}
    Double Click                    ${IMAGE_NOITES}
    SikuliLibrary.Press Special Key                     DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Mouse Click                     587    276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708    237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede cortesia novo sem histórico estada
    Mouse Click                     741    341
    Sleep                           2 seconds
    Move Mouse                      208    331
    Input Text                      ${IMAGE_SOBRENOME}  ${DADOSHOSPCORT_RESIND.sobrenome}
    Move Mouse                      323    331
    Input Text                      ${IMAGE_NOME}       ${DADOSHOSPCORT_RESIND.nome}
    Move Mouse                      434    331
    Input Text                      ${IMAGE_EMAIL}      ${DADOSHOSPCORT_RESIND.email}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TIPOHOSPEDE}
    Click                           ${IMAGE_TIPOHOSPEDE}
    Sleep                           1 seconds
    Mouse Click                     637    371
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Mouse Click                     47     471
    Sleep                           2 seconds
    Mouse Click                     325   369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPCORT_RESIND.cidade}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPCORT_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPCORT_RESIND.datanasc}
    Mouse Click                     741    341
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Preencher informações e confirmar a reserva
    Move Mouse                      633    203
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPCORT_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208    508
    Input Text                      ${IMAGE_NUMERO}     ${DADOSHOSPCORT_RESIND.email}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_SEGMENTO}
    Click                           ${IMAGE_LUPA}
    Sleep                           1 seconds
    Click                           ${IMAGE_SEGCORTESIA}
    Sleep                           2 seconds
    Click Item                      ${ITEM_DADOSCOMPLEMENT}
    Mouse Click                     251    181
    Attach Window                   ${SCREEN_SELECGERAL}
    @{MOTIVO_DESC}                  Get Items           control_type:Edit
    Input Text To Textbox           ${MOTIVO_DESC[0]}   ${DADOSHOSPCORT_RESIND.motdesc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
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
