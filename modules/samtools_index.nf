process SAMTOOLS_INDEX {

    publishDir "results/index", mode: 'copy'

    input:
    path bam_file

    output:
    path "sorted.bam.bai"

    script:
    """
    ${params.samtools_bin} index $bam_file
    """
}
