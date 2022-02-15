*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
Resource        ../Resource/GuestData.robot
Resource        ../Resource/LoginDesktop.robot
Resource        ../Resource/ConferenceDesktop.robot
Library         WhiteLibrary
Library         FakerLibrary        locale=pt_BR
Documentation   Sikuli Library Demo
Library         SikuliLibrary       mode=NEW
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server
Test Setup      Add Needed Image Path


*** Variable ***


*** Test Case ***
Test Case 06.01: Chegada Antecipada e Validar Orçamento Reservas
    Disables automatic screenshot capturing on failure
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Reserva Individual
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede novo sem histórico estada
    Preencher informações e confirmar a reserva
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Realizar Check-In da Reserva
    Cadastrar informações do hóspede
    Conferir se a tela de conclusão do check-in foi exibida
    Sair da Tela de Consulta Geral
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                   ${IMAGE_DIR}

### Ações ###
Acessar a tela de Reserva Individual
    Click                           ${IMAGE_RESINDIV}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}

Preencher os campos obrigatórios para gerar orçamento da reserva
    Mouse Double Click              40    278
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_DATACHEGADA}  ${HOSP_RECEP_0601.datachegada}
    Sleep                           1 seconds
    Mouse Double Click              228    278
    SikuliLibrary.Press Special Key                     DELETE
    Input Text                      ${IMAGE_DATAPARTIDA}  ${HOSP_RECEP_0601.datapartida}
    Wait Until Screen Contain       ${IMAGE_NOITES}     12
    Double Click                    ${IMAGE_NOITES}
    WhiteLibrary.Press Special Key                      DELETE
    Input Text                      ${IMAGE_NOITES}     ${DADOS_RES.noites}
    Mouse Click                     587   276
    Attach Window                   ${SCREEN_SELECGERAL}
    @{TIPOUH}                       Get Items           control_type:Edit
    Mouse Click                     708   237
    Input Text To Textbox           ${TIPOUH[0]}        ${DADOS_RES.categ}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede novo sem histórico estada
    Mouse Click                     741   341
    Sleep                           3 seconds
    Move Mouse                      208   331
    ${SOBRENOME_0601_RECEP}         Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME_0601_RECEP}
    Move Mouse                      323   331
    ${NOME_0601_RECEP}              First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME_0601_RECEP}
    Sleep                           1 seconds
    Move Mouse                      434   331
    ${EMAIL_0601_RECEP}             Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL_0601_RECEP}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    Click                           ${IMAGE_TRATAMENTO}
    Sleep                           2 seconds
    Mouse Click                     47    471
    Sleep                           2 seconds
    Mouse Click                     325   369
    Attach Window                   ${SCREEN_MONTASELEC}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_CAMPOCIDADE}
    Input Text                      ${IMAGE_TEXT}       ${DADOSHOSPNOVO_RESIND.cidade}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Mouse Click                     515   370
    Attach Window                   ${SCREEN_SELECGERAL}
    @{IDIOMA}                       Get Items           control_type:Edit
    Mouse Click                     686   237
    Input Text To Textbox           ${IDIOMA[0]}        ${DADOSHOSPNOVO_RESIND.idioma}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      409   409
    Input Text                      ${IMAGE_DATANASC}   ${DADOSHOSPNOVO_RESIND.datanasc}
    Mouse Click                     741   341
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Preencher informações e confirmar a reserva
    Mouse Click                     87    508
    Attach Window                   ${SCREEN_SELECGERAL}
    @{DOC_CONFIRM}                  Get Items           control_type:Edit
    Input Text To Textbox           ${DOC_CONFIRM[0]}   ${DADOSHOSPNOVO_RESIND.doc}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Move Mouse                      208   508
    ${EMAIL_RECEP}                  Email
    Input Text                      ${IMAGE_NUMERO}     ${EMAIL_RECEP}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

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
    Mouse Click                     295   175
    Mouse Click                     248   218
    Sleep                           1 seconds
    Click                           ${IMAGE_NUMRESERVACG}
    Sleep                           1 seconds
    Press Keys                      v
    Sleep                           1 seconds
    Leave Special Key               CONTROL
    Click Button                    ${BUTTON_PROCURAR}

