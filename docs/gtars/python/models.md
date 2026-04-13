# `gtars.models`

The `gtars.models` submodule exposes the core genomic data types and — unlike the Rust layout, where statistics and set algebra live in separate crates — attaches almost the entire `gtars-genomicdist` method surface directly to `RegionSet`. In Python, you generally interact with `RegionSet` and the rest is built up on top of it.

!!! info "Python ↔ Rust correspondence"
    `gtars.models` combines types from three Rust crates:

    - `gtars-core::models` → `Region`, `Interval`, `RegionSet`, `RegionSetList`
    - `gtars-genomicdist::models` → `ChromosomeStatistics`, `SpacingStats`, `ClusterStats`, `DensityVector`, `DensityHomogeneity`, `GenomeAssembly`, `BinaryGenomeAssembly`, `TssIndex`, `GeneModel`, `PartitionList`, `SignalMatrix`, `GenomicDistAnnotation`
    - `gtars-genomicdist::{IntervalRanges, GenomicIntervalSetStatistics}` → methods on `RegionSet`

    Free functions that need a reference genome or a partition list live in [`gtars.genomic_distributions`](genomic_distributions.md).

## Classes

### `Region`

A single genomic interval.

```python
from gtars.models import Region

r = Region(chr="chr1", start=100, end=200, rest="peak1")
print(r)          # chr1\t100\t200\tpeak1
print(len(r))     # 100 (width)
print(r.chr, r.start, r.end, r.rest)
```

Constructor: `Region(chr, start, end, rest=None)`.
Attributes: `chr: str`, `start: int`, `end: int`, `rest: str | None`.
Supports `==`, `!=`, `len()`, `str()`, `repr()`.

### `RegionSet`

The main workhorse — a collection of regions loaded from a BED file (or a URL, via the `http` feature on the underlying crate), and the attachment point for ~50 methods covering load/save, iteration, summaries, interval set algebra, overlap queries, and peak statistics.

#### Construction

```python
from gtars.models import Region, RegionSet

# From a local file (or URL if the http feature is compiled in)
rs = RegionSet("peaks.bed")
rs = RegionSet("peaks.bed.gz")
rs = RegionSet("https://example.org/peaks.bed.gz")

# From a list of Region objects
regions = [
    Region("chr1", 100, 200),
    Region("chr1", 300, 400),
]
rs = RegionSet.from_regions(regions)

# From parallel column vectors (useful when coming from pandas / numpy)
rs = RegionSet.from_vectors(
    chrs=["chr1", "chr1", "chr2"],
    starts=[100, 300, 500],
    ends=[200, 400, 600],
)

# Optional strand tracking
rs = RegionSet.from_regions(regions, strands=["+", "-"])
```

Regions are auto-sorted by `(chr, start)` on construction.

#### Properties and iteration

```python
len(rs)                 # number of regions
list(rs)                # iterate; yields Region objects
rs[0]                   # indexed access (supports negatives)
rs.is_empty()

rs.identifier           # MD5 of first three columns — canonical bedbase id
rs.file_digest          # MD5 of full serialized content
rs.header               # original BED header (may be None)
rs.path                 # source path (str, raises if constructed in-memory)
rs.strands              # parallel list of strand strings
```

#### Summaries

```python
rs.widths()                    # list[int], one width per region
rs.region_widths()             # alias for widths()
rs.mean_region_width()         # float, rounded to 2 decimals
rs.get_nucleotide_length()     # int, total bp across all regions
rs.get_max_end_per_chr()       # dict[str, int]
rs.chromosome_statistics()     # dict[str, ChromosomeStatistics]
rs.distribution(n_bins=250, chrom_sizes=None)
                               # list of dicts: chr/start/end/n/rid
```

!!! warning "`chrom_sizes` matters"
    Without `chrom_sizes`, `distribution()` derives bin size from the BED file's own observed max end — so outputs are **not comparable across files**. Pass `chrom_sizes` to get reference-genome-aligned bins that are comparable.

#### I/O

```python
rs.to_bed("out.bed")
rs.to_bed_gz("out.bed.gz")
rs.to_bigbed("out.bb", "chrom.sizes")   # requires the bigbed feature
rs.sort()                                # in-place
```

