.install_pkg = function(p, bioc=FALSE) {
    if(!require(package = p, character.only=TRUE)) {
        if(bioc) {
            BiocManager::install(pkgs = p)
        } else {
            install.packages(pkgs = p)   
        }
    }
}

.install_pkg("R.utils")
.install_pkg("BiocManager")
.install_pkg("optparse")
.install_pkg("devtools")
.install_pkg("GenomicRanges", bioc=TRUE)
.install_pkg("GenomicFeatures", bioc=TRUE)
.install_pkg("ensembldb", bioc=TRUE)
.install_pkg("LOLA", bioc=TRUE)
.install_pkg("BSgenome", bioc=TRUE)
if(!require(package = "GenomicDistributions", character.only=TRUE)) {
    devtools::install_github("databio/GenomicDistributions")
}
if(!require(package = "GenomicDistributionsData", character.only=TRUE)) {
    install.packages("http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.1.tar.gz", repos=NULL)
}
