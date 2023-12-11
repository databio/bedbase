# BEDboss insert 

Bedboss supports inserting and running all pipelines using a single command: `bedboss insert`.

To run `bedboss insert` you need to have few things set up:
0) Installed bedboss dependencies. See [bedboss dependencies](./how_to_install_r_dep.md) for more information.</br>
1) Created **config file** with all the necessary information. See [bedboss config](./how_to_config_bedboss.md) for more information </br>
2) **PEP** project with all the necessary information. Project can be stored locally or on [PEPhub](https://pephub.databio.org/) </br>
Before running pipeline PEP should be validated using eido or pephub schema. Bedboss insert schema: [bedboss insert schema](https://schema.databio.org/pipelines/bedboss.yaml) </br>
3) Provide path to **output directory**</br>

Additional information can be found in the [bedboss insert](../bedboss_usage.md) documentation.

### Example PEP:
https://pephub.databio.org/khoroshevskyi/example


### Example run:
When we have all the necessary information we can run the pipeline:
```bash
bedboss insert --bedbase-config bedboss_config.yaml --pep khoroshevskyi/example --output-folder ./bedboss_output
```