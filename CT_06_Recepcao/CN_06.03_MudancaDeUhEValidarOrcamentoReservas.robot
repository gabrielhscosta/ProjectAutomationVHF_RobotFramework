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
### EM CODIFICAÇÃO ###

Test Case 06.03: Mudança de Uh e Validar Orçamento Reservas
    Disables automatic screenshot capturing on failure
    Acessar a tela de reserva WalkIn
    Preencher os campos obrigatórios para gerar orçamento da reserva
    Inserir hóspede novo sem histórico estada
    Preencher informações e confirmar a reserva
    Cadastrar informações do hóspede
    Conferir se a tela de conclusão da reserva foi exibida
    Conferir se a tela principal do modulo VHF foi exibida
    Acessar a tela de Consulta Geral
    Preencher os campos necessários para buscar o resultado esperado
    Editar Dados da Reserva
    Conferir se a tela principal do modulo VHF foi exibida pós Edição da reserva
    Sair da Tela de Consulta Geral
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
Add Needed Image Path
    Add Image Path                  ${IMAGE_DIR}

### Ações ###
Acessar a tela de reserva WalkIn
    Click                           ${IMAGE_WALKIN}
    Sleep    3 seconds
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
    Input Text                      ${IMAGE_TEXT}       ${DADOS_RES.uh0602}
    Click Button                    ${BUTTON_PROCURAR}
    Click Button                    ${BUTTON_CONFIRMAR}
    @{WALKIN}                       Get Application Windows
    Attach Window                   ${WALKIN[0]}

Inserir hóspede novo sem histórico estada
    Mouse Click                     741    341
    Sleep                           3 seconds
    Move Mouse                      208    331
    ${SOBRENOME_0602_RECEP}         Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME_0602_RECEP}
    Move Mouse                      323    331
    ${NOME_0602_RECEP}              First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME_0602_RECEP}
    Sleep                           1 seconds
    Move Mouse                      434    331
    ${EMAIL_0602_RECEP}             Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL_0602_RECEP}
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
    ${EMAIL_WALKIN}                 Email
    Input Text                      ${IMAGE_NUMERO}     ${EMAIL_WALKIN}
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
    ${CPF_0602_RECEP}               FakerLibrary.cpf
    Input Text                      ${IMAGE_NUMERODOC}  ${CPF_0602_RECEP}
    Mouse Click                     58     260
    Input Text                      ${IMAGE_CEP}        ${DADOSHOSPNOVO_WALKIN.cep}
    Move Mouse                      348    258
    Sleep                           1 seconds
    Input Text                      ${IMAGE_NUMEROEND}  ${DADOSHOSPNOVO_WALKIN.numend}
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
    Mouse Click                     48     458
    Mouse Move                      ${IMAGE_MEIOTRANSPOR}
    Sleep                           1 seconds
    Mouse Click                     505    459
    Click Button                    ${BUTTON_CONFIRMAR}
    Click Button                    ${BUTTON_SAIR}

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
    Mouse Click                     248   232
    Sleep                           1 seconds
    Click                           ${IMAGE_NUMRESERVACG}
    Sleep                           1 seconds
    Press Keys                      v
    Sleep                           1 seconds
    Leave Special Key               CONTROL
    Click Button                    ${BUTTON_PROCURAR}

Editar Dados da Reserva
    Sleep                           1 seconds
    Move Mouse                      1015  145
    Click Button                    ${BUTTON_EDITAR}
    Sleep                           2 seconds
    @{ALTERARRESERVA}               Get Application Windows
    Attach Window                   ${ALTERARRESERVA[0]}
    Window Title Should Contain     ${TITLE_ALTERARRESERVA}
    Sleep                           1 seconds
    Mouse Double Click              228    278
    SikuliLibrary.Press Special Key                     DELETE
    Input Text                      ${IMAGE_DATAPARTIDA}  ${HOSP_RECEP_0602.datapartida}
    WhiteLibrary.Press Special Key  TAB
    Wait Until Screen Contain       ${IMAGE_DIASORCAMENTRES}    2
    Click Button                    ${BUTTON_CONFIRMAR}
    Sleep                           1 seconds
    @{ALTERARRESERVA}               Get Application Windows
    Attach Window                   ${ALTERARRESERVA[0]}
    Sleep                           1 seconds
    @{CONFIRMACAODIREC}             Get Application Windows
    Attach Window                   ${CONFIRMACAODIREC[0]}
    Click Button                    ${BUTTON_SIM}

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
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Sleep                           1 seconds
    ${REGION}                       Get Extended Region From Image  ${IMAGE_NUMERORESERVA}  below  1
    Double Click On Region          ${REGION}
    Sleep                           1 seconds
    Hold Special Key                CONTROL
    Press Keys                      c
    Sleep                           1 seconds
    Click                           ${IMAGE_SAIRRES}

Conferir se a tela principal do modulo VHF foi exibida pós Edição da reserva
    Set White Busy Timeout          10 seconds
    @{ALTERARRESERVA}               Get Application Windows
    Attach Window                   ${ALTERARRESERVA[0]}
    Move Mouse                      610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           1 seconds
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Click                           ${IMAGE_SAIRRES}

Sair da Tela de Consulta Geral
    Set White Busy Timeout          10 seconds
    @{CONSULTAGERAL2}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL2[0]}
    Click Button                    ${BUTTON_SAIR}
