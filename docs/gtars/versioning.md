# Versioning policy for gtars and its crates
Because `gtars` is organized as a [workspace](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html) with multiple crates, we need to ensure that we have a clear versioning policy for the different crates, bindings, and command line tools.

The versioning and tagging scheme was influenced by several other Rust projects we admire/use:

- `polars`: https://github.com/pola-rs/polars/tags
- `bigtools`: https://github.com/jackh726/bigtools/releases
- `noodles`: https://github.com/zaeleus/noodles/tags?after=noodles-fastq-0.19.0

## Versioning scheme
In general, we will follow [Semantic Versioning](https://semver.org/) for all crates, bindings, and command line tools. We allow independent versioning for each crate, and we will bump the version(s) of any wrapper/binding/CLI crate that depends on a crate that has been updated.

Finally, we also have a specific tagging scheme for releases on GitHub.

## Tagging scheme
- Core Rust Crates: `vX.Y.Z` (e.g., `v0.5.2`). This tag signifies a release of the core library crates to crates.io. It should trigger the cargo publish workflow.
- Python Bindings: `py-X.Y.Z` (e.g., `py-0.3.1`). This tag signifies a release of the Python package to PyPI.
- CLI: `cli-X.Y.Z` (e.g., `cli-1.1.0`). This tag signifies a release of the CLI binaries, which will be attached to a GitHub Release.
- WASM Bindings: `wasm-X.Y.Z` (e.g., `wasm-0.1.5`). This tag signifies a release of the WASM package to npm.

## An example scenario:

Say we fix a bug in `uniwig`, we will bump its version by a single patch `x.x.1` inside its `Cargo.toml`:
```diff
// gtars-uniwig/Cargo.toml
- version="0.5.0"
+ version="0.5.1"
```
We publish this to `crates.io` using `cargo publish`.

Then we will bump this version accordingly in the `gtars` wrapper crate **and** bump the crates version (since it got a new uniwig)
```diff
// gtars/Cargo.toml
- gtars-uniwig = { version="0.5.0" }
+ gtars-uniwig = { version="0.5.1" }
```
```diff
// gtars/Cargo.toml
- version="0.5.11"
+ version="0.5.12"
```
We will publish this to `crates.io` using `cargo publish`

Finally, because `uniwig` is a tool used in the command line interface, we will bump the version of `gtars-uniwig` in `gtars-cli` to the most recent version with the bug fix similarly to before. Then we will bump the version of `gtars-cli` as a whole (a single patch since its a simple bug fix in `gtars-uniwig`).
```diff
- gtars-uniwig = { version="0.5.0" }
+ gtars-uniwig = { version="0.5.1" }
```
```diff
- version="0.4.1"
+ version="0.4.2"
```
We will publish this to `crates.io` using `cargo publish`