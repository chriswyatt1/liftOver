#!/usr/bin/perl
use warnings;
use strict;

die "Needs the input sample_id, gff3 file and the fasta file TWICE\n" if (@ARGV!=6); 

#print "Script is running\n";

my $sample=$ARGV[0];

if ($ARGV[1] =~ m/.gz$/){
	`zcat $ARGV[1] > $sample\.flo.fa`;
}
else{
	`cp  $ARGV[1] $sample\.flo.fa`;
}

if ($ARGV[2] =~ m/.gz$/){
	`zcat $ARGV[2] > $sample\.flo.gff3`;
}
else{
	`cp $ARGV[2] $sample\.flo.gff3`;
}


my $sample2=$ARGV[3];

if ($ARGV[4] =~ m/.gz$/){
        `zcat $ARGV[4] > $sample2\.flo.fa`;
}
else{
        `cp  $ARGV[4] $sample2\.flo.fa`;
}

if ($ARGV[5] =~ m/.gz$/){
        `zcat $ARGV[5] > $sample2\.flo.gff3`;
}
else{
        `cp $ARGV[5] $sample2\.flo.gff3`;
}
