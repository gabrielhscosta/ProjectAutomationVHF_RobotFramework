*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/ImagesDesktop.robot
Resource        ../Resource/GuestData.robot
Resource        ../Resource/LoginDesktop.robot
Resource        ../Resource/ConferenceDesktop.robot
Library         WhiteLibrary
Library         FakerLibrary        locale=pt_BR
Library         DatabaseLibrary
Library         RPA.Desktop
Documentation   Sikuli Library Demo
Library         SikuliLibrary       mode=NEW
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server
Test Setup      Add Needed Image Path


*** Variable ***
${DBAPI}          pymssql
${DBName}         QA_FRONT
${DBUser}         cm
${DBPass}         cmsol
${DBHost}         RJOSRVDBODEV001
${DBPort}         1433
${DBCONFIG}       Resource/default.cfg


*** Test Case ***
Test Case 02.01: Fazer reserva com alterações programadas (Valor Manual, Desconto, Tarifa, Pacote, Diferença de Diária, Segmento, Pensão) e Verificar Orçamento.
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
    Editar dados da reserva
    Realizar alterações programadas no orcamento da reserva
    Conferir se a tela principal do modulo VHF foi exibida pós Edição da reserva
    Sair da Tela de Consulta Geral
    Conectar na Base de Dados
    ${RESULT_QUERY}       Conferir as alterações programadas na tabela orcamentoreserva    select r.IdReservasFront, r.numreserva, oc.DATA, oc.idTarifa, oc.CODPENSAO, oc.VALOR, oc.VALORTARIFA, oc.VALORMANUAL, oc.VALORCAFE, oc.VALORPENSAO, oc.CodSegmento from reservasfront r, ORCAMENTORESERVA oc where r.idhotel = 1 and r.numreserva = ${NUMRESERVA} and r.idhotel = oc.idhotel and r.idreservasfront = oc.idreservasfront order by data asc
    Log                   Linha 1 ${RESULT_QUERY[0][0]} - NUMRESERVA: ${RESULT_QUERY[0][1]} - DATA: ${RESULT_QUERY[0][2]} - IDTARIFA: ${RESULT_QUERY[0][3]} - CODPENSAO: ${RESULT_QUERY[0][4]} - VALOR: ${RESULT_QUERY[0][5]} - VALORTARIFA: ${RESULT_QUERY[0][6]} - VALORMANUAL: ${RESULT_QUERY[0][7]} - VALORCAFE: ${RESULT_QUERY[0][8]} - VALORPENSAO: ${RESULT_QUERY[0][9]} - CODSEGMENTO: ${RESULT_QUERY[0][10]}
    Log                   Linha 2 ${RESULT_QUERY[1][0]} - NUMRESERVA: ${RESULT_QUERY[0][1]} - DATA: ${RESULT_QUERY[1][2]} - IDTARIFA: ${RESULT_QUERY[1][3]} - CODPENSAO: ${RESULT_QUERY[1][4]} - VALOR: ${RESULT_QUERY[1][5]} - VALORTARIFA: ${RESULT_QUERY[1][6]} - VALORMANUAL: ${RESULT_QUERY[1][7]} - VALORCAFE: ${RESULT_QUERY[1][8]} - VALORPENSAO: ${RESULT_QUERY[1][9]} - CODSEGMENTO: ${RESULT_QUERY[1][10]}
    Log                   Linha 3 ${RESULT_QUERY[2][0]} - NUMRESERVA: ${RESULT_QUERY[0][1]} - DATA: ${RESULT_QUERY[2][2]} - IDTARIFA: ${RESULT_QUERY[2][3]} - CODPENSAO: ${RESULT_QUERY[2][4]} - VALOR: ${RESULT_QUERY[2][5]} - VALORTARIFA: ${RESULT_QUERY[2][6]} - VALORMANUAL: ${RESULT_QUERY[2][7]} - VALORCAFE: ${RESULT_QUERY[2][8]} - VALORPENSAO: ${RESULT_QUERY[2][9]} - CODSEGMENTO: ${RESULT_QUERY[2][10]}
    Conferir os valores alterados manualmente no Orcamento da Reserva
    Desconectar da Base de Dados
    Conferir se a tela principal do modulo VHF foi exibida


