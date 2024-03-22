# How to build a new universe?

## Data preprocessing
In this tutorial, you will use CLI to build different types of universes from example files, which can be downloaded from XXX. In there you will find a compressed folder:

```
consensus:
    - raw
    file_list.txt
    chrom.sizes
```

In the raw folder there are example BED files used in this tutorial and file withe names of files we will analyze. Additionally there is a file with chromosome sizes, which you will use to preprocess the data. 

To build any kind of a universe you need bigWig files with genome coverage by the analyzed collection, which can be made it using [uniwig](https://github.com/databio/uniwig/). First we have to combine all the analyzed files into one BED file:

```
cat raw/* > raw/combined_files.bed
```

This combined file can next be used to prepare the genome coverage tracks, with smoothing of breakpoints set to 5:

```
$UNIWIG_PATH/bin/uniwig -m 25 raw/combined_files.bed chrom.sizes coverage/all
```

## Coverage cutoff universe

First, you will create a coverage cutoff universe (CC). This is the simplest type of a universe that only includes genomic positions with coverage greater or equal to cutoff *x*. This cutoff by default is calculated using simple likelihood model that calculates the probability of appearing in a collection. The universe can be build just based on genome coverage:

```
geniml build-universe cc --coverage-folder coverage/ \
                          --output-file universe_cc.bed

```  

Depending on the task the universe can be smooth by setting `--merge` 
flag with the distance beloved witch peaks should be merged together and 
`--filter-size` with minimum size of peak that should be part of the universe. Instead of it using maximum likelihood cutoff one can also defined cutoff with `--cutoff` flag. If it is set to 1 the result is union universe, and when to number of files it wil produce intersection universe.

## Coverage cutoff flexible universe
A more complex version of coverage cutoff universe is coverage cutoff flexible universe (CCF). In contrast to its' fixed version it produces flexible universes. It uses two cutoffs calculated based on maximum likelihood cutoff, making a confidence interval around the optimal cutoff value. Despite the fact that the CFF universe is more complex it is build using the same input as the CC universe: 

```
geniml build-universe ccf --coverage-folder coverage/ \
                           --output-file universe_ccf.bed

```  

## Maximum likelihood universe
In the previous examples both CC anf CCF universes used simple likelihood model to calculate the cutoff. However, we also developed more complex likelihood model that takes into account the positions of starts and ends of the regions in the collection. This LH model can build based on coverage files:

```
geniml lh build_model --model-file model.tar \
                      --coverage-folder coverage/ \
                      --file-no `wc -l file_list.txt`
```

 The resulting tar archiver contains LH model that can be used for building flexible universes called a maximum likelihood universe (ML):

```
geniml build-universe ml --model-file model.tar \
                         --coverage-folder coverage/ \
                         --output-file universe_ml.bed 
```

## HMM 
The forth presented method of creating universes utilizes Hidden Markov Models. In this approach the parts of flexible regions are hidden states of the model, while genome coverage by the collections are emissions. The resulting universe is called Hidden Markov Model universe. It can be build only based on the genome coverage by the collection:

```
geniml build-universe hmm --coverage-folder coverage/ \
                          --output-file universe_hmm.bed

```

# How to assess new universe?

So far you used many different methods for creating new universes. But choosing, which universe represents data the best can be challenging. To help with this decision we created three different metrics for assessing universe fit to the region collections: a base-level overlap score, a region boundary score, and a likelihood score. The two first metrics can be calculated separately for each file in the collections and than summarized. To calculate them you need raw files as well as the analyzed universe. It is also necessary to choose at least one metric out of : `--overlap`, `--distance`, `--distance-universe-to-file`, `--distance-flexible`, `--distance-flexible-universe-to-file` to be calculated.  Here we present an example, which calculates all possible metrics for HMM universe:

```
 geniml assess-universe --raw-data-folder raw/ \
 --file-list file_list.txt \
 --universe universe_hmm.bed \
 --folder-out . \
 --pref test_assess \
 --overlap \
 --distance \
 --distance-universe-to-file \
 --distance-flexible \
 --distance-flexible-universe-to-file
```
The resulting file is called test_assess_data.csv, and contains seven columns with the raw calculated metrics for each file. 
More information about assessing fit of universe to a collection of files can be found in jupyter notebook version of this tutorial tha can be found [here](). 