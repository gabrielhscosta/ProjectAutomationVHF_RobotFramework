*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           nome=Ayla Andrea        sobrenome=Jesus     email=aylaandreajesus@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM     razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPCORT_RESIND}           nome=Bruna Manuela      sobrenome=Viana     email=brunamanuviana21@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM     numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_RESIND}           nome=Nicole Yasmin      sobrenome=Ferreira  email=nicoleyasminferreira@automation.com       func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_RESIND}           nome=Jennifer Abby      sobrenome=Smith     passaport=CA008503  email=madelynksmith@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM     lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_RESIND}           nome=Heloise Louise     sobrenome=Monteiro  email=heloiselmonteiro12@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM     numend=555
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355
&{DADOSHOSNOVOS_RESIND}           nome1=Isabelle Marcela  sobrenome1=Lopes    email1=isamarcelalopes@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Vitoria Liz       sobrenome2=Lopes    email2=vitorializlopes@automation.com
&{DADOSHOSNOVOSECRIA1_RESIND}     nome1=Luna Valentina    sobrenome1=Ferraz   email1=lunavalentinaferraz@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM
...                               nome2=Stefany Sara      sobrenome2=Ferraz   email2=stefanysaraferraz@automation.com
...                               nomecria1=Andrea Sonia  sobrenomecria1=Ferraz  emailcria1=andreasoniaferraz@automation.com    datanasccria1=24032018

### Reserva Walk-In ###
&{DADOSHOSPREGU_WALKIN}           nome=Carolina Juliana   sobrenome=da Rocha  cpf=22819189393
&{DADOSHOSPNOVO_WALKIN}           nome=Daniela Cecilia    sobrenome=Alves     cpf=07502748679     email=danielacalves@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=24031990   doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
&{HOSP_WALKIN_0702}               cpf=41664906304
&{HOSP_WALKIN_0703}               cpf=80773811621
&{DADOSHOSPCORT_WALKIN}           nome=Carolina Helena    sobrenome=das Neves  cpf=97897151450     email=carolinadasneves21@automation.com
...                               cidade=Arapiraca        idioma=Portug       datanasc=26101990   doc=EM    cep=57315742    numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_WALKIN}           nome=Heloisa Alice      sobrenome=Melo      cpf=65976444849     email=heloisaalicemelo@automation.com    func=Gabriel
...                               cidade=Joinville        idioma=Portug       datanasc=16081990   doc=EM    cep=89224075    numend=576     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_WALKIN}           nome=Ashley Banks       sobrenome=Smith     passaport=CA430201  email=camilaesmith@automation.com
...                               cidade=San Diego        idioma=Ingles       datanasc=26061990   doc=EM    lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_WALKIN}           nome=Stella Rita        sobrenome=Araujo    cpf=16892129340     email=stellaritaaraujo@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
&{HOSP_WALKIN_0708}               cpf=20699808391
&{HOSP_WALKIN_0709}               cpf=45226519885
&{HOSP_WALKIN_0710}               cpf=25636118813

### Alteracao de Reserva ###
&{HOSP_RECEP_0606}                cpf=09818385454         email=lunaheloisasilvanacampos-75@automation.com
...                               cidade=Maceio           idioma=Portug       datanasc=27021990   doc=EM    cep=57010368    numend=555
