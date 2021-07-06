*** Settings ***
Resource        ../Resource/ResourceDesktop.robot
Resource        ../Resource/LoginDesktop.robot
Resource        ../Resource/ConferenceDesktop.robot
Test Teardown   Fechar Modulo


*** Test Case ***
Test Case 01: Acessar Modulo GlobalCM
    Abrir Modulo GlobalCM
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa SQL
    Conferir se a tela principal do modulo GlobalCM foi exibida

Test Case 02: Acessar Modulo VHF
    Abrir Modulo VHF
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa - VHF
    Conferir se a tela principal do modulo VHF foi exibida

Test Case 03: Acessar Modulo VHF Caixa
    Abrir Modulo VHF Caixa
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa SQL
    Conferir se a tela principal do modulo VHF Caixa foi exibida

Test Case 04: Acessar Modulo Central de Reservas
    Abrir Modulo Central de Reservas
    Acessar a página de login da aplicação - ORACLE
    Realizar login na aplicação - ORACLE
    Conferir se a tela principal do modulo Central de Reservas foi exibida

Test Case 05: Acessar Modulo Evento
    Abrir Modulo Evento
    Acessar a página de login da aplicação - ORACLE
    Realizar login na aplicação - ORACLE
    Selecionar Empresa Oracle
    Conferir se a tela principal do modulo Evento foi exibida

Test Case 06: Acessar Modulo FrontTurismo
    Abrir Modulo FrontTurismo
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa SQL
    Conferir se a tela principal do modulo FrontTurismo foi exibida

Test Case 07: Acessar Modulo SPA
    Abrir Modulo SPA
    Acessar a página de login da aplicação - ORACLE
    Realizar login na aplicação SPA
    Selecionar Empresa - SPA
    Conferir se a tela principal do modulo SPA foi exibida

Test Case 08: Acessar Modulo SSD
    Abrir Modulo SSD
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa SQL
    Conferir se a tela principal do modulo SSD foi exibida

Test Case 09: Acessar Modulo Telefonia
    Abrir Modulo Telefonia
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação - SQL
    Selecionar Empresa SQL
    Conferir se a tela principal do modulo Telefonia foi exibida

Test Case 10: Acessar Modulo TimeSharing
    Abrir Modulo TimeSharing
    Acessar a página de login da aplicação - SQL
    Realizar login na aplicação TimeSharing
    Selecionar Empresa - TimeSharing
    Selecionar Agência - TimeSharing
    Conferir se a tela principal do modulo TimeSharing foi exibida


*** Keywords ***

