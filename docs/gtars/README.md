<p align="center">
<h1><img align="center" src="../img/gtars_logo_new_with_words.png" class="img-header" height="100"></h1>
</p>


<p align="center">
<a href="https://pypi.org/project/gtars"><img src="https://img.shields.io/pypi/v/gtars" alt=""></a>
<a href="https://github.com/databio/gtars"><img src="https://img.shields.io/badge/source-github-354a75?logo=github"></a>
</p>


`gtars` is a rust crate that provides a set of tools for working with genomic interval data. Its primary goal is to provide processors for our python package, [`geniml`](https:github.com/databio/geniml), a library for machine learning on genomic intervals. However, it can be used as a standalone library for working with genomic intervals as well.

`gtars` provides three things:

1. A rust library crate.
2. A command-line interface, written in rust.
3. A Python package that provides bindings to the rust library.
