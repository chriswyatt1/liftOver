#!/usr/bin/perl
#Bed_to_histogram.pl
use warnings;
use strict;

die "Provide the name of the input file genome genome gff and cpu \n" if (@ARGV!=4); 

print "Script is running\n";

my $GENOME1  = $ARGV[0];
my $GENOME2  = $ARGV[1];
my $GFF      = $ARGV[2];
my $CPU      = $ARGV[3];



my $outfile="flo_opts.yaml";
open(my $out, "> $outfile") or die "error opening $outfile. $!";


print $out "# Location of binaries expected by flo.
#
# These will be added to PATH before the pipeline is run. The paths below
# are created by `scripts/install.sh`.Comment out or edit the paths based
# on how you installed UCSC-Kent toolkit, GNU Parallel and genometools.
:add_to_path:
  - '/ext/kent/bin'
  - '/ext/parallel-20150722/src'
  - '/ext/genometools-1.5.6/bin'

# Location of source and target assemblies.
#
# If migrating annotations from assembly A to assembly B, A is the source
# and B is the target. Source and target assemblies are specified as path
# to the corresponding FASTA files (must end in .fa).


:source_fa: '$GENOME1'
:target_fa: '$GENOME2'


# Number of processes that will be used to parallelise flo. Ideally, this
# will be the number of CPU cores you have.
:processes: '$CPU'

# Parameters to run BLAT with.
#
# In addition to the options specified here, -noHead option is set by flo.
# -noHead simply causes the output BLAT output files to not have a header.
# It doesn't impact accuracy of results.
#
# Empty string is equivalent to:
#
#   -t=dna -q=dna -tileSize=11 -stepSize=11 -oneOff=0 -minMatch=2
#   -minScore=30 -minIdentity=90 -maxGap=2 -maxIntron=75000
#
# The default string defined below is a suitable trade-off between running
# time and sensitivity.
:blat_opts: '-fastMap -tileSize=12 -minIdentity=98'

# Path to the GFF files containing annotations on the source assembly that
# will be lifted to the target assembly.
:lift:
  - '$GFF'


";
