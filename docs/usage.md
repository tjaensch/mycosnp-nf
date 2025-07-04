<<<<<<< HEAD
# mycosnp: Usage

> _Documentation of pipeline parameters is generated automatically from the pipeline schema and can no longer be found in markdown files._

## Introduction

<!-- TODO nf-core: Add documentation about anything specific to running your pipeline. For general topics, please point to (and add to) the main nf-core website. -->

## Samplesheet input

You will need to create a samplesheet with information about the samples you would like to analyse before running the pipeline. Use this parameter to specify its location. It has to be a comma-separated file with 3 columns, and a header row as shown in the examples below.

```bash
=======
# CDCgov/mycosnp-nf: Usage

## Introduction
This document describes how to prepare input files and run the pipeline.

## Table of Contents
- [Setup and prerequisites](#setup-and-prerequisites)
    - [Requirements](#requirements)
    - [Installation](#installation)
    - [Updating the pipeline](#updating-the-pipeline)
    - [Reproducibility](#reproducibility)
- [Parameters](#parameters)
- [Inputs common to both workflows](#inputs-common-to-both-workflows)
    - [Samplesheet input](#samplesheet-input)
        - [Multiple runs of the same sample](#multiple-runs-of-the-same-sample)
        - [Full samplesheet](#full-samplesheet)
    - [Samplesheet creation - automated](#samplesheet-creation---automated)
    - [SRA sequence file additions](#sra-sequence-file-additions)
- [Pre-MycoSNP workflow](#pre-mycosnp-workflow)
    - [Inputs specific to the Pre-MycoSNP workflow](#inputs-specific-to-the-pre-mycosnp-workflow)
        - [Sourmash subtype database](#sourmash-subtype-database)
    - [Running the Pre-MycoSNP workflow](#running-the-pre-mycosnp-workflow)
- [Main MycoSNP workflow (default workflow)](#main-mycosnp-workflow-default-workflow)
    - [Inputs specific to the main MycoSNP workflow](#inputs-specific-to-the-main-mycosnp-workflow)
        - [Reference input](#reference-input)
        - [VCF file additions](#vcf-file-additions)
    - [Running the main MycoSNP workflow](#running-the-main-mycosnp-workflow)
- [General nf-core documentation](#general-nf-core-documentation)
    - [Core Nextflow arguments](#core-nextflow-arguments)
    - [Custom configuration](#custom-configuration)
        - [Resource requests](#resource-requests)
        - [Updating containers](#updating-containers)
        - [nf-core/configs](#nf-coreconfigs)
    - [Running in the background](#running-in-the-background)
    - [Nextflow memory requirements](#nextflow-memory-requirements)

# Setup and prerequisites

## Requirements

* Nextflow >= 21.10.3
* Java 17 or later
* Bash 3.2 or later
* [One of the container runtimes supported by Nextflow](https://www.nextflow.io/docs/latest/container.html#container-page) (Docker and Apptainer/Singularity are most popular). You can also use Conda, but this isn't recommended.
> [!TIP]
> Using Apptainer/Singularity with Nextflow version >=23 can result in failures in Linux server environments due to peculiarities with container directory mounting. If you are experiencing `No such file or directory` errors, try running with an earlier version of Nextflow (we've had success with 22.10.6).

## Installation

*   mycosnp-nf is written in [Nextflow](https://www.nextflow.io/), and as such requires Nextflow installation to run. Please see [nextflow installation documents](https://www.nextflow.io/docs/latest/install.html) for instructions.

*  To clone [mycosnp-nf github repo](https://github.com/CDCgov/mycosnp-nf):

```console
git clone https://github.com/CDCgov/mycosnp-nf
```

*   Alternatively, `mycosnp-nf` can be run directly like so. The repo will be cloned in `~/.nextflow/assets/CDCgov/mycosnp-nf/`:

```console
nextflow run CDCgov/mycosnp-nf -profile singularity,test
```

## Updating the pipeline

When you run the above command, Nextflow automatically pulls the pipeline code from GitHub and stores it as a cached version. When running the pipeline after this, it will always use the cached version if available - even if the pipeline has been updated since. To make sure that you're running the latest version of the pipeline, make sure that you regularly update the cached version of the pipeline:

```console
nextflow pull CDCgov/mycosnp-nf
```

## Reproducibility

It is a good idea to specify a pipeline version when running the pipeline on your data. This ensures that a specific version of the pipeline code and software are used when you run your pipeline. If you keep using the same tag, you'll be running the same version of the pipeline, even if there have been changes to the code since.

First, go to the [CDCgov/mycosnp-nf releases page](https://github.com/CDCgov/mycosnp-nf/releases) and find the latest version number (eg. `v1.6.0`). Then specify this when running the pipeline with `-r` (one hyphen) - e.g. `-r v1.6.0`.

This version number will be logged in reports when you run the pipeline, so that you'll know what you used when you look back in the future.

# Parameters

Parameter documentation is available in [docs/params.md](params.md). You can also see full pipeline parameters by using `--help`:

```console
nextflow run main.nf --help
# Or
nextflow run CDCgov/mycosnp-nf --help
```

Some parameters are hidden, but can be seen by using the `--show_hidden_params` option:

```console
nextflow run main.nf -help --show_hidden_params
# Or
nextflow run CDCgov/mycosnp-nf -help --show_hidden_params
```

# Inputs common to both workflows

## Samplesheet input

You will need to create a samplesheet with information about the samples you would like to analyse before running either workflow. Use the `--input` parameter to specify its location. It has to be a comma-separated file (csv) with at least 3 columns, and a header row as shown in the examples below.

```console
>>>>>>> mycosnp-nf-source/master
--input '[path to samplesheet file]'
```

### Multiple runs of the same sample

<<<<<<< HEAD
The `sample` identifiers have to be the same when you have re-sequenced the same sample more than once e.g. to increase sequencing depth. The pipeline will concatenate the raw reads before performing any downstream analysis. Below is an example for the same sample sequenced across 3 lanes:

```csv title="samplesheet.csv"
sample,fastq_1,fastq_2
CONTROL_REP1,AEG588A1_S1_L002_R1_001.fastq.gz,AEG588A1_S1_L002_R2_001.fastq.gz
CONTROL_REP1,AEG588A1_S1_L003_R1_001.fastq.gz,AEG588A1_S1_L003_R2_001.fastq.gz
CONTROL_REP1,AEG588A1_S1_L004_R1_001.fastq.gz,AEG588A1_S1_L004_R2_001.fastq.gz
=======
The `sample` identifiers have to be the same when you have re-sequenced the same sample more than once e.g. to increase sequencing depth. The workflow will concatenate the raw reads before performing any downstream analysis. Below is an example for the same sample sequenced across 3 lanes:

