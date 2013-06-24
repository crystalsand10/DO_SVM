#!/usr/bin/perl -w 
use strict; 

# the aim of this script is to avaerage the values of the 9 time points
# class I
# double averaging of basal time points 

if($#ARGV != 0) { 
	print "Usage: perl average.pl <9_timepoints_file>\n"; 
	exit; 
} 

open (DATA, $ARGV[0]) or die "Cannot open file \n"; 
my @data = <DATA>; 

my $first_two_lines = 0; 
foreach my $line (@data) { 
	if($first_two_lines < 2) { 
		$first_two_lines = $first_two_lines + 1; 
		next; 
	} 	
	chomp $line; 
	my @vals = split(/\t/, $line); 
	my $basal_1 = average_basal($vals[0], $vals[2], $vals[3], $vals[4]); 
	my $basal_2 = average_basal($vals[12], $vals[13], $vals[14], $vals[15]);
	my $basal_3 = average_basal($vals[24], $vals[25], $vals[26], $vals[27]); 
	my $basal_avg = average_basal($basal_1, $basal_2, $basal_3);  
	my $sec15_avg = average_basal($vals[5], $vals[16],  $vals[28]); 
	my $sec30_avg = average_basal($vals[6], $vals[17], $vals[29]); 
	my $min1_avg = average_basal($vals[7], $vals[18], $vals[30]);
	my $min2_avg = average_basal($vals[8], $vals[19], $vals[31]); 
	my $min5_avg = average_basal($vals[9], $vals[20], $vals[32]); 
	my $min10_avg = average_basal($vals[10], $vals[21], $vals[33]); 
	my $min20_avg = average_basal($vals[11], $vals[22], $vals[34]); 
	my $min60_avg = average_basal($vals[12], $vals[23], $vals[35]); 
		
	print $basal_avg."\t".$sec15_avg."\t".$sec30_avg."\t". $min1_avg."\t".$min2_avg."\t". $min5_avg. "\t". $min10_avg. "\t". $min20_avg . "\t". $min60_avg. "\n"; 
} 


sub average_basal{ 
	my (@values) = (@_); 
	
	my $counter = 0;
	my $average = 0;   
	foreach my $val (@values) { 
		if( $val !~ /NaN/) { 
			$average = $average + $val; 
			$counter = $counter + 1; 
		} 
	} 
	
	if($counter != 0) { 
		$average = $average/$counter; 
		return $average; 
	} 
	elsif($counter ==0 )  { 
		return 'NaN'; 
	} 
	

} 