#### Interval set algebra

Methods that mirror R GRanges/IRanges — all return a new `RegionSet`:

```python
rs.trim(chrom_sizes)                 # clamp to [0, chrom_size)
rs.promoters(upstream=2000, downstream=0)
rs.reduce()                          # merge overlapping/adjacent
rs.disjoin()                         # tile at every boundary into disjoint pieces
rs.setdiff(other)                    # remove other from self
rs.subtract(other)                   # alias for setdiff
rs.pintersect(other)                 # pairwise (index-aligned) intersect
rs.intersect_all(other)              # all-vs-all intersection fragments
rs.concat(other)                     # combine without merging
rs.union(other)                      # concat + reduce
rs.gaps(chrom_sizes)                 # peak-free regions bounded by chrom sizes
```

And similarity / coverage metrics:

```python
rs.jaccard(other)                    # nucleotide Jaccard |A∩B| / |A∪B|
rs.coverage(other)                   # fraction of self bp covered by other
rs.overlap_coefficient(other)        # |A∩B| / min(|A|, |B|)
```

!!! note "`rest` metadata is dropped"
    Operations that merge or synthesize new intervals (`reduce`, `setdiff`, `promoters`, etc.) produce regions with `rest = None`. There's no unambiguous way to carry metadata through a merge.

#### Overlap queries

These route through the `gtars-overlaprs` AIList index under the hood:

```python
rs.subset_by_overlaps(other)         # RegionSet containing only self-regions that overlap other
rs.count_overlaps(other)             # list[int], per-region overlap count
rs.any_overlaps(other)               # list[bool], per-region "overlaps anything?"
rs.find_overlaps(other)              # list[list[int]], indices into other per self-region
rs.closest(other)                    # list[(self_idx, other_idx, distance)]
rs.cluster(max_gap=0)                # list[int], cluster id per region
```

#### Peak statistics

Ports of the R GenomicDistributions functions, exposed via the Rust `GenomicIntervalSetStatistics` trait as `RegionSet` methods in Python:

```python
rs.neighbor_distances()              # list[int], signed gaps per chromosome (multi-region chroms only)
rs.nearest_neighbors()               # list[int], per-region min neighbor distance
rs.inter_peak_spacing()              # SpacingStats
rs.peak_clusters(radius_bp=5000, min_cluster_size=2)  # ClusterStats
rs.density_vector(chrom_sizes, n_bins)                # DensityVector — ML-ready dense count vector
rs.density_homogeneity(chrom_sizes, n_bins)           # DensityHomogeneity — CV, Gini, etc.
```

!!! warning "Output length for `neighbor_distances` / `nearest_neighbors`"
    Both methods **skip chromosomes with only one region** (matching R GenomicDistributions). The returned list is therefore **not aligned 1:1 with input regions** — it's shorter than `len(rs)` whenever any chromosome has exactly one peak. No sentinel values are emitted.

!!! warning "`n_bins` is a target, not a total"
    In `density_vector`, `density_homogeneity`, and `distribution(chrom_sizes=...)`, `n_bins` is the target bin count for the **longest** chromosome. Bin width is derived from that, and every chromosome is tiled at the same bp width — so the total window count is `sum(ceil(size / bin_width))` across chromosomes, often much larger than `n_bins`. See `DensityVector` for details.

### `RegionSetList`

A collection of `RegionSet`s — the Python wrapper for `gtars-core::models::RegionSetList`. Substantially thinner than the Rust type: only construction from a list of `RegionSet`s, iteration/indexing, `concat`, and pairwise Jaccard.

```python
from gtars.models import RegionSet, RegionSetList

rsl = RegionSetList([
    RegionSet("rep1.bed"),
    RegionSet("rep2.bed"),
    RegionSet("rep3.bed"),
])

len(rsl)                     # 3
rsl[0]                       # RegionSet
list(rsl)                    # iterate

combined = rsl.concat()      # flatten into a single RegionSet (no merge/dedup)
rsl.names                    # None unless produced by RegionDB.get_region_sets()

# Full N×N Jaccard similarity matrix
jac = rsl.pairwise_jaccard()  # list[list[float]], symmetric, 1.0 on diagonal
```