```console
sample,fastq_1,fastq_2,fastq_3,fastq_4
CONTROL_REP1,AEG588A1_S1_L002_R1_001.fastq.gz,AEG588A1_S1_L002_R2_001.fastq.gz,AEG588A1_S1_L003_R1_001.fastq.gz,AEG588A1_S1_L003_R2_001.fastq.gz,AEG588A1_S1_L004_R1_001.fastq.gz,AEG588A1_S1_L004_R2_001.fastq.gz
>>>>>>> mycosnp-nf-source/master
```

### Full samplesheet

<<<<<<< HEAD
The pipeline will auto-detect whether a sample is single- or paired-end using the information provided in the samplesheet. The samplesheet can have as many columns as you desire, however, there is a strict requirement for the first 3 columns to match those defined in the table below.

A final samplesheet file consisting of both single- and paired-end data may look something like the one below. This is for 6 samples, where `TREATMENT_REP3` has been sequenced twice.

```csv title="samplesheet.csv"
=======
The workflow will auto-detect whether a sample is single- or paired-end using the information provided in the samplesheet. The samplesheet can have as many columns as you desire, however, there is a strict requirement for the first 3 columns to match those defined in the table below.

A final samplesheet file consisting of both single- and paired-end data may look something like the one below. This is for 4 samples, where `TREATMENT_REP3` has been sequenced twice.

```console
>>>>>>> mycosnp-nf-source/master
sample,fastq_1,fastq_2
CONTROL_REP1,AEG588A1_S1_L002_R1_001.fastq.gz,AEG588A1_S1_L002_R2_001.fastq.gz
CONTROL_REP2,AEG588A2_S2_L002_R1_001.fastq.gz,AEG588A2_S2_L002_R2_001.fastq.gz
CONTROL_REP3,AEG588A3_S3_L002_R1_001.fastq.gz,AEG588A3_S3_L002_R2_001.fastq.gz
<<<<<<< HEAD
TREATMENT_REP1,AEG588A4_S4_L003_R1_001.fastq.gz,
TREATMENT_REP2,AEG588A5_S5_L003_R1_001.fastq.gz,
TREATMENT_REP3,AEG588A6_S6_L003_R1_001.fastq.gz,
TREATMENT_REP3,AEG588A6_S6_L004_R1_001.fastq.gz,
```

| Column    | Description                                                                                                                                                                            |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `sample`  | Custom sample name. This entry will be identical for multiple sequencing libraries/runs from the same sample. Spaces in sample names are automatically converted to underscores (`_`). |
| `fastq_1` | Full path to FastQ file for Illumina short reads 1. File has to be gzipped and have the extension ".fastq.gz" or ".fq.gz".                                                             |
| `fastq_2` | Full path to FastQ file for Illumina short reads 2. File has to be gzipped and have the extension ".fastq.gz" or ".fq.gz".                                                             |

An [example samplesheet](../assets/samplesheet.csv) has been provided with the pipeline.

## Running the pipeline

The typical command for running the pipeline is as follows:

```bash
nextflow run mycosnp --input ./samplesheet.csv --outdir ./results  -profile docker
```

This will launch the pipeline with the `docker` configuration profile. See below for more information about profiles.

Note that the pipeline will create the following files in your working directory:

```bash
work                # Directory containing the nextflow working files
<OUTDIR>            # Finished results in specified location (defined with --outdir)
.nextflow_log       # Log file from Nextflow
# Other nextflow hidden files, eg. history of pipeline runs and old logs.
```

If you wish to repeatedly use the same parameters for multiple runs, rather than specifying each flag in the command, you can specify these in a params file.

Pipeline settings can be provided in a `yaml` or `json` file via `-params-file <file>`.

> [!WARNING]
> Do not use `-c <file>` to specify parameters as this will result in errors. Custom config files specified with `-c` must only be used for [tuning process resource specifications](https://nf-co.re/docs/usage/configuration#tuning-workflow-resources), other infrastructural tweaks (such as output directories), or module arguments (args).

The above pipeline run specified with a params file in yaml format:

```bash
nextflow run mycosnp -profile docker -params-file params.yaml
```

with:

```yaml title="params.yaml"
input: './samplesheet.csv'
outdir: './results/'
<...>
```

You can also generate such `YAML`/`JSON` files via [nf-core/launch](https://nf-co.re/launch).

### Updating the pipeline

When you run the above command, Nextflow automatically pulls the pipeline code from GitHub and stores it as a cached version. When running the pipeline after this, it will always use the cached version if available - even if the pipeline has been updated since. To make sure that you're running the latest version of the pipeline, make sure that you regularly update the cached version of the pipeline:

```bash
nextflow pull mycosnp
```

### Reproducibility

It is a good idea to specify the pipeline version when running the pipeline on your data. This ensures that a specific version of the pipeline code and software are used when you run your pipeline. If you keep using the same tag, you'll be running the same version of the pipeline, even if there have been changes to the code since.

First, go to the [mycosnp releases page](https://github.com/cdcent/oamd-bio-fungal-mycosnp/releases) and find the latest pipeline version - numeric only (eg. `1.3.1`). Then specify this when running the pipeline with `-r` (one hyphen) - eg. `-r 1.3.1`. Of course, you can switch to another version by changing the number after the `-r` flag.

This version number will be logged in reports when you run the pipeline, so that you'll know what you used when you look back in the future. For example, at the bottom of the MultiQC reports.

To further assist in reproducibility, you can use share and reuse [parameter files](#running-the-pipeline) to repeat pipeline runs with the same settings without having to write out a command with every single parameter.

> [!TIP]
> If you wish to share such profile (such as upload as supplementary material for academic publications), make sure to NOT include cluster specific paths to files, nor institutional specific profiles.

## Core Nextflow arguments

> [!NOTE]
> These options are part of Nextflow and use a _single_ hyphen (pipeline parameters use a double-hyphen)
=======
TREATMENT_REP3,AEG588A6_S6_L003_R1_001.fastq.gz,AEG588A6_S6_L003_R2_001.fastq.gz,AEG588A6_S6_L004_R1_001.fastq.gz,AEG588A6_S6_L004_R2_001.fastq.gz
```

