process FLO {
    label 'download'
    tag "$sample_id1 vs $sample_id2"
    container chriswyatt/flo
             
    input:
        tuple val(sample_id1), path(fasta1), path(gff1), val(sample_id2), path(fasta2), path(gff2)

    output:    
        tuple val(sample_id1), path("${sample_id1}.chain"), path("${sample_id1}.equiv"), emit: lift

    script:
    """

    /flo/gff_longest_transcripts.rb $gff1 > ${gff1}_longest_transcripts.gff
    /flo/gff_longest_transcripts.rb $gff2 > ${gff2}_longest_transcripts.gff

    cp /flo/opts_example.yaml flo_opts.yaml

    rake -f /flo/Rakefile

    """
}

