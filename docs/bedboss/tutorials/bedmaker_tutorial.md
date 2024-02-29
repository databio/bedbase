## BEDmaker

The BEDmaker is a tool that allows you to convert various file types into BED format and bigBed format.
Currently supported formats are:
- bed 
- bigBed
- bigWig
- wig

Before running pipeline first, you have to install bedboss and check if bedmaker requirements are satisfied.
To do so, you can run the next command:
```bash
bedboss requirements-check
```

### Run BEDmaker from command line
```bash
bedboss make \
    --input-file path/to/input/file \
    --input-type bed\
    --output-folder path/to/output/dir \
    --genome hg38 \
    --sample-name sample1
    --bigbed "path/to/bigbedfile.bigbed" # optional
```

### Run BEDmaker from within Python
```python
from bedboss.bedmaker.bedmaker import make_all

make_all(
    input_file="path/to/input/file",
    input_type="bed",
    output_folder="path/to/output/dir",
    genome="hg38",
    sample_name="sample1",
    bigbed="path/to/bigbedfile.bigbed" # optional
)
```