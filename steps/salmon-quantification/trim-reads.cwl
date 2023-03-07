cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: hubmap/scrna-trim-reads:2.1.11
  ResourceRequirement:
    coresMin: $(inputs.threads)
baseCommand: /opt/trim_reads.py
label: Trim FASTQ files

# arguments are hardcoded in salmon_wrapper.py

inputs:
  assay:
    label: "scRNA-seq assay"
    type:
      type: enum
      name: assay
      symbols: ["10x_v2","10x_v2_sn","10x_v3","10x_v3_sn","snareseq","sciseq","slideseq"]
    doc: "Assay type, please select from these only"
    inputBinding:
      position: 0
  adj_fastq_dir:
    type: Directory
    inputBinding:
      position: 1
  orig_fastq_dirs:
    type: Directory[]
    inputBinding:
      position: 2
  threads:
    type: int
    inputBinding:
      position: 3
      prefix: "--threads"

outputs:
  trimmed_fastq_dir:
    type: Directory
    outputBinding:
      glob: trimmed
