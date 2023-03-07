cwlVersion: v1.0
class: CommandLineTool
label: Assay-specific adjustment of cell barcodes
requirements:
  DockerRequirement:
    dockerPull: hubmap/scrna-barcode-adj:2.1.11
baseCommand: /opt/adjust_barcodes.py

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
  fastq_dir:
    type: Directory[]
    inputBinding:
      position: 1
outputs:
  adj_fastq_dir:
    type: Directory
    outputBinding:
      glob: 'adj_fastq'
  metadata_json:
    type: File?
    outputBinding:
      glob: 'metadata.json'
