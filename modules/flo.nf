process FLO {
    label 'flo'
    tag "$sample_id1 vs $sample_id2"
    container = 'chriswyatt/flo'
    publishDir "$params.outdir/Lift" , mode: "copy", pattern: "*ted.gff3"
    errorStrategy 'ignore'
             
    input:
        tuple val(sample_id1), path(fasta1), path(gff1), val(sample_id2), path(fasta2), path(gff2)

    output:    
        tuple val(sample_id1), path("unlifted.gff3"), path("lifted.gff3"), emit: lift

    script:
    """
    unzip_fagff.pl $sample_id1 $fasta1 $gff1 $sample_id2 $fasta2 $gff2

    /flo/gff_longest_transcripts.rb ${sample_id1}.flo.gff3 > ${sample_id1}_longest_transcripts.gff
    /flo/gff_longest_transcripts.rb ${sample_id2}.flo.gff3 > ${sample_id2}_longest_transcripts.gff

    fix_template.pl ${sample_id1}.flo.fa ${sample_id2}.flo.fa ${sample_id1}_longest_transcripts.gff $task.cpus

    rake -f /flo/Rakefile

    cp run/`*/unlifted.gff3 ./unlifted.gff3
    cp run/*/lifted.gff3 ./lifted.gff3

    """
}

