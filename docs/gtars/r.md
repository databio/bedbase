# gtars-r

R bindings for gtars functionality, providing an R API for genomic interval analysis.

## Installation

To install the development version, use the `remotes` package:

``` R
install.packages("remotes")
remotes::install_github("databio/gtars", ref = "dev", subdir = "gtars-r")
```

You can also build it locally. First, make sure src/rust/Cargo.toml includes the following dependencies:

``` 
gtars-core = { git = "https://github.com/databio/gtars", branch = "dev" }
io = { git = "https://github.com/databio/gtars", branch = "dev" }
igd = { git = "https://github.com/databio/gtars", branch = "dev" }
refget = { git = "https://github.com/databio/gtars", branch = "dev" }
tokenizers = { git = "https://github.com/databio/gtars", branch = "dev", features = ["huggingface"] }
```

and comments these local dependency paths out:
```
# gtars-core = { path = "../../../gtars-core" }
# io = { path = "../../../io" }
# igd = { path = "../../../igd" }
# refget = { path = "../../../refget" }
# tokenizers = { path = "../../../tokenizers", features = ["huggingface"] }
```

If you are updating these gtars workspace dependencies and would like to test them with R bindings, you will need to push the changes to the appropriate branch first, or stick to the local dependency paths and use `rextendr::clean()` and `rextendr::document()` rather than building the package source. You can install the R package sourcing from the repo directory:

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
