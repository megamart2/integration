#!/usr/bin/perl
# 
# This is the library of reused routines. 
# 
# Copyright: Middleware Systems Research Group
# 			 University of Toronto
#
# Author:    Charles Zhang czhang@eecg.utoronto.ca
#

$out = getacchome()."/bin/accdict.pl";
require $out;

#push @INC, $ENV{'ACCHOME'};
#require "adapter/acc_constants.pl";

# This function implements the ancestor and sibling rules by fetching all the 
# preprocessed aspect files or their ".o" files that belong to ancestors (not
# current) and sibling
sub get_prefix_headers {
	my @ancestors;
	my $currentdir = `pwd`;
	my @options;
	my @features = @_;
	chomp($SRCROOT);
	chomp($currentdir);
	if($currentdir eq $SRCROOT){
		return join " ", @files;
	}
	my @list = split /\//,$currentdir;
	for($count = scalar(@list);$count>=0;$count--){
		pop(@list);
		$name = join "/",@list;
		push @ancestors, $name;
		if($name eq $SRCROOT){
			last;
		}
	}

	foreach $directory (@ancestors){
		@siblings = split /\s/, `ls $directory`;
		foreach $dir (@siblings) {
			if(!(-d $name)){
				next;
			}
			my $name = $directory."/".$dir."/*.".$EXPORTSUFFIX;
			my @files = glob($name);
			if(scalar(@files)>0){
				foreach $file(@files){
					my $out = `cat $file | grep _header`;
					my @headers = split /\n/,$out;
					foreach $header (@headers){
						my @temp = split /=/, $header;
						@temp = split /[,\s]/,$temp[1];
						foreach $temp1 (@temp){
							push @options, "-include \"".$directory."/".$dir."/".$temp1."\"";
						}
					}
				}
			}
		}
	}
	
	foreach $feature (@features){
		my $string = $feature."_header=";
		my $out = `cat $EXPORTMAP | grep $string`;
		$out =~ s/$string//;
		my @temp = split /@/,$out;
		my $location = @temp[1];
		$location =~ s/\n//;
		my @headers = split /[,\s]/,@temp[0];
		foreach $header(@headers){
			push @options, "-include \"".$location."/".$header."\""
		}
	}

	return join " ", @options;
}
	

	
sub fetch_ancestors_and_siblings {
	my $kind = $_[0];
	my @ancestors;
	my $currentdir = `pwd`;
	my @files;
	chomp($SRCROOT);
	chomp($currentdir);
	if($currentdir eq $SRCROOT){
		return @files;
	}
	my @list = split /\//,$currentdir;
	for($count = scalar(@list);$count>=0;$count--){
		pop(@list);
		$name = join "/",@list;
		push @ancestors, $name;
		if($name eq $SRCROOT){
			last;
		}
	}

	foreach $directory (@ancestors){
		$pattern = "$directory/$ACCDIR/*.$kind";
		#check that parent directory
		@files = (@files, <$directory/$ACCDIR/*.$kind>);
		#check siblings
		@siblings = split /\s/, `ls $directory`;
		foreach $dir (@siblings) {
			if(!(-d $directory."/".$dir)){
				next;
			}
			if($currentdir eq $directory."/".$dir){ 
				next;
			}
			@files = (@files, <$directory/$dir/$ACCDIR/*.$kind>);
		}
	}
	return removeDuplicates(@files);
}

sub removeDuplicateNames {
	@list = @_;
	@ret = ();
	%seen = ();
	foreach $item (@list) {
		chomp($item);
		my $name = $item;
		$name =~ s/^.*\///;
		push(@ret, $item) unless $seen{$name}++;
	}
	return @ret;
}


sub removeDuplicates {
	@list = @_;
	@ret = ();
	%seen = ();
	foreach $item (@list) {
		chomp($item);
		push(@ret, $item) unless $seen{$item}++;
	}
	return @ret;
}

sub try_cmd {
	$v = system($_[0]);
	if($v!=0){
		exit 1;
	}
}

sub get_inter_files_of_suffix{
	my @objs;
	my @locations = split /:/, $_[0];
	my $suffix = $_[1];
	foreach $location (@locations) {
		if(!(-d $location)){
			next;
		}
		my $output = `ls -R $location | grep ".*:"`;		
		my @directories = split /:\n/,$output;
		push @directories, $location; # for mac version of ls -R
		foreach $directory (@directories){
			push @objs, <$directory/$ACCDIR/*.$suffix>; # unless !($directory =~ /$ACCDIR/);
		}
	}
	return @objs;
}

sub get_object_files {
	my $original = $_[0];
	my @args = split /\s/, $original;
	my @libraries;
	my %arch, %omaps;
#	foreach $file (@args){
			#if($file =~ /.*\.(a|so)$/){
#		if($file =~ /.*\.a$/){
#			my @output = split /:\n/,`nm $file | grep ".o:"`;
#			foreach $ofile (@output){
#				if(exists($omaps{$ofile})){
#					# if duplicate in an archive file, remove it
#					if($file =~ /.*\.a$/){
#						try_cmd("ar d $file $ofile");
#					}
#				}else{
#					$omaps{$ofile}++;
#				}
#			}
#			@libraries = <@libraries, @output>;
#		}
#	}
#	@libraries = removeDuplicates(@libraries);
#	foreach $file (@libraries){
#		$arch{$file}++;
#	}
	my @objectfiles = (get_inter_files_of_suffix($GLOBAL_ASPECTS, $SUFFIX),(fetch_ancestors_and_siblings($SUFFIX),<`pwd`/$ACCDIR/*.acc>));
	@objectfiles = (@objectfiles, <./$ACCDIR/*.$SUFFIX>);
	@objectfiles = removeDuplicates(@objectfiles);
	my $newsuffix = $ACCDIR.".o"; 
	my $line = ""; 
	my @retv;
	foreach $obj (@objectfiles) {
		@parts = split "/", $obj;
		$parts[-1] =~ s/.$SUFFIX/.o/g;
		push @retv,join("/", @parts);
	}
	return @retv;
}

sub doexport {
	@exportfiles = <*.$EXPORTSUFFIX>;
	foreach $file (@exportfiles){
		$content = `cat $file`;
		my @features = split /\n/, $content;
		foreach $feature(@features){
			my @temp = split /=/,$feature;
			my @as = split /[,\s]/,$temp[1];
			foreach $a(@as){
				$a =~ s/\.acc$/_ac.acc/;
				try_cmd("cp $ACCDIR/$a $EXPORTDIR");
			}
		}
	}
}

sub buildfeaturemap {
	my $out = `ls -R $SRCROOT | grep :`;
	my @temp = split /\n/, $out;
	push @temp, $SRCROOT;
	my $currentdir, %featuremap;
	open(DAT,">>$EXPORTMAP") || die("Cannot open export file.");
	foreach $currentdir(@temp){
		$currentdir =~ s/:$//;
		@files = <$currentdir/*.$EXPORTSUFFIX>;
		foreach $file (@files){
			my $content = `cat $file`; 
			my $location = "@".$currentdir."\n";
			$content =~ s/\n/$location/g;
			print DAT $content; 
			print "\n";
		}
	}
	close(DAT);
}
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

sub keep {
	my $file = $_[0];
	my $out = `cat $file`;
	@groups = split /\n\n/,$out;
	foreach $group(@groups){
		if($group !~ /\n\t/){
			return 1;
		}
	}
}


