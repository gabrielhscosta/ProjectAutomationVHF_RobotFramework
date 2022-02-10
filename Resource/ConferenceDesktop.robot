*** Settings ***
Resource                          ../Resource/ResourceDesktop.robot
Library                           WhiteLibrary
Library                          SikuliLibrary       mode=NEW


*** Variable ***
${CONFERENCIA_TIMEOUT}            10 seconds


*** Keywords ***
### Conferências ###
Conferir se a tela principal do modulo GlobalCM foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   Global CM

Conferir se a tela principal do modulo VHF foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   Visual Hotal FrontOffice

Conferir se a tela principal do modulo VHF Caixa foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_VHFCAIXA}
    Window Title Should Contain   Visual Hotal FrontOffice - CAIXA
    Attach Window                 class_name:TfrmCartaoConsumo
    Click Button                  ${BUTTON_FECHAR}

Conferir se a tela principal do modulo Central de Reservas foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   CentralSUPER

Conferir se a tela principal do modulo Evento foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   Evento
    @{ATENCAO}                    Get Application Windows
    Attach Window                 ${ATENCAO[0]}
    Set White Busy Timeout        80 seconds
    Window Title Should Contain   Disponibilidade

Conferir se a tela principal do modulo FrontTurismo foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   FrontTurismo

Conferir se a tela principal do modulo SPA foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   SPA
    @{PENDENCDIASANT}             Get Application Windows
    Attach Window                 ${PENDENCDIASANT[0]}
    Click Button                  ${BUTTON_SAIR}
    @{SPA}                        Get Application Windows
    Attach Window                 ${SPA[0]}

Conferir se a tela principal do modulo SSD foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   SSD - Sistema de Segurança de Dados

Conferir se a tela principal do modulo Telefonia foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   Telefonia

Conferir se a tela principal do modulo TimeSharing foi exibida
    Set White Busy Timeout        ${CONFERENCIA_TIMEOUT}
    Attach Window                 ${SCREEN_TELAPRINCIPAL}
    Window Title Should Contain   TimeSharing
