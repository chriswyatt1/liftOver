# FLO-nextflow

Nextflow pipeline to run Flo

Please cite "The fire ant social chromosome supergene variant Sb shows low diversity but high divergence from SB. 2017. R Pracana, A Priyam, I Levantis, Y Wurm. Molecular Ecology, doi: 10.1111/mec.14054.""

# General information

TO COMPLETE

# Run with Gitpod (recommended)

Prerequistites : 
- A browser (Ideally, Chrome or Firefox \[tested\]).
- Github account.

Optional: Add a PDF viewer extension in Gitpod. Go to Extensions on left hand side, and install `vscode.pdf`. 

The simplest way to run the pipeline is to use Gitpod. This is a free (up to 50 hours a month) cloud environment, which has been loaded with all the tools you need.

Simply click this link: https://gitpod.io/#https://github.com/chriswyatt1/flo

Then login in to Github, which will open up an environment to run the code, using the same command listed above (nextflow...).

The example run is below (using two public genomes):

`nextflow run main.nf -profile docker -bg -resume --input data/Example.csv`


# Run locally

Prerequistites : 
- Docker. Make sure it is active log in on your machine.
- Java at least 1.8.
- Nextflow installed (https://www.nextflow.io/; v22 and above [DSL2].
- Git.

To clone the repo: `git clone https://github.com/chriswyatt1/flo`

Then `cd` into the repository on your machine.

To run Nextflow (locally with docker installed), use the following command:

`nextflow run main.nf -profile docker -bg -resume --input data/Example.csv`

#Notice, we use one `-` for Nextflow options, and two `--` for pipeline options.


# Changing the input 

Our example input template looks like this (Example.csv):

```
D_melanogaster,GCF_000001215.4
A_mellifera,GCF_003254395.2
```

You can also run your own genomes through this program (or mixed with NCBI ones), using the following format:

```
B_impatiens,/path/to/Desktop/B_impatiens_Genome**.fasta**,/path/to/Desktop/B_impatiens**.gff**
A_mellifera,GCF_003254395.2
```

Where NCBI input has two comma separated columns and your own data has three coloumns (Name, Genome.fasta and GFF file). To upload data simply drop an drag your files into the explorer on the left hand side. Or use public data as previously specified (or mix and match them). 


# Results




# Testing scripts in Docker 

To try out the individual scripts used in this workflow, check out the various containers used in conf/docker.config.

Then you can enter the container by typing the following:

`docker run -it chriswyatt/flo bash`

use exit to leave the container:

`exit`

You can also enter docker with the same filesystem using:

`docker run -it -v "$PWD":"$PWD" chriswyatt/flo bash`
