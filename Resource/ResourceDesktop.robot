*** Settings ***
Library                          WhiteLibrary


*** Variable ***
### Diretório do Sistema ###
&{DIR}                            Global=C:/Totvs/Hoteis/GlobalCM.exe
...                               VHF=C:/Totvs/Hoteis/VHF.exe
...                               VHFCaixa=C:/Totvs/Hoteis/VHFCaixa.exe
...                               CR=C:/Totvs/Hoteis/CentralReservas.exe
...                               Evento=C:/Totvs/Hoteis/Evento.exe
...                               FT=C:/Totvs/Hoteis/FrontTurismo.exe
...                               SPA=C:/Totvs/Hoteis/SPA.exe
...                               SSD=C:/Totvs/Hoteis/SSD.exe
...                               Telefonia=C:/Totvs/Hoteis/Telefonia.exe
...                               TS=C:/Totvs/Hoteis/TimeSharing.exe

### Dados de Login ###
&{LOGIN}                          usersql=QAFRONT    senhasql=QAFRONT123    userora=cm    senhaora=cmsol123

### Dados da Reserva ###
&{DADOS_RES}                      noites=3        adultos=2         cria1=1          cria2=1       categ=STND     categ1=FRUA
...                               uh070101=607    uh070102=705      uh070103=706     uh070104=707  uh070105=805
...                               uh070106=806    uh070107=807      uh070108=905     uh070109=906  uh070110=907
...                               valordiar=609   valorpgtodin=10   valorpgtocc=120  uhextra1=605  uhextra2=606
...                               uh0602=505      uh=506            uh=507           uh=605        uh=606
...                               motdesc=Autorizado pela Gerencia  func=Gabriel

### Titles ###
${TITLE_RESINDIVID}                 Reserva Individual
${TITLE_WALKIN}                     Walk-in
${TITLE_SITUACAORES}                Situação da Reserva
${TITLE_DISPODEUHS}                 Disponibilidade de UHs
${TITLE_STATUSDAGOV}                Status da Governança
${TITLE_CONSULTAGERAL}              Consulta Geral
${TITLE_CANCELRES}                  Cancelamento de Reservas
${TITLE_LANCITENSPDV}               Lançamento de Itens de PDV
${TITLE_NOVACONTA}                  Operação de Caixa - Nova Conta
${TITLE_ENCERCONTAS}                Encerrar Contas
${TITLE_DETALLANC}                  Detalhes do Lançamento
${TITLE_CHECKIN}                    [Check-In]
${TITLE_OPIMPREXTRATO}              Operação de Caixa - Imprimir Extrato
${TITLE_ALTERARRESERVA}             [Alterar Reserva - AUTOMACAO DE TESTES]
${TITLE_ENCERRAMAUTO}               Encerramento Automático

### Buttons ###
${BUTTON_PROCURAR}                  text:Procurar
${BUTTON_CONFIRMAR}                 text:Confirmar
${BUTTON_OK}                        text:OK
${BUTTON_NAO}                       text:Não
${BUTTON_CANCELAR}                  text:Cancelar
${BUTTON_SAIR}                      text:Sair
${BUTTON_WALKIN}                    text:Walk-in
${BUTTON_CONTA}                     text:Conta
${BUTTON_RESERVAR}                  text:Reservar
${BUTTON_FECHAR}                    text:Fechar
${BUTTON_SIM}                       text:Sim
${BUTTON_CAIXA}                     text:Caixa
${BUTTON_LANCAR}                    text:Lançar
${BUTTON_VOLTAR}                    text:Voltar
${BUTTON_ENCERCONTAS}               text:Encerrar contas
${BUTTON_ENCERPARCIAL}              text:Encerrar parcial
${BUTTON_CHECKIN}                   text:Checkin
${BUTTON_EDITAR}                    text:Editar
${BUTTON_SELECTODASGOV}             text:Seleciona todas
${BUTTON_LIMPOGOV}                  text:Limpo
${BUTTON_DESFPROCGOV}               text:Desfazer procura
${BUTTON_IMPREXTRATO}               text:Imprimir extrato
${BUTTON_VISUALIZAR}                text:Visualizar

### Screens ###
${SCREEN_TELAPRINCIPAL}             class_name:TfrmPrincipal
${SCREEN_VHFCAIXA}                  class_name:TfrmPrincipalCAIXA
${SCREEN_SELECGERAL}                class_name:TfrmSelecaoGeral
${SCREEN_MONTASELEC}                class_name:TfrmMontaSelect
${SCREEN_TELAFNRH}                  class_name:TfrmFNRHSimplificada
${SCREEN_MOSTCONTRATOS}             class_name:TfrmMostraContratos
${SCREEN_SUGESTARIFA}               class_name:TfrmSugereTarifa
${SCREEN_DIRECIONADESP}             class_name:TfrmCxDirecionaDesp
${SCREEN_LANCFRIGCAIXA}             class_name:TfrmLancFrigCaixa
${SCREEN_OPERACAOLANCENC}           class_name:TfrmCxOperacaoLancEncerra
${SCREEN_DETALHESLANCPDV}           class_name:TfrmDetalheLancamentoPDV
${ITEM_ATUALIZARVALPERIO}           text:Clique para atualizar os valores do período
${ITEM_DADOSCOMPLEMENT}             text:Dados complementares
${SCREEN_OPERIMPEXTRATO}            class_name:TfrmCxOperacaoImpExtrato
${SCREEN_VISEXTRATOCONTA}           class_name:TFrmPreview
${SCREEN_IMPRESS}                   class_name:TppPrintDialog
${SCREEN_CONFIRMACAO}               class_name:TMessageForm

### Textos ###
${TEXT_RESTAURANTE}                 Restaurante
${TEXT_DIARIAANTEC}                 Diaria Antecipada

*** Keywords ***
### SETUP ###
Abrir Modulo GlobalCM
    Launch Application            ${DIR.Global}

Abrir Modulo VHF
    Launch Application            ${DIR.VHF}

Abrir Modulo VHF Caixa
    Launch Application            ${DIR.VHFCaixa}

Abrir Modulo Central de Reservas
    Launch Application            ${DIR.CR}

Abrir Modulo Evento
    Launch Application            ${DIR.Evento}

Abrir Modulo FrontTurismo
    Launch Application            ${DIR.FT}

Abrir Modulo SPA
    Launch Application            ${DIR.SPA}

Abrir Modulo SSD
    Launch Application            ${DIR.SSD}

Abrir Modulo Telefonia
    Launch Application            ${DIR.Telefonia}

Abrir Modulo TimeSharing
    Launch Application            ${DIR.TS}

### Desativar a captura de imagens de falhas ###
Disables automatic screenshot capturing on failure
    Take Screenshots On Failure   FALSE

### TEARDOWN ###
Fechar Modulo
    Sleep                         2 seconds
    WhiteLibrary.Close Application
