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
bedboss check-requirements
```

### Run BEDmaker from command line
```bash
bedboss make-bed \
    --input-file path/to/input/file \
    --input-type bed\
    --outfolder path/to/output/dir \
    --genome hg38
```

### Run BEDmaker from within Python
```python
from bedboss.bedmaker.bedmaker import make_all

make_all(
    input_file="path/to/input/file",
    input_type="bed",
    output_path="path/to/output/dir",
    genome="hg38",
)
```