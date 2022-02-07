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
Test Teardown   Fechar Modulo


*** Variable ***


*** Test Case ***
Test Case 01.12: Inserir Reserva com 02 Hospedes novos E 01 Criança1 sem histórico e Empresa (Validar FRNH)
    Disables automatic screenshot capturing on failure
    Acessar a tela de Reserva Individual
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede novo sem histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                   ${IMAGE_DIR}

### Ações ###
Acessar a tela de Reserva Individual
    Click                           ${IMAGE_RESINDIV1}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Double Click                    ${IMAGE_NOITES}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Double Click                    ${IMAGE_ADULTO}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_ADULTO}     ${DADOS_RES.adultos}
    Double Click                    ${IMAGE_CRIA1}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_CRIA1}      ${DADOS_RES.cria1}
    Mouse Click                     587    276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708    237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ1}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede novo sem histórico estada
    Mouse Click                     741    341
    Sleep                           2 seconds
    Move Mouse                      208    331
    ${SOBRENOME1_0112_RESIND}       Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME1_0112_RESIND}
    Move Mouse                      323    331
    ${NOME1_0112_RESIND}            First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME1_0112_RESIND}
    Sleep                           1 seconds
    Move Mouse                      434    331
    ${EMAIL1_0112_RESIND}           Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL1_0112_RESIND}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Sleep                           1 seconds
    Mouse Click                     47     471
    Sleep                           2 seconds
    Mouse Click                     325    369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPNOVO_RESIND.cidade}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPNOVO_RESIND.datanasc}
    Mouse Click                     741    341
    Sleep                           4 seconds
    Move Mouse                      208    331
    ${SOBRENOME2_0112_RESIND}       Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME2_0112_RESIND}
    Move Mouse                      323    331
    ${NOME2_0112_RESIND}            First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME2_0112_RESIND}
    Sleep                           1 seconds
    Move Mouse                      434    331
    ${EMAIL2_0112_RESIND}           Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL2_0112_RESIND}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Sleep                           1 seconds
    Mouse Click                     47     471
    Sleep                           2 seconds
    Mouse Click                     325    369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPNOVO_RESIND.datanasc}
    Mouse Click                     741    341
    Sleep                           5 seconds
    Move Mouse                      208    331
    ${SOBRENOME3_0112_RESIND}       Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME3_0112_RESIND}
    Move Mouse                      323    331
    ${NOME3_0112_RESIND}            First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME3_0112_RESIND}
    Sleep                           1 seconds
    Move Mouse                      434    331
    ${EMAIL3_0112_RESIND}           Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL3_0112_RESIND}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Sleep                           1 seconds
    Mouse Click                     47     484
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_FAIXAETARIA}
    Click                           ${IMAGE_FAIXAETARIA}
    Sleep                           1 seconds
    Mouse Click                     148    424
    Sleep                           1 seconds
    Mouse Click                     325    369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515    370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686    237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409    409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPNOVO_RESIND.datanasccria1}
    Sleep                           1 seconds
    Mouse Click                     670    372
    Sleep                           1 seconds
    Mouse Click                     741    341
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Preencher informações e confirmar a reserva
    Mouse Click                     87     508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208    508
    ${EMAIL_RESIND}                 Email
    Input Text                      ${IMAGE_NUMERO}     ${EMAIL_RESIND}
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
    Sleep                           1 seconds
    Click                           ${IMAGE_SAIRRES}
