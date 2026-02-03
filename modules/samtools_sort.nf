process SAMTOOLS_SORT {

    publishDir "results/sorted", mode: 'copy'

    input:
    path sam_file

    output:
    path "sorted.bam"

    script:
    """
    ${params.samtools_bin} view -Sb $sam_file | \
    ${params.samtools_bin} sort -o sorted.bam
    """
}
