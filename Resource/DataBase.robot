*** Settings ***
Resource         ../Resource/ResourceDesktop.robot
Library          DatabaseLibrary
Test Setup       Conectar na Base de Dados
Test Teardown    Desconectar da Base de Dados


*** Variable ***
${DBAPI}          pymssql
${DBName}         QA_FRONT
${DBUser}         cm
${DBPass}         cmsol
${DBHost}         RJOSRVDBODEV001
${DBPort}         1433
${DBCONFIG}       Resource/default.cfg


# *** Test Case ***


*** Keywords ***
Conectar na Base de Dados
    Connect To Database    dbapiModuleName=${DBAPI}   dbName=${DBName}    dbUsername=${DBUser}    dbPassword=${DBPass}    dbHost=${DBHost}    dbPort=${DBPort}    dbConfigFile=${DBCONFIG}

Desconectar da Base de Dados
    Disconnect From Database