| Column         | Description                                                                                                                                                                            |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `sample`       | Custom sample name. This entry will be identical for multiple sequencing libraries/runs from the same sample. Spaces in sample names are automatically converted to underscores (`_`). |
| `fastq_1`      | Full path to FastQ file for Illumina short reads 1. File has to be gzipped and have the extension ".fastq.gz" or ".fq.gz".                                                             |
| `fastq_2`      | Full path to FastQ file for Illumina short reads 2. File has to be gzipped and have the extension ".fastq.gz" or ".fq.gz".                                                             |

An [example samplesheet](/assets/samplesheet.csv) has been provided with the repository.

## Samplesheet creation - automated

A script is available to create a samplesheet from a directory of fastq files. The script will search 1 directory deep and attempt to determine sample id names and pairing/multilane information and will automatically create a samplesheet. Please review the samplesheet for accuracy before using it.

```console
mycosnp-nf/bin/mycosnp_full_samplesheet.sh <directory of fastq files> > new_samplesheet.csv
```

## SRA sequence file additions

You may provide a list of SRA ids as additional input sequences into either workflow. Use the `--add_sra_file` parameter to specify its location. It has to be a comma-separated file (csv) with one or 2 columns, and NO header row as shown in the examples below.

```console
--add_sra_file '[path to samplesheet file: assets/sra_small.csv]'
```