*** Keywords ***
### Parâmetros ###
Add Needed Image Path
    Add Image Path                   ${IMAGE_DIR}

Conectar na Base de Dados
    Connect To Database              dbapiModuleName=${DBAPI}   dbName=${DBName}    dbUsername=${DBUser}    dbPassword=${DBPass}    dbHost=${DBHost}    dbPort=${DBPort}    dbConfigFile=${DBCONFIG}

Desconectar da Base de Dados
    Disconnect From Database

### Ações ###
Acessar a tela de Reserva Individual
    SikuliLibrary.Click             ${IMAGE_RESINDIV}
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_RESINDIVID}

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
    @{RESINDIVIDUAL}                Get Application Windows
    Attach Window                   ${RESINDIVIDUAL[0]}

Inserir hóspede novo sem histórico estada
    Mouse Click                     741   341
    Sleep                           3 seconds
    WhiteLibrary.Move Mouse         208   331
    ${SOBRENOME_0601_RECEP}         Last Name Female
    Input Text                      ${IMAGE_SOBRENOME}  ${SOBRENOME_0601_RECEP}
    WhiteLibrary.Move Mouse         323   331
    ${NOME_0601_RECEP}              First Name Female
    Input Text                      ${IMAGE_NOME}       ${NOME_0601_RECEP}
    Sleep                           1 seconds
    WhiteLibrary.Move Mouse         434   331
    ${EMAIL_0601_RECEP}             Email
    Input Text                      ${IMAGE_EMAIL}      ${EMAIL_0601_RECEP}
    Sleep                           2 seconds
    Mouse Move                      ${IMAGE_TRATAMENTO}
    SikuliLibrary.Click             ${IMAGE_TRATAMENTO}
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
    WhiteLibrary.Move Mouse         409   409
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
    WhiteLibrary.Move Mouse         208   508
    ${EMAIL_RECEP}                  Email
    Input Text                      ${IMAGE_NUMERO}     ${EMAIL_RECEP}
    Click Item                      ${ITEM_ATUALIZARVALPERIO}
    Click Button                    ${BUTTON_CONFIRMAR}

Acessar a tela de Consulta Geral
    SikuliLibrary.Click             ${IMAGE_CONSULTAGERAL}
    @{CONSULTAGERAL}                Get Application Windows
    Attach Window                   ${CONSULTAGERAL[0]}
    Sleep                           2 seconds
    Window Title Should Contain     ${TITLE_CONSULTAGERAL}

Preencher os campos necessários para buscar o resultado esperado
    Sleep                           2 seconds
    @{CONSULTAGERAL1}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL1[0]}
    SikuliLibrary.Click             ${IMAGE_STATUSCG}
    Mouse Click                     295   175
    Mouse Click                     248   218
    Sleep                           1 seconds
    SikuliLibrary.Click             ${IMAGE_NUMRESERVACG}
    Sleep                           1 seconds
    WhiteLibrary.Press Keys         v
    Sleep                           1 seconds
    Leave Special Key               CONTROL
    Click Button                    ${BUTTON_PROCURAR}

Editar dados da reserva
    Sleep                           1 seconds
    WhiteLibrary.Move Mouse         1015  145
    Click Button                    ${BUTTON_EDITAR}
    Sleep                           2 seconds
    @{ALTERARRESERVA}               Get Application Windows
    Attach Window                   ${ALTERARRESERVA[0]}
    Window Title Should Contain     ${TITLE_ALTERARRESERVA}

