# Reference genome validator

Reference genome validator is a set of functions that allow to validate the reference genome of the bed files.
Functions include different statistical analysis and comparison of the reference genome of the bed files that produce a compatibility rating.

To run the reference genome validator, you need to have the input bed file and the chrom sizes files.

Examples usage of the reference genome validator:

### Example 1
Run validator with default parameters, with include default chrom sizes files.

```python

from bedboss.refgenome_validator.main import ReferenceValidator

validator_obj = ReferenceValidator()

results = validator_obj.determine_compatibility("path/to/bedfile.bed")

print(results)
# >>{'ensembl_hg38.chrom.sizes': CompatibilityStats(chrom_name_stats=ChromNameStats(xs=0.0, q_and_m=0.0, q_and_not_m=86.0, not_q_and_m=68.0, jaccard_index=0.0, jaccard_index_binary=0.0, passed_chrom_names=False), chrom_length_stats=ChromLengthStats(oobr=None, beyond_range=False, num_of_chrom_beyond=0, percentage_bed_chrom_beyond=0.0, percentage_genome_chrom_beyond=0.0), chrom_sequence_fit_stats=SequenceFitStats(sequence_fit=None), igd_stats=None, compatibility=RatingModel(assigned_points=10, tier_ranking=4)),
# >> 'ncbi_hg38.chrom.sizes': CompatibilityStats(chrom_name_stats=ChromNameStats(xs=0.0, q_and_m=0.0, q_and_not_m=86.0, not_q_and_m=705.0, jaccard_index=0.0, jaccard_index_binary=0.0, passed_chrom_names=False), chrom_length_stats=ChromLengthStats(oobr=None, beyond_range=False, num_of_chrom_beyond=0, percentage_bed_chrom_beyond=0.0, percentage_genome_chrom_beyond=0.0), chrom_sequence_fit_stats=SequenceFitStats(sequence_fit=None), igd_stats=None, compatibility=RatingModel(assigned_points=10, tier_ranking=4)),

```

### Example 2
Run validator with custom reference genome chrom sizes files.

```python

from bedboss.refgenome_validator.main import ReferenceValidator


ref_gen_list = [GenomeModel(
    genome_alias="ensembl_hg38",
    chrom_sizes_path="path/to/ensembl_hg38.chrom.sizes"
)
    ]
validator_obj = ReferenceValidator(
    genome_models=ref_gen_list,
)

results = validator_obj.determine_compatibility("path/to/bedfile.bed")

print(results)
# >>{'ensembl_hg38': CompatibilityStats(chrom_name_stats=ChromNameStats(xs=0.0, q_and_m=0.0, q_and_not_m=86.0, not_q_and_m=68.0, jaccard_index=0.0, jaccard_index_binary=0.0, passed_chrom_names=False), chrom_length_stats=ChromLengthStats(oobr=None, beyond_range=False, num_of_chrom_beyond=0, percentage_bed_chrom_beyond=0.0, percentage_genome_chrom_beyond=0.0), chrom_sequence_fit_stats=SequenceFitStats(sequence_fit=None), igd_stats=None, compatibility=RatingModel(assigned_points=10, tier_ranking=4))}
```

### Example 3
Run genome predictor on a bed file with default reference genomes chrom sizes files.

```python
from bedboss.refgenome_validator.main import ReferenceValidator

validator_obj = ReferenceValidator()

results = validator_obj.predict("path/to/bedfile.bed")

print(results)

```
