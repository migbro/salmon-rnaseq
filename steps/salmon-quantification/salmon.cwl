cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: hubmap/salmon-grch38:2.1.11
  ResourceRequirement:
    ramMin: 28672
    coresMin: $(inputs.threads)
baseCommand: /opt/salmon_wrapper.py
label: Run Salmon Alevin tool on FASTQ input

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
  trimmed_fastq_dir:
    type: Directory
    inputBinding:
      position: 1
  orig_fastq_dirs:
    type: Directory[]
    inputBinding:
      position: 2
  threads:
    type: 'int?'
    inputBinding:
      position: 3
      prefix: "--threads"
    default: 4
  expected_cell_count:
    type: int?
    inputBinding:
      position: 4
      prefix: "--expected-cell-count"
  keep_all_barcodes:
    type: boolean?
    inputBinding:
      position: 5
      prefix: "--keep-all-barcodes"

outputs:
  output_dir:
    type: Directory
    outputBinding:
      glob: salmon_out