Example File:

If two fields are provided, the first field will be used as the sequence name, and the second field will be used to specify the SRA id to download. If one field is provided, it must be the SRA id, and this SRA id will be used as the sequence name.

```console
B12352,SRR7909282
SRR7909249
B13520,SRR7909394
```

# Pre-MycoSNP workflow
## Inputs specific to the Pre-MycoSNP workflow
### Sourmash subtype database
* The `--subtype_db` parameter species the path to a directory containing the files necessary for subtyping. The default path is `${projectDir}/assets/sourmash_db`.
* The directory should contain sourmash signature files, each containing multiple sketches for the representative subtypes.
* The directory should also contain a csv file called `sourmash_taxa.csv` mapping each taxon name to a sourmash signature file. Taxon names must be the same as what is reported by GAMBIT.
* See [assets/sourmash_db/](/assets/sourmash_db) for example files and directory structure. This repository comes with a _Candida auris_ signature file ([assets/sourmash_db/signatures/candida_auris_clades.sig](/assets/sourmash_db/signatures/candida_auris_clades.sig)), containing sourmash sketches for the six _C. auris_ clades.
* You can add as many different signature files as you wish for the subtyper step. Ensure the `gambit_taxon` field in `sourmash_taxa.csv` matches the GAMBIT output exactly.

## Running the Pre-MycoSNP workflow
> [!NOTE]
> The `--workflow` option specifies which workflow to run (Pre-MycoSNP workflow or main MycoSNP workflow). By default (when no `workflow` is specified), the main MycoSNP workflow is executed.
```console
nextflow run CDCgov/mycosnp-nf --workflow PRE_MYCOSNP -profile <docker/singularity/other/institute> --input samplesheet.csv
```

Example:
```console
nextflow run CDCgov/mycosnp-nf --workflow PRE_MYCOSNP \
  -profile singularity \
  --input samplesheet.csv \
  --add_sra_file srr.csv
```

# Main MycoSNP workflow (default workflow)

## Inputs specific to the main MycoSNP workflow
### Reference input

You will need to provide the reference sequence in fasta format. You can pass the location of the fasta file using the `--fasta` argument.

```console
--fasta '[path to fasta file]'
```

Alternatively, you can skip the reference file processing steps by providing the files needed. This can be done in one of two ways.