!!! note "Names come from `RegionDB`"
    The Python `RegionSetList.__new__` does not accept a `names=` parameter — names are only populated when a `RegionSetList` is produced by `RegionDB.get_region_sets()` (see [`gtars.lola`](lola.md)). If you need named sets from scratch, that's currently only available in the Rust API.

### `Interval`

A generic integer interval with a payload. Primarily a helper for overlap indexes — most user code should use `Region` / `RegionSet` instead.

### Statistics result types

These are returned by `RegionSet` methods. All are read-only dataclass-like types with named fields.

#### `ChromosomeStatistics`

Returned by `rs.chromosome_statistics()` → `dict[str, ChromosomeStatistics]`.

| field | type | meaning |
|---|---|---|
| `chromosome` | `str` | chromosome name |
| `number_of_regions` | `int` | region count on this chromosome |
| `start_nucleotide_position` | `int` | leftmost start |
| `end_nucleotide_position` | `int` | rightmost end |
| `minimum_region_length` | `int` | |
| `maximum_region_length` | `int` | |
| `mean_region_length` | `float` | |
| `median_region_length` | `float` | |

#### `SpacingStats`

Returned by `rs.inter_peak_spacing()`. All float fields are NaN when `n_gaps == 0`.

| field | type |
|---|---|
| `n_gaps` | `int` — count of *positive* inter-region gaps |
| `mean`, `median`, `std`, `iqr` | `float` |
| `log_mean`, `log_std` | `float` — `log10(gap + 1)` stats, more robust for heavy-tailed gap distributions |

#### `ClusterStats`

Returned by `rs.peak_clusters(radius_bp, min_cluster_size)`.

| field | type |
|---|---|
| `radius_bp` | `int` — pass-through |
| `n_clusters` | `int` — clusters with size ≥ `min_cluster_size` |
| `n_clustered_peaks` | `int` — peaks belonging to those clusters |
| `mean_cluster_size` | `float` — NaN if no clusters meet threshold |
| `max_cluster_size` | `int` — always over all clusters, not filtered |
| `fraction_clustered` | `float` — `n_clustered_peaks / total_peaks` |

The identity `n_clusters * mean_cluster_size == n_clustered_peaks` holds exactly at any threshold. With `min_cluster_size=2` (the default), `fraction_clustered` is the fraction of peaks with at least one neighbor within `radius_bp` — the typical meaning in super-enhancer-stitching analyses.

#### `DensityVector`

Returned by `rs.density_vector(chrom_sizes, n_bins)`.

| field | type |
|---|---|
| `n_bins` | `int` — target bin count for the longest chromosome (**not** the length of `counts`) |
| `bin_width` | `int` — `max(chrom_sizes.values()) // n_bins`, min 1 |
| `counts` | `list[int]` — dense, row-major, karyotypic chromosome order |
| `chrom_offsets` | `list[(str, int)]` — `(chr_name, start_index_in_counts)` per chromosome |

Supports `len()`. Suitable as an ML feature vector — stable ordering across files when you pass the same `chrom_sizes`.

#### `DensityHomogeneity`

Returned by `rs.density_homogeneity(chrom_sizes, n_bins)`.

| field | type |
|---|---|
| `bin_width`, `n_windows`, `n_nonzero_windows` | `int` |
| `mean_count`, `variance`, `cv`, `gini` | `float` |

Poisson-distributed peaks give `cv ≈ 1`; clustered sets give `cv >> 1`; evenly-spread sets give `cv << 1`. **Caveat:** Gini is biased high for sparse count distributions; check `n_nonzero_windows` before interpreting it.

## Reference genome and annotation types

These types are constructed from files on disk and passed into the functions in [`gtars.genomic_distributions`](genomic_distributions.md).

### `GenomeAssembly`

In-memory FASTA loader. Slow to construct (~2s for hg38) but fast for per-region lookups.

```python
from gtars.models import GenomeAssembly

genome = GenomeAssembly("hg38.fa")
```

### `BinaryGenomeAssembly`

mmap-backed `.fab` binary FASTA — instant construction, zero-copy per-region access.

```python
from gtars.models import BinaryGenomeAssembly

genome = BinaryGenomeAssembly("hg38.fab")
```

