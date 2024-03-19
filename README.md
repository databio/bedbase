# BEDbase documentation

This repository hosts the documentation for BEDbase and related tools. Please visit <https://docs.bedbase.org> to view this rendered documentation.

Documentation is written using [mkdocs](https://www.mkdocs.org/) and themed with [material for mkdocs](https://squidfunk.github.io/mkdocs-material/). The repository has:

- `mkdocs.yml`: the primary configuration, as well as the structure of the documentation. 
- `/docs`: the markdown files. Each tool gets its own folder.

## How to write/update documentation

Each tool gets a `nav` section in `mkdocs.yml`, which maps to its own section/tab in the rendered documentation. So to add a new page, change titles, or change structure, edit `mkdocs.yml`. To edit the documentation itself, edit the `.md` documentation files in the subfolders under `/docs`.

### Prereqs

```
pip install mkdocs-material
```


### Building locally for development

I recommend previewing your changes locally before deploying. You can get a hot-reload server going by cloning this repository, and then just running:

```
mkdocs serve
```

You can also use `mkdocs build` to build a portable local version of the docs.


### Publishing updates

The documentation is published automatically upon commits to `master` using a GitHub Action, which runs `mkdocs gh-deploy`. This builds the docs, and pushes them to the `gh-pages` branch. This branch is then published with GitHub Pages. There's no need to do this locally, just let the action deploy the updates for you automatically.

## FAQ


### Updating automatic documentation

In the past, I had a plugin that would auto-document 2 things: 1. Python docs using lucidoc, and 2. Jupyter notebooks. This plugin was neat, but it caused me a lot of maintenance issues as well. So now, I've made it much simpler; now it's no longer a plugin, just a simple Python script. Update all the auto-generated docs (stored in `docs/autodoc_build`) by running the update script manually:

```console
python update_python_autodocs.py
```

#### Configuring lucidoc rendering

Auto-generated Python documentation with `lucidoc` rendering is configured in the `lucidoc`  sections of `mkdocs.yml`.

```yaml
lucidoc:
  peppy: path/to/output.md
```

#### Configuring jupyter rendering

Configure jupyter notebeeoks in the `jupyter` section, where you specify a list of `in` (for `.ipynb` files) and `out` (for `.md` files) locations.

```yaml
jupyter:
  - in: path/to/notebook_folder1
    out: path/to/rendered_folder1
  - in: path/to/notebook_folder2
    out: path/to/rendered_folder2
``` 

There, you can specify which folders contain notebooks, and to where they should be rendered as markdown.

#### Rendering jupyter notebooks in this repository

By convention, we're putting jupyter notebooks in a `/notebooks` subfolder under each tool (look around for examples). These are then built into the `code/<notebook_name>.md` file by the authodoc.py. So, to add a new notebook:

1. put the notebook into a `<module>/notebooks/<notebook_name>.ipynb`
2. make sure that's listed in the `jupyter` section of the yaml (it already should be there if you're adding a notebook to an existing folder).
3. link to the notebook in `mkdocs.yaml` by linking to `<module>/code/<notebook_name>.md`.
4. you can build your rendered markdown version by running `python autodoc.py`.

