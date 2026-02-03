process FASTQC {

    tag "$reads"

    publishDir "results/fastqc", mode: 'copy'

    input:
    path reads

    output:
    path "*_fastqc.zip"
    path "*_fastqc.html"

    script:
    """
    ${params.fastqc_bin} $reads
    """
}
