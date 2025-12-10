# gtars-r

R bindings for gtars functionality, providing an R API for genomic interval analysis.

## Installation

To install the development version, use the `remotes` package:

``` R
install.packages("remotes")
remotes::install_github("databio/gtars", ref = "dev", subdir = "gtars-r")
```

You can also install the R package locally from the repo directory:

``` console
R CMD INSTALL gtars-r
```

## Available Modules

### refget
``` R
library(gtars)

# Compute sequence digest
readable <- 'ACGTACGT'
gtars::sha512t24u_digest(readable)
gtars::md5_digest(readable)

# Use RefgetStore for sequence management
store <- global_refget_store('raw')
```

### IGD
``` R
library(gtars)

### Building an Index
igd_create(output_path = '/home/igd_output/', filelist = '/home/my_bedfiles/')

### Querying with a single bed file
igd_search(database_path = 'my_igd_database.igd', query_path = 'my_query.bed')
```
