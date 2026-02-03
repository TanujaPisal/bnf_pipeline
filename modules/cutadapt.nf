process CUTADAPT {

    tag "$reads"

    publishDir "results/cutadapt", mode: 'copy'

    input:
    path reads

    output:
    path "trimmed.fastq"

    script:
    """
    ${params.cutadapt_bin} -q 20 -o trimmed.fastq $reads
    """
}
