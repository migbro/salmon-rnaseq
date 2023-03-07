cwlVersion: v1.0
class: CommandLineTool
label: Assay-specific annotation of cell barcodes after quantification
requirements:
  DockerRequirement:
    dockerPull: hubmap/scrna-analysis:2.1.11
baseCommand: /opt/annotate_cells.py

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
  h5ad_file:
    type: File
    inputBinding:
      position: 1
  orig_fastq_dirs:
    type: Directory[]
    inputBinding:
      position: 2
  metadata_json:
    type: File?
    inputBinding:
      position: 3
      prefix: '--metadata_json'
outputs:
  annotated_h5ad_file:
    type: File
    outputBinding:
      glob: 'expr.h5ad'