Realizar Check-In da Reserva
    Sleep                           1 seconds
    Move Mouse                      1015  145
    Click Button                    ${BUTTON_CHECKIN}
    Sleep                           3 seconds
    @{CHECKINRES}                   Get Application Windows
    Attach Window                   ${CHECKINRES[0]}
    Window Title Should Contain     ${TITLE_CHECKIN}
    Sleep                           1 seconds
    Mouse Click                     108   162
    Sleep                           1 seconds
    Move Mouse                      241   181
    Sleep                           1 seconds
    Mouse Click                     1145  690
    @{ATENCAOFNRHHOSP}              Get Application Windows
    Attach Window                   ${ATENCAOFNRHHOSP[0]}
    Click Button                    ${BUTTON_SIM}

Cadastrar informações do hóspede
    Sleep                           6 seconds
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Maximize Window                 ${SCREEN_TELAFNRH}
    Get Window Title
    Sleep                           2 seconds
    Click                           ${IMAGE_BUTTONEDITAR}
    Screen Should Contain           ${IMAGE_FEMININO}
    Mouse Move                      ${IMAGE_FEMININO}
    Mouse Click                     476   148
    Get White Busy Timeout
    Mouse Click                     260   205
    ${CPF_HOSP_RECEP_0601}          FakerLibrary.cpf
    Input Text                      ${IMAGE_NUMERODOC}  ${CPF_HOSP_RECEP_0601}
    Mouse Click                     58    260
    Input Text                      ${IMAGE_CEP}        ${DADOSHOSPNOVO_RESIND.cep}
    Move Mouse                      348   258
    Sleep                           1 seconds
    Input Text                      ${IMAGE_NUMEROEND}  ${DADOSHOSPNOVO_RESIND.numend}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_ULTIMAPROC}
    Mouse Click                     460   422
    @{ULTPROC}                      Get Application Windows
    Attach Window                   ${ULTPROC[0]}
    Sleep                           2 seconds
    Click                           ${IMAGE_BUTTONCONFIRMAR}
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
    Sleep                           1 seconds
    Click                           ${IMAGE_BUTTONCONFIRMAR}
    @{FNRHSIMPL}                    Get Application Windows
    Attach Window                   ${FNRHSIMPL[0]}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_MOTIVOVIAGEM}
    Sleep                           1 seconds
    Mouse Click                     48    458
    Mouse Move                      ${IMAGE_MEIOTRANSPOR}
    Sleep                           1 seconds
    Mouse Click                     505   459
    Click Button                    ${BUTTON_CONFIRMAR}
    Click Button                    ${BUTTON_SAIR}

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    Move Mouse                      610   210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Sleep                           1 seconds
    ${REGION}                       Get Extended Region From Image  ${IMAGE_NUMERORESERVA}  below  1
    Double Click On Region          ${REGION}
    Sleep                           1 seconds
    Hold Special Key                CONTROL
    Press Keys                      c
    Sleep                           1 seconds
    Click                           ${IMAGE_SAIRRES}

Conferir se a tela de conclusão do check-in foi exibida
    Sleep                           1 seconds
    @{CHECKINRES}                   Get Application Windows
    Attach Window                   ${CHECKINRES[0]}
    Sleep                           1 seconds
    @{CONFIRMACAODIREC}             Get Application Windows
    Attach Window                   ${CONFIRMACAODIREC[0]}
    Maximize Window
    Click Button                    ${BUTTON_SIM}
    Sleep                           2 seconds
    @{CARTAOCONS}                   Get Application Windows
    Attach Window                   ${CARTAOCONS[0]}
    Click Button                    ${BUTTON_NAO}
    Sleep                           2 seconds
    @{CHECKINRES}                   Get Application Windows
    Attach Window                   ${CHECKINRES[1]}
    Move Mouse                      610   210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           1 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}

Sair da Tela de Consulta Geral
    Set White Busy Timeout          10 seconds
    @{CONSULTAGERAL2}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL2[0]}
    Click Button                    ${BUTTON_SAIR}
