/*
 * Copyright (c) 2022
 */

 /*
 * Authors:
 * - Chris Wyatt <chris.wyatt@seqera.io>
 */

/*
 * Default pipeline parameters (on test data). They can be overriden on the command line eg.
 * given `params.name` specify on the run command line `--name My_run_v1`.
 */
 
params.outdir = "Results"
params.input = "Example.csv"
//params.cpu=6


log.info """\
 ===================================
 input file                           : ${params.input}
 output directory                     : ${params.outdir}
 """

//================================================================================
// Include modules
//================================================================================

include { DOWNLOAD_NCBI } from './modules/download_ncbi.nf'
include { FLO } from './modules/flo.nf'

Channel
    .fromPath(params.input)
    .splitCsv()
    .branch { 
        ncbi: it.size() == 2 
        local: it.size() == 3
    }
    .set { input_type }


workflow {

    DOWNLOAD_NCBI ( input_type.ncbi )

    my_ch = DOWNLOAD_NCBI.out.genome.mix(input_type.local)

    FLO ( my_ch.combine(my_ch).filter{ it[0] != it[3] } )
    
}

workflow.onComplete {
    println ( workflow.success ? "\nDone! Check results in $params.outdir/ \n" : "Hmmm .. something went wrong\n" )
}
