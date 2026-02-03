include { FASTQC as FASTQC_RAW } from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIM } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { BWA_ALIGN } from '../modules/bwa_align.nf'
include { SAMTOOLS_SORT } from '../modules/samtools_sort.nf'
include { SAMTOOLS_INDEX } from '../modules/samtools_index.nf'
include { VARIANT_CALL } from '../modules/bcftools_call.nf'

workflow main_workflow {

    reads_ch = Channel.fromPath(params.input)

    FASTQC_RAW(reads_ch)

    trimmed = CUTADAPT(reads_ch)

    FASTQC_TRIM(trimmed)

    aligned = BWA_ALIGN(trimmed)

    sorted = SAMTOOLS_SORT(aligned)

    indexed = SAMTOOLS_INDEX(sorted)

    VARIANT_CALL(sorted)
}
