# Nextflow QC, Alignment and Variant Calling Pipeline

---

## Overview

This project implements a modular **Nextflow DSL2 pipeline** for basic NGS data preprocessing and variant calling.

The pipeline performs:

- Quality Control (FastQC)
- Adapter trimming (Cutadapt)
- Post-trimming QC
- Read alignment (BWA)
- BAM sorting and indexing (Samtools)
- Variant calling (BCFtools)

---

## Pipeline Workflow

Raw FASTQ  
↓  
FastQC (Raw Reads)  
↓  
Read Trimming  
↓  
FastQC (Trimmed Reads)  
↓  
Read Alignment (SAM → BAM)  
↓  
Sorting & Indexing  
↓  
Variant Calling (VCF generation)

---

## Pipeline Steps

### Step 1: Raw Read Quality Control
- Performs quality assessment on raw FASTQ reads
- Generates reports for base quality, GC content, adapters

**Tool:** FastQC

---

### Step 2: Read Trimming
- Removes low-quality bases and adapters
- Improves read quality for downstream analysis

**Tool:** Cutadapt

---

### Step 3: Quality Control After Trimming
- Runs FastQC on trimmed reads
- Confirms improvement in read quality

**Tool:** FastQC

---

### Step 4: Read Alignment
- Aligns trimmed reads to the reference genome
- Generates sorted and indexed BAM file

**Tools:** BWA, Samtools

---

### Step 5: Variant Calling
- Performs variant calling from BAM file
- Generates VCF file containing SNPs/variants

**Tool:** BCFtools

---

## Input Data

- Single FASTQ file  
  `data/Sample.fastq`

- Reference genome  
  `reference/reference.fa`

---

## Output

- FastQC reports (raw and trimmed)
- Trimmed FASTQ file
- Sorted BAM file
- BAM index (.bai)
- VCF file

---

## Project Structure

```
bnf_pipeline/
│
├── data/
├── reference/
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── bwa_align.nf
│   ├── samtools_sort.nf
│   ├── samtools_index.nf
│   └── bcftools_call.nf
│
├── workflows/
│   └── workflow.nf
│
├── main.nf
├── nextflow.config
├── environment.yml
└── README.md
```

---

## Clone the Repository

```bash
git clone https://github.com/TanujaPisal/bnf_pipeline.git
cd bnf_pipeline
```

---

## Create and Activate Conda Environment

```bash
conda env create -f environment.yml
conda activate nf_env
```

---

## Run the Pipeline

```bash
nextflow run main.nf
```

To resume:

```bash
nextflow run main.nf -resume
```

---

## Requirements

- Linux / WSL
- Conda
- Nextflow
