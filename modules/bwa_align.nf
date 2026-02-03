process BWA_ALIGN {

    publishDir "results/alignment", mode: 'copy'

    input:
    path reads

    output:
    path "aligned.sam"

    script:
    """
    ${params.bwa_bin} mem ${params.ref_genome} $reads > aligned.sam
    """
}
