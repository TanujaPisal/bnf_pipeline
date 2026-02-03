# 🧬 Nextflow QC, Alignment & Variant Calling Pipeline

![Nextflow](https://img.shields.io/badge/Nextflow-DSL2-brightgreen)
![Conda](https://img.shields.io/badge/Conda-Environment-blue)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20WSL-lightgrey)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 📌 Overview

This repository contains a **modular Nextflow DSL2 pipeline** for basic **NGS data preprocessing and variant calling**.

The workflow processes a single FASTQ file and performs:

- 🔍 Quality Control
- ✂️ Adapter trimming
- 📊 Post-trimming QC
- 🧬 Read alignment
- 📁 BAM sorting & indexing
- 🧪 Variant calling (VCF generation)

---

## 🧭 Pipeline Workflow

```
Raw FASTQ
    │
    ▼
FastQC (Raw Reads)
    │
    ▼
Cutadapt (Trimming)
    │
    ▼
FastQC (Trimmed Reads)
    │
    ▼
BWA MEM (Alignment)
    │
    ▼
Samtools Sort
    │
    ▼
Samtools Index
    │
    ▼
BCFtools Variant Calling
    │
    ▼
VCF Output
```

---

## 🛠️ Pipeline Modules

| Step | Process | Tool Used |
|------|--------|-----------|
| 1 | Raw Quality Control | FastQC |
| 2 | Read Trimming | Cutadapt |
| 3 | Post-trimming QC | FastQC |
| 4 | Alignment | BWA |
| 5 | Sorting & Indexing | Samtools |
| 6 | Variant Calling | BCFtools |

---

## 📂 Input

- 📄 FASTQ file  
  `data/Sample.fastq`

- 🧬 Reference genome  
  `reference/reference.fa`

---

## 📤 Output

- 📊 FastQC reports (raw & trimmed)
- ✂️ Trimmed FASTQ file
- 📁 Sorted BAM file
- 📌 BAM index (.bai)
- 🧬 VCF file containing variants

---

## 🗂️ Project Structure

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
├── .gitignore
└── README.md
```

---

## 🚀 Installation

### 1️⃣ Clone Repository

```bash
git clone https://github.com/TanujaPisal/bnf_pipeline.git
cd bnf_pipeline
```

---

### 2️⃣ Create Conda Environment

```bash
conda env create -f environment.yml
conda activate nf_env
```

---

### 3️⃣ Run the Pipeline

```bash
nextflow run main.nf
```

To resume execution:

```bash
nextflow run main.nf -resume
```

---

## 🧪 Technical Details

- Implemented using **Nextflow DSL2 modular design**
- Uses **absolute binary paths defined in nextflow.config**
- Modules are separated for scalability
- Environment reproducibility ensured using `environment.yml`

---

## 🎓 Academic Context

This pipeline was developed as part of an NGS workflow implementation assignment focusing on:

- Modular pipeline design
- Reproducible bioinformatics workflows
- Variant calling using open-source tools

---