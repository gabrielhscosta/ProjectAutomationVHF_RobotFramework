*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           nome=Lucia Juliana      sobrenome=Freitas    email=luciajfreitas@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=24031990   doc=EM     razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPCORT_RESIND}           nome=Melissa Josefa     sobrenome=da Costa  email=melissajosefadacosta@automation.com
...                               cidade=Arapiraca        idioma=Portug      datanasc=26101990   doc=EM     numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_RESIND}           nome=Cristiane Caroline  sobrenome=Teixeira   email=cristinacarolinateixeira@automation.com       func=Gabriel
...                               cidade=Joinville        idioma=Portug      datanasc=16081990   doc=EM     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_RESIND}           nome=Madelyn Kirthen    sobrenome=Smith    passaport=CA009123  email=madelynksmith@automation.com
...                               cidade=San Diego        idioma=Ingles      datanasc=26061990   doc=EM     lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_RESIND}           nome=Fatima Priscila    sobrenome=da Mata  email=fatimapridamata@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=27021990   doc=EM     numend=555
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355
&{DADOSHOSNOVOS_RESIND}           nome1=Josefa Luzia      sobrenome1=Porto   email1=josefaluziaporto@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=24031990   doc=EM
...                               nome2=Giovana Bianca    sobrenome2=Porto  email2=giovanabporto@automation.com
&{DADOSHOSNOVOSECRIA1_RESIND}     nome1=Maya Bruna        sobrenome1=Martins  email1=mayabrunamartins@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=24031990   doc=EM
...                               nome2=Nair Maite        sobrenome2=Martins  email2=nairmaitemartins@automation.com
...                               nomecria1=Sarah Mariane  sobrenomecria1=Martins  emailcria1=sarahmarimartins@automation.com    datanasccria1=24032018

### Reserva Walk-In ###
&{DADOSHOSPREGU_WALKIN}           nome=Maite Betina       sobrenome=Baptista  cpf=93209771359
&{DADOSHOSPNOVO_WALKIN}           nome=Lucia Stella       sobrenome=Baptista  cpf=45133501480    email=luciastella2021@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=24031990    doc=EM    cep=57062422    numend=757     razaosocialemp=4U TURISMO
&{HOSP_WALKIN_0702}               cpf=41664906304
&{HOSP_WALKIN_0703}               cpf=80773811621
&{DADOSHOSPCORT_WALKIN}           nome=Malu Regina        sobrenome=Farias   cpf=13462567802      email=malureginafarias@automation.com
...                               cidade=Arapiraca        idioma=Portug      datanasc=26101990    doc=EM    cep=57315742    numend=411     motdesc=Autorizado pela Gerencia
&{DADOSHOSPUKSA_WALKIN}           nome=Priscila Marlene   sobrenome=Nogueira  cpf=36134298026      email=primarlenenogueira@automation.com    func=Gabriel
...                               cidade=Joinville        idioma=Portug      datanasc=16081990    doc=EM    cep=89224075    numend=576     motdesc=Autorizado pela Gerencia
&{DADOSHOSPESTR_WALKIN}           nome=May Hilary         sobrenome=Smith    passaport=CA432011   email=mayhilarysmith21@automation.com
...                               cidade=San Diego        idioma=Ingles      datanasc=26061990    doc=EM    lograd=Goetze Street    numend=2535    bairro=Paradise Hills
&{DADOSHOSPGRID_WALKIN}           nome=Mariah Isadora     sobrenome=Souza    cpf=64613285720      email=mariahisasouza1@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=27021990    doc=EM    cep=57010368    numend=555
&{HOSP_WALKIN_0708}               cpf=20699808391
&{HOSP_WALKIN_0709}               cpf=45226519885
&{HOSP_WALKIN_0710}               cpf=25636118813

### Alteracao de Reserva ###
&{HOSP_RECEP_0606}                cpf=09818385454         email=lunaheloisasilvanacampos-75@automation.com
...                               cidade=Maceio           idioma=Portug      datanasc=27021990    doc=EM    cep=57010368    numend=555
