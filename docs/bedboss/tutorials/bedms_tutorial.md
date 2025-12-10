## BEDMS

BEDMS (BED Metadata Standardizer) is a tool designed to standardize genomics and epigenomics metadata attributes according to user-selected or user-trained schemas. BEDMS ensures consistency and FAIRness of metadata across different platforms. 
Users can interact with BEDMS either through Python or via [PEPhub](https://pephub.databio.org/) choosing from predefined schemas provided by the tool. Additionally, BEDMS allows users to create and train custom schemas as per their project requirements. For detailed information on the available schemas, please visit [HuggingFace](https://huggingface.co/databio/attribute-standardizer-model6). 

### Installation

To install bedms use this command:

```
pip install bedms
```

or install the latest version from the GitHub repository:

```
pip install git+https://github.com/databio/bedms.git
```

### Usage

BEDMS can be used to standardize metadata attributes based on available schemas, train models on custom schemas, and standardize attributes based on the custom schema models.

### Standardizing based on available schemas

If you want to standardize the attributes in your PEP based on our available schemas, you can either visit [PEPhub](https://pephub.databio.org/) or using Python:

```python
from bedms import AttrStandardizer

model = AttrStandardizer(
    repo_id="databio/attribute-standardizer-model6", model_name="encode"
)
results = model.standardize(pep="geo/gse228634:default")

print(results) #Dictionary of suggested predictions with their confidence: {'attr_1':{'prediction_1': 0.70, 'prediction_2':0.30}}
```
In the above example, we have provided the `repo_id` which is the path to the repository that holds the models on HuggingFace. The `model_name` selection can vary based on your choice of schema. You can view the schemas on PEPhub for [encode](https://pephub.databio.org/schemas/databio/bedms_encode), [fairtracks](https://pephub.databio.org/schemas/databio/bedms_fairtracks), and [bedbase](https://pephub.databio.org/schemas/databio/bedms_bedbase).
For standardization, you need to provide the path to your PEP which in the above example is `pep="geo/gse228634:default"`.

### Training custom schemas

If you want to train your custom schema-based models, you would need two things to get started:
    1. Training sets   
    2. HuggingFace model and associated files

#### Training sets

To develop training sets, follow the step by step protocol mentioned below:   

1. Select what attributes would be most suitable for your project metadata. For example, here are some attributes that you might choose:  
    ```
    sample_name: Name of the sample_name
    assembly: Genome assembly (e.g. hg38)
    species_name: Scientific name of the species 
    ``` 

2. Fetch training data from ontologies, publications and other available surces to make two directories: `values_directory` and `headers_directory`. `values_directory` has all the values associated with that attribute while the `headers_directory` has various synonyms for the attribute names. 
    The directory structure would look like this:
    ```
    values_directory/
        values_1.csv
        values_2.csv
        values_3.csv
        .
        .
        values_1000.csv

    headers_directory/
        headers_1.csv
        headers_2.csv
        headers_3.csv
        .
        .
        values_1000.csv
    ```
        To see an example of what a `values_*.csv` and `headers_*.csv` might look like, you can check our sample csv files on PEPhub: [sample_bedms_values_1.csv](https://pephub.databio.org/databio/sample_bedms_values_1?tag=default) and [sample_bedms-headers_1.csv](https://pephub.databio.org/databio/sample_bedms_headers_1?tag=default).
    While these are only samples and are not information dense, we recommend having large vocabulary for the training files for both the `values_directory` and `headers_directory`. To get a better understanding of the training data that we trained BEDMS on, you can visit this [link](https://big.databio.org/bedms/)

3. Once your training sets are ready, you can make a directory for your schema in your HuggingFace repository. If the name of your schema is `new_schema` and the name of your repository is `new_repo`, this is what the directory structure will look like:
    ```
    new_repo/
        new_schema/
            new_schema_design.yaml #This has the schema design defining the attributes with their data types and descriptions

    ```

4. You can now start training your model using the `AttrStandardizerTrainer` module. For this, you would need a `training_config.yaml`. Please follow the config file schema given [here](https://github.com/databio/bedms/blob/saanika/training_config.yaml).

    To instantiate `AttrStandardizerTrainer` class:

    ```python
    from bedms.train import TrainStandardizer

    trainer = TrainStandardizer("training_config.yaml")

    ```
    To load the datasets and encode them:

    ```python
    train_data, val_data, test_data, label_encoder, vectorizer = trainer.load_data()
    ```

    To train the custom model:

    ```python
    trainer.train()
    ```

    To test the custom model:

    ```python
    test_results_dict = trainer.test() #Dictionary with Precision, Recall, and F1 values
    ```

    To generate visualizations such as Learning Curves, Confusion Matrices, and ROC Curve:

    ```python
    acc_fig, loss_fig, conf_fig, roc_fig = trainer.plot_visualizations() 
    ```
    Where `acc_fig` is Accuracy Curve figure object, `loss_fig` is Loss Curve figure object, `conf_fig` is the Confusion Matrix figure object, and `roc_fig` is the ROC Curve figure object. 

5. After your model is trained, you will have three files for it (paths to which you mentioned in the `training_config.yaml`):  
        i. `model_pth` : Path to your model. Let us assume it is named `model_new_schema.pth`.  
        ii. `label_encoder_pth`: Path to the Label Encoder. Let us assume it is named `label_encoder_new_schema.pkl`.  
        iii. `vectorizer_pth`: Path to the Vectorizer. Let us assume it is named `vectorizer_new_schema.pkl`.  
    Upload these files to your HuggingFace repository in the directory you had made earlier `new_repo/new_schema`.  
    Now, your HuggingFace repository would look something like this:

    ```
    new_repo/
        new_schema/
            new_schema_design.yaml #This has the schema design defining the attributes with their data types and descriptions
            model_new_schema.pth 
            label_encoder_new_schema.pkl
            vectorizer.pkl
    ```

6. You're just one step away from standardizing metadata according to your custom schema. You would need to add a config file with the parameters you trained your model on to the `new_schema/` directory. Name this config file as `config_new_schema.yaml`. The config file should have the following keys:
    ```
    params:
    input_size_bow: int
    embedding_size: int
    hidden_size: int
    output_size: int
    dropout_prob: float
    ```
    Provide the values that you trained your model on. Now, the completely trained repository should have the following structure:

    ```
    new_repo/
        new_schema/
            new_schema_design.yaml #This has the schema design defining the attributes with their data types and descriptions
            model_new_schema.pth 
            label_encoder_new_schema.pkl
            vectorizer.pkl
            config_new_schema.yaml
    ```
    Before moving on to standardization, confirm that all the above files are present in your repository.

#### Standardizing on custom schema models

For standardizing on custom schema model, instantiate `AttrStandardizer` and provide the repo_id:

```python
from bedms import AttrStandardizer

model = AttrStandardizer(
    repo_id="new_repo", model_name="new_schema"
)
results = model.standardize(pep="geo/gse228634:default")

print(results) #Dictionary of suggested predictions with their confidence: {'attr_1':{'prediction_1': 0.70, 'prediction_2':0.30}}
```