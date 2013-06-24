#!/usr/bin/perl w 
use strict; 

if ($#ARGV != 0) { 
	print 'Usage: perl get_approx_12000_lines.pl <8_timePoints_file>'; 
	exit; 
} 

open (LINES, $ARGV[0]) or die "Cannot open or read file\n"; 

my @lines = <LINES>; 

foreach my $line (@lines) { 
	chomp $line; 
	my @values = split (/\t/, $line); 

	my @averages = (); 

	my $flag_consider = 0; 
	foreach my $val (@values) {
				 
		if($val eq 'NaN') { 
			$flag_consider = 1; 
		} 
	}
	if( $flag_consider == 0) { 
 		print $line ."\n"; 
	} 
}  