* First way is by supplying a directory which has all the reference files from a previous mycosnp run using '--ref_dir'. This expects the following directory format:
    * masked fasta in <ref_dir>/masked/\*.fa\*
    * picard dict in <ref dir>/dict/*.dict
    * samtools fai in <ref dir>/fai/*.fai
    * bwa mem index directory in <ref dir>/bwa/bwa

```console
--ref_dir 'results/reference'
```

* Second way is by providing each of the files separately.
  - --ref_masked_fasta path/to/ref.fasta
  - --ref_fai path/to/fai/file.fai
  - --ref_bwa path/to/bwa/directory
  - --ref_dict path/to/picard/dict/file.dict

```console
--ref_masked_fasta results-copy/reference/masked/reference.fa --ref_fai results-copy/reference/fai/reference.fa.fai --ref_bwa results-copy/reference/bwa/bwa --ref_dict results-copy/reference/dict/reference.dict
```

### VCF file additions

You may provide a list of VCF files from previous runs of this workflow as additional inputs sequences into the workflow. These VCF file must have used the exact same reference file when they were generated. The *.tbi index file must be within the same directory as the vcf file and have the same name. These files can be found in the `results/samples/sample_id/variant_calling/haplotypecaller` subfolder. Use the `--add_vcf_file` parameter to specify its location. It has to be a .csv file (with one column only) with the full path to the vcf file on each line, and NO header row as shown in the examples below.

```console
--add_vcf_file '[path to vcf file: assets/vcf_add.csv]'
```

Example File:

```console
/mydir/results_2021/samples/B12044/variant_calling/haplotypecaller/B12044.g.vcf.gz
/mydir/results_control/samples/B12352/variant_calling/haplotypecaller/B12352.g.vcf.gz
/mydir/results_2020/B12427.g.vcf.gz
/mydir/results/samples/B12430/variant_calling/haplotypecaller/B12430.g.vcf.gz
```

## Running the main MycoSNP workflow
> [!NOTE]
> The `--workflow` option specifies which workflow to run (Pre-MycoSNP workflow or main MycoSNP workflow). By default (when no `workflow` is specified), the main MycoSNP workflow is executed.

For a minimal test run:
> [!NOTE]
> The samples for the minimal test run are bacterial (_N. gonorrhoeae_), not fungal. This is intentional so the test finishes in a few minutes (as opposed to longer for fungal samples with much larger genomes).

```console
nextflow run CDCgov/mycosnp-nf -profile test,<docker/singularity/other/institute>
```

For a full test run:

```console
nextflow run CDCgov/mycosnp-nf -profile test_full,<docker/singularity/other/institute>
```

For a real run:

```console
nextflow run CDCgov/mycosnp-nf -profile <docker/singularity/other/institute> --input samplesheet.csv --fasta reference_genome.fasta
```

Example:
```console
nextflow run CDCgov/mycosnp-nf \
  -profile singularity \
  --fasta "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/016/772/135/GCA_016772135.1_ASM1677213v1/GCA_016772135.1_ASM1677213v1_genomic.fna.gz" \
  --input samplesheet.csv \
  --add_sra_file srr.csv
```
This will launch the pipeline with the `singularity` configuration profile. See below for more information about profiles.

> Note: that the pipeline will create the following files in your working directory:
>
>```console
>work            # Directory containing the nextflow working files
>results         # Finished results (configurable, see below)
>.nextflow.log   # Log file from Nextflow
># Other nextflow hidden files, eg. history of pipeline runs and old logs.
>```

# General nf-core documentation
## Core Nextflow arguments

> **NB:** These options are part of Nextflow and use a _single_ hyphen (pipeline parameters use a double-hyphen).
>>>>>>> mycosnp-nf-source/master

### `-profile`

Use this parameter to choose a configuration profile. Profiles can give configuration presets for different compute environments.

<<<<<<< HEAD
Several generic profiles are bundled with the pipeline which instruct the pipeline to use software packaged using different methods (Docker, Singularity, Podman, Shifter, Charliecloud, Apptainer, Conda) - see below.

> [!IMPORTANT]
> We highly recommend the use of Docker or Singularity containers for full pipeline reproducibility, however when this is not possible, Conda is also supported.

The pipeline also dynamically loads configurations from [https://github.com/nf-core/configs](https://github.com/nf-core/configs) when it runs, making multiple config profiles for various institutional clusters available at run time. For more information and to check if your system is supported, please see the [nf-core/configs documentation](https://github.com/nf-core/configs#documentation).
=======
Several generic profiles are bundled with the pipeline which instruct the pipeline to use software packaged using different methods (Docker, Singularity, Podman, Shifter, Charliecloud, Conda) - see below. When using Biocontainers, most of these software packaging methods pull Docker containers from quay.io e.g [FastQC](https://quay.io/repository/biocontainers/fastqc) except for Singularity which directly downloads Singularity images via https hosted by the [Galaxy project](https://depot.galaxyproject.org/singularity/) and Conda which downloads and installs software locally from [Bioconda](https://bioconda.github.io/).

> We highly recommend the use of Docker or Singularity containers for full pipeline reproducibility, however when this is not possible, Conda is also supported.

The pipeline also dynamically loads configurations from [https://github.com/nf-core/configs](https://github.com/nf-core/configs) when it runs, making multiple config profiles for various institutional clusters available at run time. For more information and to see if your system is available in these configs please see the [nf-core/configs documentation](https://github.com/nf-core/configs#documentation).
>>>>>>> mycosnp-nf-source/master

Note that multiple profiles can be loaded, for example: `-profile test,docker` - the order of arguments is important!
They are loaded in sequence, so later profiles can overwrite earlier profiles.

<<<<<<< HEAD
If `-profile` is not specified, the pipeline will run locally and expect all software to be installed and available on the `PATH`. This is _not_ recommended, since it can lead to different results on different machines dependent on the computer environment.

- `test`
  - A profile with a complete configuration for automated testing
  - Includes links to test data so needs no other parameters
- `docker`
  - A generic configuration profile to be used with [Docker](https://docker.com/)
- `singularity`
  - A generic configuration profile to be used with [Singularity](https://sylabs.io/docs/)
- `podman`
  - A generic configuration profile to be used with [Podman](https://podman.io/)
- `shifter`
  - A generic configuration profile to be used with [Shifter](https://nersc.gitlab.io/development/shifter/how-to-use/)
- `charliecloud`
  - A generic configuration profile to be used with [Charliecloud](https://hpc.github.io/charliecloud/)
- `apptainer`
  - A generic configuration profile to be used with [Apptainer](https://apptainer.org/)
- `wave`
  - A generic configuration profile to enable [Wave](https://seqera.io/wave/) containers. Use together with one of the above (requires Nextflow ` 24.03.0-edge` or later).
- `conda`
  - A generic configuration profile to be used with [Conda](https://conda.io/docs/). Please only use Conda as a last resort i.e. when it's not possible to run the pipeline with Docker, Singularity, Podman, Shifter, Charliecloud, or Apptainer.

### `-resume`

Specify this when restarting a pipeline. Nextflow will use cached results from any pipeline steps where the inputs are the same, continuing from where it got to previously. For input to be considered the same, not only the names must be identical but the files' contents as well. For more info about this parameter, see [this blog post](https://www.nextflow.io/blog/2019/demystifying-nextflow-resume.html).
=======
If `-profile` is not specified, the pipeline will run locally and expect all software to be installed and available on the `PATH`. This is _not_ recommended.

* `docker`
    * A generic configuration profile to be used with [Docker](https://docker.com/)
* `singularity`
    * A generic configuration profile to be used with [Singularity](https://sylabs.io/docs/)
* `podman`
    * A generic configuration profile to be used with [Podman](https://podman.io/)
* `shifter`
    * A generic configuration profile to be used with [Shifter](https://nersc.gitlab.io/development/shifter/how-to-use/)
* `charliecloud`
    * A generic configuration profile to be used with [Charliecloud](https://hpc.github.io/charliecloud/)
* `conda`
    * A generic configuration profile to be used with [Conda](https://conda.io/docs/). Please only use Conda as a last resort i.e. when it's not possible to run the pipeline with Docker, Singularity, Podman, Shifter or Charliecloud.
* `test`
    * A profile with a complete configuration for automated testing
    * Includes links to test data so needs no other parameters

### `-resume`

Specify this when restarting a pipeline. Nextflow will used cached results from any pipeline steps where the inputs are the same, continuing from where it got to previously.
>>>>>>> mycosnp-nf-source/master

You can also supply a run name to resume a specific run: `-resume [run-name]`. Use the `nextflow log` command to show previous run names.

### `-c`

Specify the path to a specific config file (this is a core Nextflow command). See the [nf-core website documentation](https://nf-co.re/usage/configuration) for more information.

## Custom configuration

### Resource requests

<<<<<<< HEAD
Whilst the default requirements set within the pipeline will hopefully work for most people and with most input data, you may find that you want to customise the compute resources that the pipeline requests. Each step in the pipeline has a default set of requirements for number of CPUs, memory and time. For most of the pipeline steps, if the job exits with any of the error codes specified [here](https://github.com/nf-core/rnaseq/blob/4c27ef5610c87db00c3c5a3eed10b1d161abf575/conf/base.config#L18) it will automatically be resubmitted with higher resources request (2 x original, then 3 x original). If it still fails after the third attempt then the pipeline execution is stopped.

To change the resource requests, please see the [max resources](https://nf-co.re/docs/usage/configuration#max-resources) and [tuning workflow resources](https://nf-co.re/docs/usage/configuration#tuning-workflow-resources) section of the nf-core website.

### Custom Containers

In some cases, you may wish to change the container or conda environment used by a pipeline steps for a particular tool. By default, nf-core pipelines use containers and software from the [biocontainers](https://biocontainers.pro/) or [bioconda](https://bioconda.github.io/) projects. However, in some cases the pipeline specified version maybe out of date.

To use a different container from the default container or conda environment specified in a pipeline, please see the [updating tool versions](https://nf-co.re/docs/usage/configuration#updating-tool-versions) section of the nf-core website.

### Custom Tool Arguments

A pipeline might not always support every possible argument or option of a particular tool used in pipeline. Fortunately, nf-core pipelines provide some freedom to users to insert additional parameters that the pipeline does not include by default.

To learn how to provide additional arguments to a particular tool of the pipeline, please see the [customising tool arguments](https://nf-co.re/docs/usage/configuration#customising-tool-arguments) section of the nf-core website.
=======
Whilst the default requirements set within the pipeline will hopefully work for most people and with most input data, you may find that you want to customise the compute resources that the pipeline requests. Each step in the pipeline has a default set of requirements for number of CPUs, memory and time. For most of the steps in the pipeline, if the job exits with any of the error codes specified [here](/conf/base.config#L17) it will automatically be resubmitted with higher requests (2 x original, then 3 x original). If it still fails after the third attempt then the pipeline execution is stopped.

For example, if the mycosnp-nf pipeline is failing after multiple re-submissions of the `BWA_PRE_PROCESS:FAQCS` process due to an exit code of `137` this would indicate that there is an out of memory issue:

```console
[62/149eb0] NOTE: Process `MYCOSNP:BWA_PRE_PROCESS:FAQCS (SAMPLE_1` terminated with an error exit status (137) -- Execution is retried (1)
Error executing process > 'MYCOSNP:BWA_PRE_PROCESS:FAQCS (SAMPLE_1'

Caused by:
    Process `MYCOSNP:BWA_PRE_PROCESS:FAQCS (SAMPLE_1)` terminated with an error exit status (137)

Command executed:
FaQCs \
            -d . \
            -u SAMPLE_1.fastq.gz \
            --prefix SAMPLE_1_clean \
            -t 8 \
        <TRUNCATED>

Command exit status:
    137

Command output:
    (empty)

Command error:
    .command.sh: line 9:  30 Killed    FaQCs -d . -u SAMPLE_1.fastq.gz -t 8 <TRUNCATED>
Work dir:
    /home/pipelinetest/work/9d/172ca5881234073e8d76f2a19c88fb

Tip: you can replicate the issue by changing to the process work dir and entering the command `bash .command.run`
```

To bypass this error you would need to find exactly which resources are set by the `STAR_ALIGN` process. The quickest way is to search for `process STAR_ALIGN` in the [CDCgov/mycosnp-nf Github repo](https://github.com/CDCgov/mycosnp-nf/search?q=process+FAQCS). We have standardised the structure of Nextflow DSL2 pipelines such that all module files will be present in the `modules/` directory and so based on the search results the file we want is `modules/nf-core/modules/faqcs/main.nf`. If you click on the link to that file you will notice that there is a `label` directive at the top of the module that is set to [`label process_medium`](/modules/nf-core/modules/faqcs/main.nf#L3). The [Nextflow `label`](https://www.nextflow.io/docs/latest/process.html#label) directive allows us to organize workflow processes in separate groups which can be referenced in a configuration file to select and configure subset of processes having similar computing requirements. The default values for the `process_medium` label are set in the pipeline's [`base.config`](/conf/base.config#L32-L36) which in this case is defined as 16GB. Providing you haven't set any other standard nf-core parameters to __cap__ the [maximum resources](https://nf-co.re/usage/configuration#max-resources) used by the pipeline then we can try and bypass the `FAQCS` process failure by creating a custom config file that sets at least 16GB of memory, in this case increased to 50GB. The custom config below can then be provided to the pipeline via the [`-c`](#-c) parameter as highlighted in previous sections.

```nextflow
process {
    withName: FAQCS {
        memory = 50.GB
    }
}
```

> **NB:** We specify just the process name i.e. `FAQCS` in the config file and not the full task name string that is printed to screen in the error message or on the terminal whilst the pipeline is running i.e. `MYCOSNP:BWA_PRE_PROCESS:FAQCS`. You may get a warning suggesting that the process selector isn't recognised but you can ignore that if the process name has been specified correctly. This is something that needs to be fixed upstream in core Nextflow.

### Updating containers

The [Nextflow DSL2](https://www.nextflow.io/docs/latest/dsl2.html) implementation of this pipeline uses one container per process which makes it much easier to maintain and update software dependencies. If for some reason you need to use a different version of a particular tool with the pipeline then you just need to identify the `process` name and override the Nextflow `container` definition for that process using the `withName` declaration. For example, in the [nf-core/viralrecon](https://nf-co.re/viralrecon) pipeline a tool called [Pangolin](https://github.com/cov-lineages/pangolin) has been used during the COVID-19 pandemic to assign lineages to SARS-CoV-2 genome sequenced samples. Given that the lineage assignments change quite frequently it doesn't make sense to re-release the nf-core/viralrecon everytime a new version of Pangolin has been released. However, you can override the default container used by the pipeline by creating a custom config file and passing it as a command-line argument via `-c custom.config`.

1. Check the default version used by the pipeline in the module file for [Pangolin](https://github.com/nf-core/viralrecon/blob/a85d5969f9025409e3618d6c280ef15ce417df65/modules/nf-core/software/pangolin/main.nf#L14-L19)

2. Find the latest version of the Biocontainer available on [Quay.io](https://quay.io/repository/biocontainers/pangolin?tag=latest&tab=tags)

3. Create the custom config accordingly:

    * For Docker:

        ```nextflow
        process {
            withName: PANGOLIN {
                container = 'quay.io/biocontainers/pangolin:3.0.5--pyhdfd78af_0'
            }
        }
        ```

    * For Singularity:

        ```nextflow
        process {
            withName: PANGOLIN {
                container = 'https://depot.galaxyproject.org/singularity/pangolin:3.0.5--pyhdfd78af_0'
            }
        }
        ```

    * For Conda:

        ```nextflow
        process {
            withName: PANGOLIN {
                conda = 'bioconda::pangolin=3.0.5'
            }
        }
        ```

> **NB:** If you wish to periodically update individual tool-specific results (e.g. Pangolin) generated by the pipeline then you must ensure to keep the `work/` directory otherwise the `-resume` ability of the pipeline will be compromised and it will restart from scratch.
>>>>>>> mycosnp-nf-source/master

### nf-core/configs

In most cases, you will only need to create a custom config as a one-off but if you and others within your organisation are likely to be running nf-core pipelines regularly and need to use the same settings regularly it may be a good idea to request that your custom config file is uploaded to the `nf-core/configs` git repository. Before you do this please can you test that the config file works with your pipeline of choice using the `-c` parameter. You can then create a pull request to the `nf-core/configs` repository with the addition of your config file, associated documentation file (see examples in [`nf-core/configs/docs`](https://github.com/nf-core/configs/tree/master/docs)), and amending [`nfcore_custom.config`](https://github.com/nf-core/configs/blob/master/nfcore_custom.config) to include your custom profile.

See the main [Nextflow documentation](https://www.nextflow.io/docs/latest/config.html) for more information about creating your own configuration files.

If you have any questions or issues please send us a message on [Slack](https://nf-co.re/join/slack) on the [`#configs` channel](https://nfcore.slack.com/channels/configs).

## Running in the background

Nextflow handles job submissions and supervises the running jobs. The Nextflow process must run until the pipeline is finished.

The Nextflow `-bg` flag launches Nextflow in the background, detached from your terminal so that the workflow does not stop if you log out of your session. The logs are saved to a file.

Alternatively, you can use `screen` / `tmux` or similar tool to create a detached session which you can log back into at a later time.
Some HPC setups also allow you to run nextflow within a cluster job submitted your job scheduler (from where it submits more jobs).

## Nextflow memory requirements

In some cases, the Nextflow Java virtual machines can start to request a large amount of memory.
We recommend adding the following line to your environment to limit this (typically in `~/.bashrc` or `~./bash_profile`):

<<<<<<< HEAD
```bash
=======
```console
>>>>>>> mycosnp-nf-source/master
NXF_OPTS='-Xms1g -Xmx4g'
```
