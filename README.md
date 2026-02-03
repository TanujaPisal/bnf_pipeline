# BNF_PIPELINE

A modular Nextflow DSL2 pipeline for variant calling from FASTQ reads.

---

## Pipeline Steps

1. FastQC (Raw reads quality control)
2. Cutadapt (Adapter trimming)
3. FastQC (Post-trimming QC)
4. BWA MEM (Alignment to reference genome)
5. SAMTOOLS (Sorting and Indexing)
6. BCFTOOLS (Variant calling)
7. Output: VCF file

---

## Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/BNF_Pipeline.git
cd BNF_Pipeline
