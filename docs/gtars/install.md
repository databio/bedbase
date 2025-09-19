# 💿 Installing gtars

Gtars is available as a Rust crate, Python package, and R package. You can install it using the following methods:


--- 
## 🦀 Rust

- #### 🟢 Release versions

You can get latest released rust gtars crate via [cargo](https://crates.io/crates/gtars):

```bash
cargo install gtars
```

- #### 🟡 Development versions

You can find development versions and pre-releases on GitHub.

--- 
## 🐍 Python bindings

- #### 🟢 Release version

You can get latest released Python package `gtars` from PyPI:

```console
pip install gtars
```

- #### 🟡 Development version

To install the development version, you'll have to build it locally. Build Python bindings like this:

```console
cd bindings/python
maturin build --interpreter 3.11 --release
```

Then install the local wheel that was just built:

```console
gtars_version=`grep '^version =' Cargo.toml | cut -d '"' -f 2`
python_version=$(python --version | awk '{print $2}' | cut -d '.' -f1-2 | tr -d '.')
wheel_path=$(find target/wheels/gtars-${gtars_version}-cp${python_version}-cp${python_version}-*.whl)
pip install --force-reinstall ${wheel_path}
```

## 🆁 R bindings

🚧 **Work in progress** 🚧
