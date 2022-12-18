process FLO {
    label 'flo'
    tag "$sample_id1 vs $sample_id2"
    container = 'chriswyatt/flo'
             
    input:
        tuple val(sample_id1), path(fasta1), path(gff1), val(sample_id2), path(fasta2), path(gff2)

    output:    
        tuple val(sample_id1), path("${sample_id1}.chain"), path("${sample_id1}.equiv"), emit: lift

    script:
    """

    /flo/gff_longest_transcripts.rb $gff1 > ${gff1}_longest_transcripts.gff
    /flo/gff_longest_transcripts.rb $gff2 > ${gff2}_longest_transcripts.gff

    fix_template.pl $fasta1 $fasta2 ${gff1}_longest_transcripts.gff $task.cpus

    rake -f /flo/Rakefile

    """
}

