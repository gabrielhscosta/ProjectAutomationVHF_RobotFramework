*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW
Library                          FakerLibrary


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM     razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPCORT_RESIND}           nome=Emanuelly Sueli    sobrenome=Melo      email=emanusuelimelo@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM     numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_RESIND}           nome=Clarice Gabriela   sobrenome=Teixeira  email=claricegabiteixeira@automation.com       func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_RESIND}           nome=Larson James       sobrenome=Smith     passaport=CA008503  email=hazelembersmith@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM     lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_RESIND}           nome=Larissa Regina     sobrenome=Ribeiro   email=larissareginaribeiro@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM     numend=555
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355
&{DADOSHOSNOVOS_RESIND}           nome1=Julia Maite       sobrenome1=da Luz   email1=juliamaitedaluz@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Vanessa Santos    sobrenome2=da Luz   email2=vanessasantosdaluz@automation.com
&{DADOSHOSNOVOSECRIA1_RESIND}     nome1=Helena Maria      sobrenome1=Costa    email1=helenamariacosta@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Sabrina Marcia    sobrenome2=Costa    email2=sabrinamariacosta@automation.com
...                               nomecria1=Luiza Maya    sobrenomecria1=Costa  emailcria1=luizamayacosta@automation.com    datanasccria1=24032018

### Reserva Walk-In ###
&{DADOSHOSPREGU_WALKIN}           nome=Benedita Andrea    sobrenome=Lima      cpf=63898389480
&{DADOSHOSPNOVO_WALKIN}           nome=Lorena Esther      sobrenome=Castro    cpf=40075747316     email=lesthercastro@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
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
&{HOSP_RECEP_0601}                nome=Rita Luana         sobrenome=Novaes    cpf=77297892483     email=ritalunanovaes@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
...                               datapartida=16022022    datachegada=14022022
&{HOSP_RECEP_0606}                cpf=83616786622         email=carolineaparecidaelainedepaula@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
