# BED Analyzer

The BED Analyzer at [bedbase.org/analyze](https://bedbase.org/analyze) lets you upload a BED file and instantly run quality control and other analysis in your browser.

Analysis is powered by the [gtars WebAssembly](../../gtars/wasm.md) package, so **all processing happens client-side** — your file is never sent to a server.

## How to use

1. Navigate to [bedbase.org/analyze](https://bedbase.org/analyze).
2. Upload a BED file (gzipped or uncompressed), or use bedfile link.
3. Review the results displayed in the browser.

## Results

After analysis, the tool reports:

- **Number of regions** — total region count in the file
- **Mean region width** — average width of genomic intervals
- **File size** — size of the uploaded file
- **Data Format** -[BED format compliance](./bed_classification.md) of the file
- **BED compliance** - [BED compliance](./bed_classification.md) of the file
- **Reference genome compatibility** - whether the file is compatible with reference genomes in our database
- **Chromosome regions statistics** - distribution of regions across chromosomes
- **Region width distribution** - distribution of region widths in the file

