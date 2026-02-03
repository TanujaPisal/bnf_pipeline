process VARIANT_CALL {

    publishDir "results/variants", mode: 'copy'

    input:
    path bam_file

    output:
    path "variants.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -f ${params.ref_genome} $bam_file | \
    ${params.bcftools_bin} call -mv -o variants.vcf
    """
}
