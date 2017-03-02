#!/usr/bin/perl
open CSV, 'input.csv';
open TEX,  '>output.tex';

while(<CSV>){
	chomp;
	$line = $_;
	s/,/&/g;
	select TEX;
	print "$_\\hline\n";
}
