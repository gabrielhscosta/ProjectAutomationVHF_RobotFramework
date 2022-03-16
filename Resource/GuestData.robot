*** Settings ***
Library                          WhiteLibrary
Library                          SikuliLibrary            mode=NEW


*** Variable ***
### Reserva Individual ###
&{DADOSHOSPNOVO_RESIND}           cidade=Maceio       idioma=Portug   datanasc=24031990   datanasccria1=24032018      doc=EM
...                               cep=57062422        numend=757      razaosocialemp=4U TURISMO
&{HOSP_RESIND_0102}               cpf=51233681672
&{HOSP_RESIND_0103}               cpf=15911094851
&{DADOSHOSPESTR_RESIND}           cidade=San Diego    idioma=Ingles   datanasc=26061990   doc=EM
&{HOSP_RESIND_0108}               cpf=24794249870
&{HOSP_RESIND_0109}               cpf=50309813220
&{HOSP_RESIND_0110}               cpf=99742326355

### Reserva Walk-In ###
&{DADOSHOSPNOVO_WALKIN}           cidade=Maceio       idioma=Portug   datanasc=24031990   doc=EM   cep=57062422
...                               numend=757          razaosocialemp=4U TURISMO
&{HOSP_WALKIN_0702}               cpf=41664906304
&{HOSP_WALKIN_0703}               cpf=80773811621
&{DADOSHOSPESTR_WALKIN}           passaport=CA830632  cidade=San Diego        idioma=Ingles        datanasc=26061990  doc=EM  lograd=Goetze Street
...                               doc=EM              lograd=Goetze Street    numend=2535          bairro=Paradise Hills
&{HOSP_WALKIN_0708}               cpf=20699808391
&{HOSP_WALKIN_0709}               cpf=45226519885
&{HOSP_WALKIN_0710}               cpf=25636118813

### Alteracao de Reserva ###
&{HOSP_RECEP_0601}                datapartida=13032022  datachegada=10032022
&{HOSP_RECEP_0602}                datapartida=13032022
&{HOSP_RECEP_0606}                cpf=83616786622     cep=57010368    numend=555
