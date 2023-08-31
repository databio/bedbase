#!/usr/bin/env bash
#
# bedboss pipeline dependencies installation check
#
echo -e "-----------------------------------------------------------"
echo -e "                                                           "
echo -e "             bedboss installation check                    "
echo -e "                                                           "
echo -e "-----------------------------------------------------------"

##############################################################
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

fail() {
    printf "${RED}\u2716 $*${NC}\n"
}

success() {
    printf "${GREEN}\xE2\x9C\x94 $*${NC}\n"
}

warn() {
    printf "${YELLOW}\u26A0 $*${NC}\n"
}


# Helpful functions
trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}

is_executable() {
    if [ -x "$(command -v $1)" ]; then
        echo $(success "$1 is installed correctly")
        return 0
    else
        echo $(warn "WARNING: '$1' is not installed. To install '$1' check bedboss documentation: https://bedboss.databio.org/")
        return 1
    fi
}

pip_check() {
    if pip show -q $1; then
        echo $(success "package $(pip freeze | grep $1)")
        return 0
    else
        echo $(fail "package $1 is not installed")
        return 1
    fi
}

r_check_req() {
cmd=$(echo "Rscript -e 'library(\"$1\")'")
    packageInstalled=$(eval $cmd 2>&1)
    if [[ "$packageInstalled" == *Error* ]]; then
        echo $(fail "Error: Please install the R package, $1, and checkinstall again.")
#       printf "\n"
        NATIVE_INSTALL=1
    else
        echo -e $(success "SUCCESS: R package: ${1}")
    fi
}

################################################################################
echo -e "Checking native installation...                            "
INSTALL_ERROR=0
INSTALL_WARNINGS=0

echo -e "Language compilers...                            "
echo -e "-----------------------------------------------------------"

# Check Python installation
if ! is_executable "python"; then
    if ! is_executable "python3"; then
      INSTALL_ERROR=$((INSTALL_ERROR+1))
    fi
fi
# is R installation
if ! is_executable "R"; then
    INSTALL_ERROR=$((INSTALL_ERROR+1))
fi
echo -e "-----------------------------------------------------------"
echo -e "Checking bedmaker dependencies...                            "
echo -e "-----------------------------------------------------------"

if ! pip_check "bedboss"; then
    INSTALL_ERROR=$((INSTALL_ERROR+1))
fi
if ! pip_check "refgenconf"; then
    INSTALL_ERROR=$((INSTALL_ERROR+1))
fi

# Check bedmaker packages
if ! is_executable "bedToBigBed"; then
    INSTALL_ERROR=$((INSTALL_ERROR+1))
    echo $(fail "ERROR: 'bedToBigBed' is not installed. To install 'bedToBigBed' check bedboss documentation: https://bedboss.databio.org/")
fi

if ! is_executable "bigBedToBed"; then
    INSTALL_WARNINGS=$((INSTALL_WARNINGS+1))
fi

if ! is_executable "bigWigToBedGraph"; then
    INSTALL_WARNINGS=$((INSTALL_WARNINGS+1))
fi

if ! is_executable "wigToBigWig"; then
    INSTALL_WARNINGS=$((INSTALL_WARNINGS+1))
fi

echo -e "-----------------------------------------------------------"
echo -e "Checking required R packages for bedstat...                            "
echo -e "-----------------------------------------------------------"

declare -a requiredRPackages=("optparse ""devtools" "ensembldb" "ExperimentHub" "AnnotationHub" "AnnotationFilter" "BSgenome" "GenomicFeatures" "GenomicDistributions" "GenomicDistributionsData" "GenomeInfoDb" "ensembldb" "tools" "R.utils" "LOLA")
for package in "${requiredRPackages[@]}"; do
  if ! r_check_req $package; then
    INSTALL_ERROR=$((INSTALL_ERROR+1))
  fi
done

echo "Number of WARNINGS: $INSTALL_WARNINGS"

exit $INSTALL_ERROR