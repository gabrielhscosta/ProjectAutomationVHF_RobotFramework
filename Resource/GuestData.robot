*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           nome=Francisca Daiane   sobrenome=Dias      email=frandaianedias@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM     razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPCORT_RESIND}           nome=Sara Andrea        sobrenome=Campos    email=saraandreacampos@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM     numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_RESIND}           nome=Sandra Emily       sobrenome=Lima      email=sandraemilylima@automation.com       func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_RESIND}           nome=Hazel Ember        sobrenome=Smith     passaport=CA008503  email=hazelembersmith@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM     lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_RESIND}           nome=Carolina Beatriz   sobrenome=Jesus     email=carolinabeatrizjesus@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM     numend=555
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355
&{DADOSHOSNOVOS_RESIND}           nome1=Bianca Marina     sobrenome1=da Mota  email1=biancamarinadamota@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Natalia Maria     sobrenome2=da Mota  email2=nataliamariadamota@automation.com
&{DADOSHOSNOVOSECRIA1_RESIND}     nome1=Sophia Elaine     sobrenome1=Cardoso  email1=sophiaelainecardoso@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Clara Claudia     sobrenome2=Cardoso  email2=claraclaudiacardoso@automation.com
...                               nomecria1=Fabiana Maria  sobrenomecria1=Cardoso  emailcria1=fabimariacardoso@automation.com    datanasccria1=24032018

### Reserva Walk-In ###
&{DADOSHOSPREGU_WALKIN}           nome=Beatriz Larissa    sobrenome=Sales     cpf=40097665657
&{DADOSHOSPNOVO_WALKIN}           nome=Alana Clara        sobrenome=Viana     cpf=70624731979     email=anaclaraviana@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
&{HOSP_WALKIN_0702}               cpf=41664906304
&{HOSP_WALKIN_0703}               cpf=80773811621
&{DADOSHOSPCORT_WALKIN}           nome=Alice Esther       sobrenome=Nogueira  cpf=14619846295     email=aliceesthernogueira@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM    cep=57315742    numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_WALKIN}           nome=Marlene Evelyn     sobrenome=Alves     cpf=35747328131     email=marleneealves@automation.com    func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM    cep=89224075    numend=576     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_WALKIN}           nome=Megan Fox          sobrenome=Smith     passaport=CA801161  email=meganfoxsmith@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM    lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_WALKIN}           nome=Tatiane Alessandra  sobrenome=Ramos    cpf=29872874530     email=tatialessandraramos@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
&{HOSP_WALKIN_0708}               cpf=20699808391
&{HOSP_WALKIN_0709}               cpf=45226519885
&{HOSP_WALKIN_0710}               cpf=25636118813

### Alteracao de Reserva ###
&{HOSP_RECEP_0601}                nome=Caroline Sueli     sobrenome=Silva     cpf=06085764847     email=carolsuelisilva@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
...                               datapartida=13012022    datachegada=12012022
&{HOSP_RECEP_0606}                cpf=09818385454         email=lunaheloisasilvanacampos-75@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
