*** Settings ***
Resource                          ../Resource/ResourceDesktop.robot
Library                           WhiteLibrary
Library                           SikuliLibrary           mode=NEW


*** Variable ***
${LOGIN_PARAMCONEX0}              text:Parâmetros para conexão com o banco
${LOGIN_PARAMCONEX1}              text:Parâmetros para conexão com o banco
${LOGIN_BUTTONCONFIR}             text:Confirmar
${LOGIN_TELALOGIN}                class_name:TfrmLogin
${LOGIN_TITLELOGIN}               Login
${LOGIN_TITLEEMPRESA}             Empresa
${LOGIN_SELECEMPRESA}             class_name:TfrmLogEmpresa
${LOGIN_COMBOEMPRESA}             class_name:TBtnWinControl
${LOGIN_DESCREMPRESA}             class_name:TwwDBLookupCombo
${LOGIN_DESCREMPRESATS}           class_name:TCMDBLookupCombo
${LOGIN_EMPRESA_QA_FRONT}         1-AUTOMACAO DE TESTES
${LOGIN_EMPRESA_CONCEPT}          01-Fiscal DANFE MISTA BRASILIA
${LOGIN_EMPRESA_KHOTEL}           K Hotel
${LOGIN_AGENCIA_TS}               REST ASSESSORIA JURÍDICA LTDA


*** Keywords ***
### Ações ###
Acessar a página de login da aplicação - SQL
    Attach Window                 class_name:TFrmParamSysPadrao
    Wait Until Item Exists        ${LOGIN_PARAMCONEX0}    5
    Double Click Item             ${LOGIN_PARAMCONEX1}
    Double Click Item             text:Configurações
    Click Item                    text:SQL Server
    Button Text Should Be         ${LOGIN_BUTTONCONFIR}   Confirmar
    Click Button                  ${LOGIN_BUTTONCONFIR}

Acessar a página de login da aplicação - ORACLE
    Attach Window                 class_name:TFrmParamSysPadrao
    Wait Until Item Exists        ${LOGIN_PARAMCONEX0}    5
    Double Click Item             ${LOGIN_PARAMCONEX1}
    Double Click Item             text:Configurações
    Click Item                    text:ORACLE
    Button Text Should Be         ${LOGIN_BUTTONCONFIR}   Confirmar
    Click Button                  ${LOGIN_BUTTONCONFIR}

Realizar login na aplicação - SQL
    Set White Busy Timeout        10 seconds
    Attach Window                 ${LOGIN_TELALOGIN}
    Window Title Should Be        ${LOGIN_TITLELOGIN}
    @{CAIXA_LOGIN}                Get Items               class_name:TEdit
    WhiteLibrary.Mouse Click
    Input Text To Textbox         ${CAIXA_LOGIN[0]}       ${LOGIN.usersql}
    Move Mouse                    704   375
    Input Text To Textbox         ${CAIXA_LOGIN[1]}       ${LOGIN.senhasql}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Realizar login na aplicação - ORACLE
    Set White Busy Timeout        10 seconds
    Attach Window                 ${LOGIN_TELALOGIN}
    Window Title Should Be        ${LOGIN_TITLELOGIN}
    @{CAIXA_LOGIN}                Get Items               class_name:TEdit
    WhiteLibrary.Mouse Click
    Input Text To Textbox         ${CAIXA_LOGIN[0]}       ${LOGIN.userora}
    Move Mouse                    704   375
    Input Text To Textbox         ${CAIXA_LOGIN[1]}       ${LOGIN.senhaora}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Realizar login na aplicação SPA
    Set White Busy Timeout        10 seconds
    @{SCREEN_LOGIN}               Get Application Windows
    Attach Window                 ${SCREEN_LOGIN[0]}
    Window Title Should Contain   SPA
    @{CAIXA_LOGIN}                Get Items               class_name:TEdit
    WhiteLibrary.Mouse Click
    Input Text To Textbox         ${CAIXA_LOGIN[0]}       ${LOGIN.userora}
    Move Mouse                    704   375
    Input Text To Textbox         ${CAIXA_LOGIN[1]}       ${LOGIN.senhaora}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Realizar login na aplicação TimeSharing
    Set White Busy Timeout        10 seconds
    @{SCREEN_LOGIN}               Get Application Windows
    Attach Window                 ${SCREEN_LOGIN[0]}
    Window Title Should Contain   TimeSharing
    @{CAIXA_LOGIN}                Get Items               class_name:TEdit
    WhiteLibrary.Mouse Click
    Input Text To Textbox         ${CAIXA_LOGIN[0]}       ${LOGIN.usersql}
    Move Mouse                    704   375
    Input Text To Textbox         ${CAIXA_LOGIN[1]}       ${LOGIN.senhasql}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Selecionar Empresa - VHF
    Attach Window                 ${LOGIN_SELECEMPRESA}
    Window Title Should Be        ${LOGIN_TITLEEMPRESA}
    WhiteLibrary.Mouse Click      909   363
    Click Item                    ${LOGIN_COMBOEMPRESA}
    WhiteLibrary.Mouse Click      546   400
    Verify Text In Textbox        ${LOGIN_DESCREMPRESA}   ${LOGIN_EMPRESA_QA_FRONT}
    Click Button                  ${LOGIN_BUTTONCONFIR}
    Set White Busy Timeout        120 seconds
    @{ATENCAO}                    Get Application Windows
    Attach Window                 ${ATENCAO[0]}
    Click Button                  ${BUTTON_OK}