Realizar alterações programadas no orcamento da reserva
    Sleep                           1 seconds
    Mouse Click                     832   130
    Sleep                           1 seconds
    Get Application Windows
    Attach Window                   ${SCREEN_DADOSORCAMENTO}
    ${TITLEOCR}                     Get Window Title
    Sleep                           1 seconds
    SikuliLibrary.Click             ${IMAGE_CALENDRPLDATA}
    SikuliLibrary.Click             ${IMAGE_REPLDATAOCR_16}
    Sleep                           1 seconds
    SikuliLibrary.Click             ${IMAGE_VLRMANUALOCR}
    Input Text                      ${IMAGE_VLRMANUALOCR}    ${DADOS_RES.vlrmanual}
    Sleep                           1 seconds
    # Click                           ${IMAGE_DESCONTOOCR}
    # Input Text                      ${IMAGE_DESCONTOOCR}     ${DADOS_RES.vlrdesc}
    # Sleep                           1 seconds
    SikuliLibrary.Click             ${IMAGE_PENSAOOCR}
    SikuliLibrary.Click             ${IMAGE_PENSAOMEIAOCR}
    Sleep                           1 seconds
    Mouse Move                      ${IMAGE_SEGMENTOOCR}
    SikuliLibrary.Click             ${IMAGE_LUPAOCR}
    SikuliLibrary.Click             ${IMAGE_SEGPARTAUTOMACAO}
    Sleep                           1 seconds
    Click Button                    ${BUTTON_APLICAROCR}
    Sleep                           1 seconds
    @{ALTERARRESERVA}               Get Application Windows
    Attach Window                   ${ALTERARRESERVA[0]}
    Click Button                    ${BUTTON_CONFIRMAR}

### Conferência ###
Conferir se a tela de conclusão da reserva foi exibida
    Set White Busy Timeout          10 seconds
    WhiteLibrary.Move Mouse         610   210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           2 seconds
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    Sleep                           1 seconds
    ${REGION}                       Get Extended Region From Image  ${IMAGE_NUMERORESERVA}  below  1
    Double Click On Region          ${REGION}
    Sleep                           1 seconds
    Hold Special Key                CONTROL
    WhiteLibrary.Press Keys         c
    Sleep                           1 seconds
    ${GET_NUMRESERVA}               Get Clipboard Value
    Set Test Variable               ${NUMRESERVA}    ${GET_NUMRESERVA}
    SikuliLibrary.Click             ${IMAGE_SAIRRES}

Conferir se a tela principal do modulo VHF foi exibida pós Edição da reserva
    Set White Busy Timeout          10 seconds
    WhiteLibrary.Move Mouse         610    210
    @{SITUACAORES}                  Get Application Windows
    Attach Window                   ${SITUACAORES[0]}
    Sleep                           1 seconds
    Window Title Should Contain     ${TITLE_SITUACAORES}
    Screen Should Contain           ${IMAGE_CONFIRMACAORES}
    SikuliLibrary.Click             ${IMAGE_SAIRRES}

Sair da Tela de Consulta Geral
    Set White Busy Timeout          10 seconds
    @{CONSULTAGERAL2}               Get Application Windows
    Attach Window                   ${CONSULTAGERAL2[0]}
    Click Button                    ${BUTTON_SAIR}

Conferir as alterações programadas na tabela orcamentoreserva
    [Arguments]                     ${QUERY}
    ${RESPONSE_QUERY}               Query       selectStatement=${QUERY}
    [Return]                        ${RESPONSE_QUERY}

Conferir os valores alterados manualmente no Orcamento da Reserva
    ${ROWCOUNT}   Row Count         selectStatement=select r.IdReservasFront, r.numreserva, oc.DATA, oc.idTarifa, oc.CODPENSAO, oc.VALOR, oc.VALORTARIFA, oc.VALORMANUAL, oc.VALORCAFE, oc.VALORPENSAO, oc.CodSegmento from reservasfront r, ORCAMENTORESERVA oc where r.idhotel = 1 and r.numreserva = ${NUMRESERVA} and r.idhotel = oc.idhotel and r.idreservasfront = oc.idreservasfront order by data asc
    Should Be Equal As Integers     3    ${ROWCOUNT}    values=TRUE
    Check If Exists In Database     selectStatement=select r.IdReservasFront, r.numreserva, oc.DATA, oc.idTarifa, oc.CODPENSAO, oc.VALOR, oc.VALORTARIFA, oc.VALORMANUAL, oc.VALORCAFE, oc.VALORPENSAO, oc.CodSegmento from reservasfront r, ORCAMENTORESERVA oc where r.idhotel = 1 and r.numreserva = ${NUMRESERVA} and valormanual = ${DADOS_RES.vlrmanual} and r.idhotel = oc.idhotel and r.idreservasfront = oc.idreservasfront
    
    # and codpensao = ${CODPENSAO} and codsegmento = ${CODSEGMENTO}
