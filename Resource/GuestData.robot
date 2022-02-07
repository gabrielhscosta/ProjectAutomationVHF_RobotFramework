*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           cidade=Maceio           idioma=Portug       datanasc=24031990   datanasccria1=24032018    doc=EM         razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPESTR_RESIND}           cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355

### Reserva Walk-In ###
&{DADOSHOSPNOVO_WALKIN}           cpf=40075747316         cidade=Maceio           idioma=Portug       datanasc=24031990     doc=EM         cep=57062422
...                               numend=757              razaosocialemp=4U TURISMO
&{HOSP_WALKIN_0702}               cpf=41664906304
&{HOSP_WALKIN_0703}               cpf=80773811621
&{DADOSHOSPCORT_WALKIN}           nome=Yasmin Caroline    sobrenome=Nascimento  cpf=14531826833   email=yasmincarolnascimento@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM    cep=57315742    numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_WALKIN}           nome=Manuela Flavia     sobrenome=Caldeira  cpf=63140129378     email=manuflaviacaldeira@automation.com    func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM    cep=89224075    numend=576     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_WALKIN}           nome=Jackie Blum        sobrenome=Smith     passaport=CA290131  email=jblumsmith21@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM    lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_WALKIN}           nome=Olivia Maite       sobrenome=Assis    cpf=12813026000      email=oliviamaiteassis@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
&{HOSP_WALKIN_0708}               cpf=20699808391
&{HOSP_WALKIN_0709}               cpf=45226519885
&{HOSP_WALKIN_0710}               cpf=25636118813

### Alteracao de Reserva ###
&{HOSP_RECEP_0601}                cpf=77297892483         cidade=Maceio           idioma=Portug       datanasc=24031990     doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
...                               datapartida=16022022    datachegada=14022022
&{HOSP_RECEP_0606}                cpf=83616786622         cep=57010368            numend=555
