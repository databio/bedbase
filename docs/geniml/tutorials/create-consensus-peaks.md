# How to build a new universe

## Data preprocessing
In this tutorial, you will use CLI to build different types of universes from example files.

To build any kind of a universe you need bigWig files with genome coverage by the analyzed collection, which can be made it using [uniwig](https://github.com/databio/uniwig). Detailed description of this process can be found [here](https://github.com/databio/uniwig). In this tutorial we will used precomputed example that can be found XXX. 

Additionally, to build a universe based on likelihood, you first will need a likelihood model. To make it, you only need coverage files, result of uniwig, and the size of the collection, here it is 4. 

```
geniml lh build_model --model-file tests/consenus/model.tar \
                      --coverage-folder tests/consenus/coverage/ \
                      --file-no 4 
```

As the result you will create a tar file with the likelihood model of the collection, which we will use further. 


## Coverage cutoff universe

First, we will create a coverage universe. This is the simplest type of a universe that only includes genomic positions with coverage greater or equal to cutoff x. This cutoff by default is calculated using simple likelihood model that calculates the probability of appearing in a collection. It can be build just based on genome coverage:

```console
 geniml build-universe cc --coverage-folder tests/consenus/coverage/ \
                        --output-file tests/consenus/universe/universe.bed

```  

Depending on the task the universe can be smooth by setting `--merge` 
flag with the distance beloved witch peaks should be merged together and 
`--filter-size` with minimum size of peak that should be part of the universe. Instead of it using maximum likelihood cutoff one can also defined cutoff with `--cutoff` flag. If it is set to 1 the result is union universe, and when to number of files it wil produce intersection universe.

## Coverage cutoff flexible universe
Next presented universe is coverage cutoff flexible universe. We can do it through CLI:

```
 geniml build-universe ccf --coverage-folder tests/consenus/coverage/ \
                       --output-file tests/consenus/universe/universe.bed

```  

Where:

- `--coverage-folder`, takes the path to bigWig file with genome coverage by collection 
- `--output-file`, takes the path to output file 

Or we can import it directly into python:
```
from geniml.universe.ccf_universe import ccf_universe

ccf_universe("tests/consenus/coverage/all_core.bw",
        file_out="tests/consenus/universe/universe.bed")
```

## Maximum likelihood universe
Another type of universe that we can make is maximum likelihood flexible universe. To make it first we have to have a likelihood model of genome coverage by collection of files.

#### Making likelihood model:
To make a likelihood model we can use this CLI:

```
geniml lh build_model --model-file tests/consenus/model.tar \
                    --coverage-folder tests/consenus/coverage/ \
                    --file-no 4 
```

Where:

- `--model-file`, takes the name of tar archive that will contain the likelihood model
- `--file-no`, number of files used in analysis
- `--coverage-folder` path to folder with coverage tracks

Or, we can do it directly in python:

```
from geniml.likelihood.build_model import main

main("tests/consenus/model.tar", "tests/consesnus/coverage",
     "all",
     file_no=4)
```

#### Making universe:
Now that we have the model we make the universe:

```
geniml build-universe ml --model-file tests/consenus/model.tar \
                          --output-file tests/consenus/universe/universe.bed \
                          --coverage-folder tests/consesnus/coverage
```

Where:

- `--model-file`, takes the name of tar archive that contains the likelihood model
- `--output-file`, takes the path to output file 
- `--coverage-folder` path to folder with coverage tracks

Similarly, we can do it in python:

```
from geniml.universe.ml_universe import ml_universe

ml_universe("tests/consesnus/model.tar",
     "/home/hee6jn/Documents/geniml/tests/consesnus/coverage",
     "all",
     "tests/consenus/universe/universe.bed")
```

## HMM 
Another approach to making flexible universes is using Hidden Markov Models.
We can do it for example with:

```
geniml build-universe hmm --out-file tests/consenus/universe/universe.bed \
         --coverage-folder tests/consenus/coverage/ \
         --save-max-cove
```

Where:

- `--output-file`, takes the path to output file 
- `--coverage-folder`, path to folder with coverage tracks
- `--coverage-prefix` prefix used in uniwig for making files, default is "all"
- `--not-normlaize`, is a flag that specifies whether not to normalize tracks before running HMM
- `--save-max-cove`,  is a flag that specifies whether to save maximum coverage of each output peak

Similarly, we can do it in python:

```
from geniml.universe.hmm_universe import hmm_universe

hmm_universe("tests/consenus/coverage/",
                 "tests/consenus/universe/universe.bed",
                 save_max_cove=True)
```