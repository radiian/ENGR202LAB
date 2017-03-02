#!/usr/bin/perl
open CSV, 'input.csv';
open TEX,  '>output.tex';

select CSV;
$fline = <CSV>;
$str = $fline;
@c = ($fline =~ m/\,/g);
$count = @c +1;
#select SDTOUT;
#print "There are $count columns\n";
select TEX;
print "\\begin{tabular}{";
for($i = 0; $i < $count; $i++){
	print "|c";
}
print "|}\n\\hline\n";
chomp $str;
$str =~ s/,/&/g;
print "$str\\\\\n\\hline\n";
#print "$_\\\\\n\\hline\n";
while(<CSV>){
	chomp;
	
	s/,/&/g;
	select TEX;
	print "$_\\\\\n\\hline\n";
}
print "\\end{tabular}";
