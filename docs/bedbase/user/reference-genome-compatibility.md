# Reference genome compatibility

🚧 Documentation under construction.

Reference genome compatibility is one of the features of BEDbase. Each file that is uploaded to the database is 
being processed by BEDboss pipline that allows to calculate reference genome compatibility with multiple reference genomes.

On the bedbase UI user can find comparison of the BED compatibility with most popular reference genomes.

Compatibility is assessed by 3 criteria: 

- **XS** (Sensitivity of Chrom names), 
- **OOBS** (Sensitivity of Chrom Lengths),
- **SF** (Specificity of Chrom Names).

After 3 main statistics are calculated: Tiers are assigned by taking into consideration each score.
The tiers are:

- **TIER 1**: Excellent
- **TIER 2**: Good
- **TIER 3**: Medium
- **TIER 4**: Poor


### 🟢 Quantitatively Assess Name Overlaps (XS)
...


### 🟢 Out of Bounds Regions (OOBS)
...

### 🟢 Sequence Fit (SF)
...


### 🟣 Assigning  Tiers
...


## ℹ️ References:
- BEDBoss tutorial of assessing reference genome compatibility can be found here: [Reference genome validator tutorial](../../../bedboss/tutorials/python/ref_genome_tutorial/)