Create a `.fab` file once up front with the `gtars prep --fasta hg38.fa` CLI command (or the Rust `BinaryGenomeAssembly.write_from_fasta`).

### `TssIndex`

Sorted-per-chromosome TSS midpoint index for fast nearest-TSS queries.

```python
from gtars.models import TssIndex, RegionSet

tss = TssIndex("gencode.v47.tss.bed")
# or:
# tss = TssIndex.from_regionset(RegionSet("gencode.v47.tss.bed"))

peaks = RegionSet("peaks.bed")

dists = tss.calc_tss_distances(peaks)       # list[int]
signed = tss.feature_distances(peaks)       # list[float | None]
```

`feature_distances` returns `None` for regions on chromosomes that have no features in the index.

### `GeneModel`

Loaded from a GTF file. Used to build a `PartitionList`.

```python
from gtars.models import GeneModel

model = GeneModel.from_gtf(
    "gencode.v47.annotation.gtf.gz",
    filter_protein_coding=True,
    convert_ensembl_ucsc=True,
)
print(model.n_genes, model.n_exons)
```

- `filter_protein_coding` — keep only features with `gene_biotype "protein_coding"` (or `gene_type`).
- `convert_ensembl_ucsc` — prepend `chr` to chromosome names that don't already have it.

### `PartitionList`

Ordered, priority-based genomic partition list: `promoterCore` → `promoterProx` → `threeUTR` → `fiveUTR` → `exon` → `intron` → `intergenic`.

```python
from gtars.models import GeneModel, PartitionList

model = GeneModel.from_gtf("gencode.v47.gtf.gz")

# From an existing GeneModel
pl = PartitionList.from_gene_model(
    model,
    core_prom=100,
    prox_prom=2000,
    chrom_sizes=None,  # optional; used for trimming to chrom boundaries
)

# Or directly from GTF in one call
pl = PartitionList.from_gtf(
    "gencode.v47.gtf.gz",
    core_prom=100,
    prox_prom=2000,
    filter_protein_coding=True,
    convert_ensembl_ucsc=True,
)

print(pl.partition_names())   # ['promoterCore', 'promoterProx', 'exon', 'intron', ...]
print(len(pl))                # number of partitions
```

Pass the resulting `PartitionList` to `calc_partitions` / `calc_expected_partitions` in [`gtars.genomic_distributions`](genomic_distributions.md).

### `SignalMatrix`

A region × condition matrix of signal values (e.g. a peak × cell-type ChIP intensity matrix). Load from TSV or the packed binary `.sigm` format:

```python
from gtars.models import SignalMatrix

sm = SignalMatrix.from_tsv("signal_matrix.tsv")
sm = SignalMatrix.load_bin("signal_matrix.sigm")

print(sm.condition_names)   # list[str]
print(sm.n_conditions)      # int
print(sm.n_regions)         # int
print(len(sm))              # n_regions
```

Pass it to `calc_summary_signal` in [`gtars.genomic_distributions`](genomic_distributions.md).

### `GenomicDistAnnotation`

A serializable wrapper around `GeneModel` in the GDA binary format. Chrom sizes are not stored in a GDA file — they come from a separate source.

```python
from gtars.models import GenomicDistAnnotation

# Build once from GTF, save as GDA (save via Rust / CLI)
gda = GenomicDistAnnotation.from_gtf("gencode.v47.gtf.gz")

# Load from disk (fast)
gda = GenomicDistAnnotation.load_bin("gencode.v47.gda")

# Derived views
model = gda.gene_model()
pl = gda.partition_list(core_prom=100, prox_prom=2000, chrom_sizes=None)
tss = gda.tss_index()
```

## See also

- **[`gtars.genomic_distributions`](genomic_distributions.md)** — free functions for GC content, dinucleotide frequencies, partition classification, signal summaries, consensus regions.
- **[`gtars.lola`](lola.md)** — LOLA enrichment testing.
- **[gtars-core](../core.md)** — the Rust crate `gtars.models` wraps. Useful if you want to know which methods are "free" vs. which come from `gtars-genomicdist`.
- **[Core models tour](../regionSet.md)** — cross-language walkthrough of `Region` / `RegionSet` / `RegionSetList`.