Selecionar Empresa SQL
    Attach Window                 ${LOGIN_SELECEMPRESA}
    Window Title Should Be        ${LOGIN_TITLEEMPRESA}
    WhiteLibrary.Mouse Click      909   363
    Click Item                    ${LOGIN_COMBOEMPRESA}
    WhiteLibrary.Mouse Click      546   400
    Verify Text In Textbox        ${LOGIN_DESCREMPRESA}   ${LOGIN_EMPRESA_QA_FRONT}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Selecionar Empresa Oracle
    Attach Window                 ${LOGIN_SELECEMPRESA}
    Window Title Should Be        ${LOGIN_TITLEEMPRESA}
    WhiteLibrary.Mouse Click      909   363
    Click Item                    ${LOGIN_COMBOEMPRESA}
    WhiteLibrary.Mouse Click      546   400
    Verify Text In Textbox        ${LOGIN_DESCREMPRESA}   ${LOGIN_EMPRESA_CONCEPT}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Selecionar Empresa - SPA
    Set White Busy Timeout        10 seconds
    @{SCREEN_EMPRESA}             Get Application Windows
    Attach Window                 ${SCREEN_EMPRESA[0]}
    Window Title Should Contain   SPA
    WhiteLibrary.Mouse Click      909   363
    Click Item                    ${LOGIN_COMBOEMPRESA}
    WhiteLibrary.Mouse Click      498   398
    Verify Text In Textbox        ${LOGIN_DESCREMPRESA}   ${LOGIN_EMPRESA_KHOTEL}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Selecionar Empresa - TimeSharing
    Set White Busy Timeout        10 seconds
    @{SCREEN_EMPRESA}             Get Application Windows
    Attach Window                 ${SCREEN_EMPRESA[0]}
    Window Title Should Contain   TimeSharing
    WhiteLibrary.Mouse Click      909   363
    Click Item                    ${LOGIN_COMBOEMPRESA}
    WhiteLibrary.Mouse Click      498   398
    Verify Text In Textbox        ${LOGIN_DESCREMPRESA}   ${LOGIN_EMPRESA_QA_FRONT}
    Click Button                  ${LOGIN_BUTTONCONFIR}

Selecionar Agência - TimeSharing
    Set White Busy Timeout        10 seconds
    @{SCREEN_AGENCIA}             Get Application Windows
    Attach Window                 ${SCREEN_AGENCIA[0]}
    Window Title Should Contain   TimeSharing
    Mouse Click                   846   361
    Click Item                    ${LOGIN_COMBOEMPRESA}
    Mouse Click                   523   429
    Verify Text In Textbox        ${LOGIN_DESCREMPRESATS}  ${LOGIN_AGENCIA_TS}
    Click Button                  ${LOGIN_BUTTONCONFIR}
