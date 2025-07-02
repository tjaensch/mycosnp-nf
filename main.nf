#!/usr/bin/env nextflow
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    mycosnp
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Github : https://github.com/cdcent/oamd-bio-fungal-mycosnp
----------------------------------------------------------------------------------------
*/

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    IMPORT FUNCTIONS / MODULES / SUBWORKFLOWS / WORKFLOWS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

include { MYCOSNP  } from './workflows/mycosnp'
include { PIPELINE_INITIALISATION } from './subworkflows/local/utils_nfcore_mycosnp_pipeline'
include { PIPELINE_COMPLETION     } from './subworkflows/local/utils_nfcore_mycosnp_pipeline'
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NAMED WORKFLOWS FOR PIPELINE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

//
// WORKFLOW: Run main analysis pipeline depending on type of input
//
workflow PHCORE_MYCOSNP {

    take:
    samplesheet // channel: samplesheet read in from --input

    main:

    //
    // WORKFLOW: Run pipeline
    //
    MYCOSNP (
        samplesheet
    )
    emit:
    multiqc_report = MYCOSNP.out.multiqc_report // channel: /path/to/multiqc_report.html
}
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    RUN MAIN WORKFLOW
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

workflow {

    main:
    //
    // SUBWORKFLOW: Run initialisation tasks
    //
    PIPELINE_INITIALISATION (
        params.version,
        params.validate_params,
        params.monochrome_logs,
        args,
        params.outdir,
        params.input
    )

    //
    // WORKFLOW: Run main workflow
    //
    PHCORE_MYCOSNP (
        PIPELINE_INITIALISATION.out.samplesheet
    )
    //
    // SUBWORKFLOW: Run completion tasks
    //
    PIPELINE_COMPLETION (
        params.outdir,
        params.monochrome_logs,
        PHCORE_MYCOSNP.out.multiqc_report
    )
}

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    THE END
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/mycosnp
========================================================================================
    Github : https://github.com/CDCgov/mycosnp-nf
    Wiki   : https://github.com/CDCgov/mycosnp-nf/wiki
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    PRE-MYCOSNP
========================================================================================
*/

include { PRE_MYCOSNP_WF } from './workflows/pre_mycosnp'

//
// WORKFLOW: Run pre-mycosnp pipeline
//
workflow PRE_MYCOSNP {
    PRE_MYCOSNP_WF ()
}

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { MYCOSNP } from './workflows/mycosnp'

//
// WORKFLOW: Run main nf-core/mycosnp analysis pipeline
//
workflow NFCORE_MYCOSNP {
    MYCOSNP ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute the specified workflow
//
workflow {
    if (params.workflow == 'PRE_MYCOSNP') {
        PRE_MYCOSNP()
    } else if (params.workflow == 'NFCORE_MYCOSNP') {
        NFCORE_MYCOSNP()
    } else {
        log.error "Invalid workflow specified. Use 'PRE_MYCOSNP' or 'NFCORE_MYCOSNP'."
        exit 1
    }
}

/*
========================================================================================
    THE END
========================================================================================
*/
