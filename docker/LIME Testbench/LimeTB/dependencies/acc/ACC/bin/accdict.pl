#!/usr/bin/perl

# 
# A script that defines project specific global settings
# 
# Copyright: Middleware Systems Research Group
# 			 University of Toronto
#
# Author:    Charles Zhang czhang@eecg.utoronto.ca
#

use Cwd;
#my $curdir = getcwd();
$ACCBOOTSTRAP = "-bootstrappath";
$ACCHOME = getacchome();
$ACCLIB = $ACCHOME."/lib/libacc.a";
$ACC = $ACCHOME."/bin/acc"; # the acc compiler
$ACCDIR = ".acc_dir"; # directory used for weaving
$ACCOPTION = "-acc-option";
$CC = "gcc"; 
$CXX = "g++"; 
$PREFIX_HEADER_NAME = "prefix.include"; # the file used to define headers for introducing new types to structs
$SUFFIX = "acc"; #suffix for acc files
$CSUFFIX = "c"; #suffix for acc files
$CPPSUFFIX = "^.*(\\.cc|\\.cpp)\$"; #suffix for acc files
$SRCROOT = $ENV{'SRCROOT'}; # used for global settings and the current/sibling rule
$GLOBAL_ASPECTS = $ENV{'GAPATH'};
$GLOBAL_ASPECTS = join "/", split "\/",$GLOBAL_ASPECTS; #get rid of the trailing "/"
$EXPORTSUFFIX = "export";
$GTEMP = $SRCROOT."/.accmake";
$EXPORTMAP = $GTEMP."/exportmap";
$EXPORTDIR = $GTEMP."/export";
$LINKER = $CC;
$MATCHINFOFILE = "accmatchinfo";
$NOASPECTSFLAG = "-noaspects";

sub getacchome {
	if($ACCBOOTSTRAPPATH ne ""){
		return $ACCBOOTSTRAPPATH;
	}
	my $out = `which tacc`;
	chomp($out);
	if($out =~ /no tacc/ || $out eq ""){
		die "Cannot find tacc on the path. Please make sure tacc is on your path";
	}
	$out =~ s/\/bin\/tacc//;
	return $out;
}
return 1;
