jupyter:True
# BEDBASE workflow tutorial

This demo demonstrates how to process, analyze, visualize, and serve BED files. The process has 5 steps: First, the [bedmaker](https://github.com/databio/bedmaker) pipeline converts different region data files (bed, bedGraph, bigBed, bigWig, and wig) into BED format and generates bigBed format for each file for visualization in Genome Browser.  An optional step, the [bedqc](https://github.com/databio/bedqc) pipline, flags the BED files that you might not want to include in the downstream analysis.  Second, individual BED files are analyzed using the [bedstat](https://github.com/databio/bedstat) pipeline. Third, BED files are grouped and then analyzed as groups using the [bedbuncher](https://github.com/databio/bedbuncher) pipeline. Fourth, [bedembed](https://github.com/databio/bedembed) uses the StarSpace method to embed the bed files and the meta data, and the distances between the file labels and trained search terms will be calculated with cosine distance. Finally, the BED files, along with statistics, plots, and grouping information, is served via a web interface and RESTful API using the [bedhost](https://github.com/databio/bedhost) package.

**Glossary of terms:**

- *bedfile*: a tab-delimited file with one genomic region per line. Each genomic region is decribed by 3 required columns: chrom, start and end.
- *bedset*: a collection of BED files grouped by with a shared biological, experimental, or logical criterion.


<h1>Table of Contents<span class="tocSkip"></span></h1>
<div class="toc"><ul class="toc-item"><li><span><a href="#1.-Preparation" data-toc-modified-id="1.-Preparation-1"><span class="toc-item-num">1&nbsp;&nbsp;</span>1. Preparation</a></span></li><li><span><a href="#2.-BEDMAKER:-convert-non-bed-files-into-bed-files-and-generate-bigBed-files-for-genome-browser-tracks" data-toc-modified-id="2.-BEDMAKER:-convert-non-bed-files-into-bed-files-and-generate-bigBed-files-for-genome-browser-tracks-2"><span class="toc-item-num">2&nbsp;&nbsp;</span>2. BEDMAKER: convert non-bed files into bed files and generate bigBed files for genome browser tracks</a></span><ul class="toc-item"><li><span><a href="#Get-a-PEP-describing-the-files-to-process" data-toc-modified-id="Get-a-PEP-describing-the-files-to-process-2.1"><span class="toc-item-num">2.1&nbsp;&nbsp;</span>Get a PEP describing the files to process</a></span></li><li><span><a href="#Run-bedmaker-on-the-demo-PEP" data-toc-modified-id="Run-bedmaker-on-the-demo-PEP-2.2"><span class="toc-item-num">2.2&nbsp;&nbsp;</span>Run bedmaker on the demo PEP</a></span></li></ul></li><li><span><a href="#OPTIONAL-BEDQC:-flag-bed-files-for-futher-evaluation-to-determine-whether-they-should-be-included-in-the-downstream-analysis" data-toc-modified-id="OPTIONAL-BEDQC:-flag-bed-files-for-futher-evaluation-to-determine-whether-they-should-be-included-in-the-downstream-analysis"><span class="toc-item-num">&nbsp;&nbsp;</span>OPTIONAL BEDQC: flag bed files for futher evaluation to determine whether they should be included in the downstream analysis</a></span><ul class="toc-item"><li><span><a href="#Get-a-PEP-describing-the-files-to-process" data-toc-modified-id="Get-a-PEP-describing-the-files-to-process"><span class="toc-item-num">&nbsp;&nbsp;</span>Get a PEP describing the files to process</a></span></li><li><span><a href="#Run-bedqc-on-the-demo-PEP" data-toc-modified-id="Run-bedqc-on-the-demo-PEP"><span class="toc-item-num">&nbsp;&nbsp;</span>Run bedqc on the demo PEP</a></span></li></ul></li><li><span><a href="#3.-BEDSTAT:-Generate-statistics-and-plots-of-BED-files" data-toc-modified-id="3.-BEDSTAT:-Generate-statistics-and-plots-of-BED-files-3"><span class="toc-item-num">3&nbsp;&nbsp;</span>3. BEDSTAT: Generate statistics and plots of BED files</a></span><ul class="toc-item"><li><span><a href="#Get-a-PEP-describing-the-bedfiles-to-process" data-toc-modified-id="Get-a-PEP-describing-the-bedfiles-to-process-3.1"><span class="toc-item-num">3.1&nbsp;&nbsp;</span>Get a PEP describing the bedfiles to process</a></span></li><li><span><a href="#Install-bedstat-dependencies" data-toc-modified-id="Install-bedstat-dependencies-3.2"><span class="toc-item-num">3.2&nbsp;&nbsp;</span>Install bedstat dependencies</a></span></li><li><span><a href="#Inititiate-a-local-PostgreSQL-instance" data-toc-modified-id="Inititiate-a-local-PostgreSQL-instance-3.3"><span class="toc-item-num">3.3&nbsp;&nbsp;</span>Inititiate a local PostgreSQL instance</a></span></li><li><span><a href="#Run-bedstat--on-the-demo-PEP" data-toc-modified-id="Run-bedstat--on-the-demo-PEP-3.4"><span class="toc-item-num">3.4&nbsp;&nbsp;</span>Run bedstat  on the demo PEP</a></span></li></ul></li><li><span><a href="#4.-BEDBUNCHER:-Create-bedsets-and-their-respective-statistics" data-toc-modified-id="4.-BEDBUNCHER:-Create-bedsets-and-their-respective-statistics-4"><span class="toc-item-num">4&nbsp;&nbsp;</span>4. BEDBUNCHER: Create bedsets and their respective statistics</a></span><ul class="toc-item"><li><span><a href="#Create-a-new-PEP-describing-the-bedset-name-and-specific-JSON-query" data-toc-modified-id="Create-a-new-PEP-describing-the-bedset-name-and-specific-JSON-query-4.1"><span class="toc-item-num">4.1&nbsp;&nbsp;</span>Create a new PEP describing the bedset name and specific JSON query</a></span></li><li><span><a href="#Create-outputs-directory-and-install-bedbuncher-CML-dependencies" data-toc-modified-id="Create-outputs-directory-and-install-bedbuncher-CML-dependencies-4.2"><span class="toc-item-num">4.2&nbsp;&nbsp;</span>Create outputs directory and install bedbuncher CML dependencies</a></span></li><li><span><a href="#Run-bedbuncher-using-Looper" data-toc-modified-id="Run-bedbuncher-using-Looper-4.3"><span class="toc-item-num">4.3&nbsp;&nbsp;</span>Run bedbuncher using Looper</a></span></li></ul></li><li><span><a href="#5.-BEDHOST:--Serve-BED-files-and-API-to-explore-pipeline-outputs" data-toc-modified-id="5.-BEDHOST:--Serve-BED-files-and-API-to-explore-pipeline-outputs-5"><span class="toc-item-num">5&nbsp;&nbsp;</span>5. BEDHOST:  Serve BED files and API to explore pipeline outputs</a></span></li></ul></div>

## 1. Preparation 

First, we will create a tutorial directory where we'll store the bedbase pipelines and files to be processed. We'll also need to create an environment variable that points to the tutorial directory (we'll need this variable later). 


```bash
# mkdir bedbase_tutorial
cd bedbase_tutorial
export BEDBASE_DATA_PATH_HOST=`pwd`
export CODE=`pwd`
```

```.output
bash: cd: bedbase_tutorial: No such file or directory

```

Download some example BED files:


```bash
wget http://big.databio.org/example_data/bedbase_tutorial/bed_files.tar.gz     
```

```.output
--2023-08-11 08:10:02--  http://big.databio.org/example_data/bedbase_tutorial/bed_files.tar.gz
Resolving big.databio.org (big.databio.org)... 128.143.223.179
Connecting to big.databio.org (big.databio.org)|128.143.223.179|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 44549692 (42M) [application/octet-stream]
Saving to: ‘bed_files.tar.gz’

bed_files.tar.gz    100%[===================>]  42.49M   303KB/s    in 95s     

2023-08-11 08:11:37 (458 KB/s) - ‘bed_files.tar.gz’ saved [44549692/44549692]


```

The downloaded files are compressed so we'll need to untar them:


```bash
tar -zxvf bed_files.tar.gz && mv bed_files files
```

```.output
bed_files/
bed_files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz
bed_files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz
bed_files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
bed_files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz
bed_files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz
bed_files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz
bed_files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
bed_files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz
bed_files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz
bed_files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz
bed_files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz

```


```bash
rm bed_files.tar.gz
```

Additionally, we'll download a matrix we need to provide if we wish to plot the tissue specificity of our set of genomic ranges:

Lastly, we'll download the core pipelines and tools needed to complete this tutorial: `bedmaker`, `bedqc`, `bedstat`, `bedbuncher` , `bedhost`, and `bedhost-ui`


```bash
pip install looper==1.5.1
pip install refgenie
```

```.output
Collecting looper==1.5.1
  Downloading looper-1.5.1-py3-none-any.whl (121 kB)
[2K     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 121.8/121.8 KB 734.8 kB/s eta 0:00:00 kB/s eta 0:00:01
[?25hCollecting pipestat>=0.5.1
  Downloading pipestat-0.5.1-py3-none-any.whl (61 kB)
[2K     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 61.2/61.2 KB 724.9 kB/s eta 0:00:00 kB/s eta 0:00:01
[?25hRequirement already satisfied: pandas>=2.0.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (2.0.3)
Requirement already satisfied: logmuse>=0.2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.2.7)
Requirement already satisfied: ubiquerg>=0.5.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.6.2)
Requirement already satisfied: pyyaml>=3.12 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (6.0)
Requirement already satisfied: eido>=0.2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.2.1)
Requirement already satisfied: peppy>=0.35.4 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.35.7)
Requirement already satisfied: yacman>=0.9 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.9.1)
Requirement already satisfied: colorama>=0.3.9 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.4.6)
Requirement already satisfied: divvy>=0.5.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.6.0)
Requirement already satisfied: rich>=9.10.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (13.3.1)
Requirement already satisfied: jinja2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (3.1.2)
Requirement already satisfied: pephubclient in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from looper==1.5.1) (0.1.0)
Requirement already satisfied: attmap>=0.12.9 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from divvy>=0.5.0->looper==1.5.1) (0.13.2)
Requirement already satisfied: jsonschema>=3.0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from eido>=0.2.0->looper==1.5.1) (4.17.3)
Requirement already satisfied: pytz>=2020.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=2.0.2->looper==1.5.1) (2022.7.1)
Requirement already satisfied: numpy>=1.21.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=2.0.2->looper==1.5.1) (1.22.0)
Requirement already satisfied: tzdata>=2022.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=2.0.2->looper==1.5.1) (2023.3)
Requirement already satisfied: python-dateutil>=2.8.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=2.0.2->looper==1.5.1) (2.8.2)
Requirement already satisfied: oyaml in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.5.1->looper==1.5.1) (1.0)
Requirement already satisfied: psycopg2-binary in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.5.1->looper==1.5.1) (2.9.5)
Requirement already satisfied: pydantic<2.0.0,>=1.10.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.5.1->looper==1.5.1) (1.10.7)
Requirement already satisfied: sqlmodel>=0.0.8 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.5.1->looper==1.5.1) (0.0.8)
Requirement already satisfied: pygments<3.0.0,>=2.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=9.10.0->looper==1.5.1) (2.14.0)
Requirement already satisfied: markdown-it-py<3.0.0,>=2.1.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=9.10.0->looper==1.5.1) (2.1.0)
Requirement already satisfied: MarkupSafe>=2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jinja2->looper==1.5.1) (2.1.2)
Requirement already satisfied: requests>=2.28.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pephubclient->looper==1.5.1) (2.28.2)
Requirement already satisfied: typer>=0.7.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pephubclient->looper==1.5.1) (0.8.0)
Requirement already satisfied: attrs>=17.4.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->eido>=0.2.0->looper==1.5.1) (22.2.0)
Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->eido>=0.2.0->looper==1.5.1) (0.19.3)
Requirement already satisfied: mdurl~=0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from markdown-it-py<3.0.0,>=2.1.0->rich>=9.10.0->looper==1.5.1) (0.1.2)
Requirement already satisfied: typing-extensions>=4.2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pydantic<2.0.0,>=1.10.7->pipestat>=0.5.1->looper==1.5.1) (4.4.0)
Requirement already satisfied: six>=1.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from python-dateutil>=2.8.2->pandas>=2.0.2->looper==1.5.1) (1.16.0)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->pephubclient->looper==1.5.1) (3.0.1)
Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->pephubclient->looper==1.5.1) (1.26.14)
Requirement already satisfied: idna<4,>=2.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->pephubclient->looper==1.5.1) (3.4)
Requirement already satisfied: certifi>=2017.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->pephubclient->looper==1.5.1) (2022.12.7)
Requirement already satisfied: SQLAlchemy<=1.4.41,>=1.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlmodel>=0.0.8->pipestat>=0.5.1->looper==1.5.1) (1.4.41)
Requirement already satisfied: sqlalchemy2-stubs in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlmodel>=0.0.8->pipestat>=0.5.1->looper==1.5.1) (0.0.2a35)
Requirement already satisfied: click<9.0.0,>=7.1.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from typer>=0.7.0->pephubclient->looper==1.5.1) (8.1.3)
Requirement already satisfied: greenlet!=0.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from SQLAlchemy<=1.4.41,>=1.4.17->sqlmodel>=0.0.8->pipestat>=0.5.1->looper==1.5.1) (2.0.2)
Installing collected packages: pipestat, looper
  Attempting uninstall: pipestat
    Found existing installation: pipestat 0.5.0
    Uninstalling pipestat-0.5.0:
      Successfully uninstalled pipestat-0.5.0
  Attempting uninstall: looper
    Found existing installation: looper 1.5.0
    Uninstalling looper-1.5.0:
      Successfully uninstalled looper-1.5.0
Successfully installed looper-1.5.1 pipestat-0.5.1
Requirement already satisfied: refgenie in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (0.12.1)
Requirement already satisfied: pyfaidx>=0.5.5.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenie) (0.7.1)
Requirement already satisfied: refgenconf>=0.12.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenie) (0.12.2)
Requirement already satisfied: piper>=0.12.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenie) (0.13.2)
Requirement already satisfied: logmuse>=0.2.6 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenie) (0.2.7)
Requirement already satisfied: yacman>=0.8.3 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenie) (0.9.1)
Requirement already satisfied: ubiquerg>=0.4.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.12.1->refgenie) (0.6.2)
Requirement already satisfied: pipestat>=0.4.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.12.1->refgenie) (0.5.1)
Requirement already satisfied: pandas in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.12.1->refgenie) (2.0.3)
Requirement already satisfied: attmap>=0.12.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.12.1->refgenie) (0.13.2)
Requirement already satisfied: psutil in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.12.1->refgenie) (5.9.4)
Requirement already satisfied: setuptools>=0.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pyfaidx>=0.5.5.2->refgenie) (59.6.0)
Requirement already satisfied: six in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pyfaidx>=0.5.5.2->refgenie) (1.16.0)
Requirement already satisfied: future in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (0.18.3)
Requirement already satisfied: jsonschema>=3.0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (4.17.3)
Requirement already satisfied: pyyaml in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (6.0)
Requirement already satisfied: tqdm in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (4.64.1)
Requirement already satisfied: rich>=9.0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (13.3.1)
Requirement already satisfied: requests in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->refgenie) (2.28.2)
Requirement already satisfied: oyaml in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from yacman>=0.8.3->refgenie) (1.0)
Requirement already satisfied: attrs>=17.4.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->refgenconf>=0.12.2->refgenie) (22.2.0)
Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->refgenconf>=0.12.2->refgenie) (0.19.3)
Requirement already satisfied: pydantic<2.0.0,>=1.10.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->piper>=0.12.1->refgenie) (1.10.7)
Requirement already satisfied: sqlmodel>=0.0.8 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->piper>=0.12.1->refgenie) (0.0.8)
Requirement already satisfied: eido in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->piper>=0.12.1->refgenie) (0.2.1)
Requirement already satisfied: psycopg2-binary in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->piper>=0.12.1->refgenie) (2.9.5)
Requirement already satisfied: pygments<3.0.0,>=2.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=9.0.1->refgenconf>=0.12.2->refgenie) (2.14.0)
Requirement already satisfied: markdown-it-py<3.0.0,>=2.1.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=9.0.1->refgenconf>=0.12.2->refgenie) (2.1.0)
Requirement already satisfied: pytz>=2020.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas->piper>=0.12.1->refgenie) (2022.7.1)
Requirement already satisfied: python-dateutil>=2.8.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas->piper>=0.12.1->refgenie) (2.8.2)
Requirement already satisfied: tzdata>=2022.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas->piper>=0.12.1->refgenie) (2023.3)
Requirement already satisfied: numpy>=1.21.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas->piper>=0.12.1->refgenie) (1.22.0)
Requirement already satisfied: certifi>=2017.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests->refgenconf>=0.12.2->refgenie) (2022.12.7)
Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests->refgenconf>=0.12.2->refgenie) (1.26.14)
Requirement already satisfied: idna<4,>=2.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests->refgenconf>=0.12.2->refgenie) (3.4)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests->refgenconf>=0.12.2->refgenie) (3.0.1)
Requirement already satisfied: mdurl~=0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from markdown-it-py<3.0.0,>=2.1.0->rich>=9.0.1->refgenconf>=0.12.2->refgenie) (0.1.2)
Requirement already satisfied: typing-extensions>=4.2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pydantic<2.0.0,>=1.10.7->pipestat>=0.4.0->piper>=0.12.1->refgenie) (4.4.0)
Requirement already satisfied: sqlalchemy2-stubs in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlmodel>=0.0.8->pipestat>=0.4.0->piper>=0.12.1->refgenie) (0.0.2a35)
Requirement already satisfied: SQLAlchemy<=1.4.41,>=1.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlmodel>=0.0.8->pipestat>=0.4.0->piper>=0.12.1->refgenie) (1.4.41)
Requirement already satisfied: peppy>=0.35.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from eido->pipestat>=0.4.0->piper>=0.12.1->refgenie) (0.35.7)
Requirement already satisfied: greenlet!=0.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from SQLAlchemy<=1.4.41,>=1.4.17->sqlmodel>=0.0.8->pipestat>=0.4.0->piper>=0.12.1->refgenie) (2.0.2)

```


```bash
git clone -b dev-bedboss git@github.com:databio/bedbase.git
pip install bedboss==0.1.0a2
# git clone -b validate_genome_assembly git@github.com:databio/bedbuncher
# git clone git@github.com:databio/bedembed
# git clone -b dev git@github.com:databio/bedhost
# git clone git@github.com:databio/bedhost-ui
```

```.output
Cloning into 'bedbase'...
remote: Enumerating objects: 664, done.[K
remote: Counting objects: 100% (317/317), done.[K
remote: Compressing objects: 100% (159/159), done.[K
remote: Total 664 (delta 188), reused 250 (delta 148), pack-reused 347[K
Receiving objects: 100% (664/664), 695.03 KiB | 386.00 KiB/s, done.
Resolving deltas: 100% (337/337), done.
Collecting bedboss==0.1.0a2
  Downloading bedboss-0.1.0a2-py3-none-any.whl (24 kB)
Requirement already satisfied: requests>=2.28.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (2.28.2)
Collecting bbconf==0.4.0a1
  Using cached bbconf-0.4.0a1-py3-none-any.whl (11 kB)
Requirement already satisfied: refgenconf>=0.12.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (0.12.2)
Requirement already satisfied: yacman>=0.8.4 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (0.9.1)
Collecting piper>=0.13.2
  Using cached piper-0.13.2-py3-none-any.whl (72 kB)
Requirement already satisfied: peppy>=0.35.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (0.35.7)
Requirement already satisfied: pandas>=1.5.3 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (2.0.0)
Requirement already satisfied: ubiquerg>=0.6.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (0.6.2)
Requirement already satisfied: logmuse>=0.2.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bedboss==0.1.0a2) (0.2.7)
Requirement already satisfied: sqlalchemy<2.0.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bbconf==0.4.0a1->bedboss==0.1.0a2) (1.4.41)
Requirement already satisfied: pipestat>=0.4.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from bbconf==0.4.0a1->bedboss==0.1.0a2) (0.4.1)
Requirement already satisfied: pytz>=2020.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=1.5.3->bedboss==0.1.0a2) (2022.7.1)
Requirement already satisfied: tzdata>=2022.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=1.5.3->bedboss==0.1.0a2) (2023.3)
Requirement already satisfied: numpy>=1.21.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=1.5.3->bedboss==0.1.0a2) (1.22.0)
Requirement already satisfied: python-dateutil>=2.8.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pandas>=1.5.3->bedboss==0.1.0a2) (2.8.2)
Requirement already satisfied: pyyaml in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from peppy>=0.35.7->bedboss==0.1.0a2) (6.0)
Requirement already satisfied: attmap>=0.13.2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from peppy>=0.35.7->bedboss==0.1.0a2) (0.13.2)
Requirement already satisfied: rich>=10.3.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from peppy>=0.35.7->bedboss==0.1.0a2) (13.3.1)
Requirement already satisfied: psutil in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from piper>=0.13.2->bedboss==0.1.0a2) (5.9.4)
Requirement already satisfied: future in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->bedboss==0.1.0a2) (0.18.3)
Requirement already satisfied: pyfaidx in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->bedboss==0.1.0a2) (0.7.1)
Requirement already satisfied: jsonschema>=3.0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->bedboss==0.1.0a2) (4.17.3)
Requirement already satisfied: tqdm in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from refgenconf>=0.12.2->bedboss==0.1.0a2) (4.64.1)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->bedboss==0.1.0a2) (3.0.1)
Requirement already satisfied: idna<4,>=2.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->bedboss==0.1.0a2) (3.4)
Requirement already satisfied: certifi>=2017.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->bedboss==0.1.0a2) (2022.12.7)
Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from requests>=2.28.2->bedboss==0.1.0a2) (1.26.14)
Requirement already satisfied: oyaml in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from yacman>=0.8.4->bedboss==0.1.0a2) (1.0)
Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->refgenconf>=0.12.2->bedboss==0.1.0a2) (0.19.3)
Requirement already satisfied: attrs>=17.4.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from jsonschema>=3.0.1->refgenconf>=0.12.2->bedboss==0.1.0a2) (22.2.0)
Requirement already satisfied: eido in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (0.2.1)
Requirement already satisfied: sqlmodel>=0.0.8 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (0.0.8)
Requirement already satisfied: psycopg2-binary in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (2.9.5)
Requirement already satisfied: pydantic<2.0.0,>=1.10.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (1.10.7)
Requirement already satisfied: six>=1.5 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from python-dateutil>=2.8.2->pandas>=1.5.3->bedboss==0.1.0a2) (1.16.0)
Requirement already satisfied: markdown-it-py<3.0.0,>=2.1.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=10.3.0->peppy>=0.35.7->bedboss==0.1.0a2) (2.1.0)
Requirement already satisfied: pygments<3.0.0,>=2.14.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from rich>=10.3.0->peppy>=0.35.7->bedboss==0.1.0a2) (2.14.0)
Requirement already satisfied: greenlet!=0.4.17 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlalchemy<2.0.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (2.0.2)
Requirement already satisfied: setuptools>=0.7 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pyfaidx->refgenconf>=0.12.2->bedboss==0.1.0a2) (59.6.0)
Requirement already satisfied: mdurl~=0.1 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from markdown-it-py<3.0.0,>=2.1.0->rich>=10.3.0->peppy>=0.35.7->bedboss==0.1.0a2) (0.1.2)
Requirement already satisfied: typing-extensions>=4.2.0 in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from pydantic<2.0.0,>=1.10.7->pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (4.4.0)
Requirement already satisfied: sqlalchemy2-stubs in /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages (from sqlmodel>=0.0.8->pipestat>=0.4.0->bbconf==0.4.0a1->bedboss==0.1.0a2) (0.0.2a35)
Installing collected packages: piper, bbconf, bedboss
  Attempting uninstall: piper
    Found existing installation: piper 0.12.3
    Uninstalling piper-0.12.3:
      Successfully uninstalled piper-0.12.3
  Attempting uninstall: bbconf
    Found existing installation: bbconf 0.4.0
    Uninstalling bbconf-0.4.0:
      Successfully uninstalled bbconf-0.4.0
  Attempting uninstall: bedboss
    Found existing installation: bedboss 0.1.0.dev2
    Uninstalling bedboss-0.1.0.dev2:
      Successfully uninstalled bedboss-0.1.0.dev2
Successfully installed bbconf-0.4.0a1 bedboss-0.1.0a2 piper-0.13.2

```

### Let's install this packages!

    I have problems with bedtoBigBed script, so I am downloading it too, and seting in bedmaker path to this script :/


```bash
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
chmod a+x bedToBigBed
```

```.output
--2023-08-11 07:51:37--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 9632264 (9.2M)
Saving to: ‘bedToBigBed’

bedToBigBed         100%[===================>]   9.19M   740KB/s    in 18s     

2023-08-11 07:51:56 (524 KB/s) - ‘bedToBigBed’ saved [9632264/9632264]


```


```bash
pwd
```

```.output
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial

```

Check if we have all tutorial files:


```bash
ls bedbase/tutorial_files
```

```.output
bedbase_configuration_compose_local.yaml  bedboss  scripts
bedbase_configuration_compose.yaml        PEPs

```

# 2. BEDBOSS: ALL TOGETHER


```bash
pip list | grep bbconf
```

```.output
[Kbbconf[K                   0.4.0a1

```


```bash
pip list | grep bedboss
```

```.output
[Kbedboss[K                  0.1.0a2

```

### Check and update config files


```bash
ls bedbase/tutorial_files/bedboss
```

```.output
bedboss_pep_config.yaml  looper_config_bedboss.yaml  sample_table.csv
config_db_local.yaml     pipeline_interface.yaml

```

Let's create additional metadata for our database:


```bash
cat bedbase/tutorial_files/bedboss/bedboss_pep_config.yaml
```

```.output
pep_version: 2.1.0
sample_table: sample_table.csv

sample_modifiers:
  append:
    input_file_path: INPUT
    output_folder: "$BEDBASE_DATA_PATH_HOST/outputs"
    narrowpeak: TRUE
    rfg_config_path: RFG
    bedbase_config: "$BEDBASE_DATA_PATH_HOST/bedbase/tutorial_files/bedboss/config_db_local.yaml"
    yaml_file: YAMLFILE
  derive:
    attributes: [input_file_path, rfg_config_path, yaml_file]
    sources:
      INPUT: "$BEDBASE_DATA_PATH_HOST/files/{file_name}"
      RFG: "$REFGENIE"
      YAMLFILE: "$BEDBASE_DATA_PATH_HOST/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/{sample_name}_sample.yaml"
  imply:
    - if:
        antibody: [ H3K4me3, H3K27me3, H3K27ac, H3K9ac, H4K5ac, H3K4me, H3K36me3, H4K5ac, H3K9ac ]
      then:
        narrowpeak: FALSE

```

Config for local db and bedstat


```bash
cat bedbase/tutorial_files/bedboss/config_db_local.yaml
```

```.output
path:
  pipeline_output_path: $BEDBASE_DATA_PATH_HOST/outputs
  bedstat_dir: outputs/bedstat_output
  bedbuncher_dir: outputs/bedbuncher_output
  remote_url_base: null
database:
  host: $DB_HOST_URL
  port: $POSTGRES_PORT
  password: $POSTGRES_PASSWORD
  user: $POSTGRES_USER
  name: $POSTGRES_DB
  dialect: postgresql
  driver: psycopg2
server:
  host: 0.0.0.0
  port: 8080

```

looper for bedboss


```bash
cat bedbase/tutorial_files/bedboss//pipeline_interface.yaml
```

```.output
pipeline_name: BEDBOSS
pipeline_type: sample
pre_submit:
  python_functions:
    - looper.write_sample_yaml
command_template: >
  bedboss all
  --sample-name {sample.sample_name}
  --input-file {sample.input_file_path}
  --input-type {sample.format}
  --genome {sample.genome}
  --sample-yaml {sample.yaml_file}
  --output_folder {sample.output_folder}
  --narrowpeak {sample.narrowpeak}
  --rfg-config {sample.rfg_config_path}
  {% if sample.bedbase_config is defined %} --bedbase-config {sample.bedbase_config} {% endif %}
  {% if sample.chrom_sizes is defined %} --chrom-sizes {sample.chrom_sizes} {% endif %}
  {% if sample.open_signal_matrix is defined %} --open-signal-matrix {sample.open_signal_matrix} {% endif %}
  {% if sample.ensdb is defined %} --ensdb {sample.ensdb} {% endif %}
  {% if sample.fasta is defined %} --fasta {sample.fasta} {% endif %}
  --outfolder $BEDBASE_DATA_PATH_HOST/outputs/outputs/bedstat_output/bedstat_pipeline_logs

```

Looper config file:


```bash
ls bedbase/tutorial_files/bedboss
```

```.output
bedboss_pep_config.yaml  looper_config_bedboss.yaml  sample_table.csv
config_db_local.yaml     pipeline_interface.yaml

```


```bash
cat bedbase/tutorial_files/bedboss/looper_config_bedboss.yaml
```

```.output
pep_config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/bedboss_pep_config.yaml
output_dir: $BEDBASE_DATA_PATH_HOST/outputs/outputs/bedstat_output/bedstat_pipeline_logs

pipeline_interfaces:
  sample:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss//pipeline_interface.yaml

```

### Start DB (bedbase-postgres)

### Inititiate a local PostgreSQL instance

In addition to generate statistics and plots, `bedstat` inserts JSON formatted metadata into relational [PostgreSQL] database. 

If you don't have docker installed, you can install it with `sudo apt-get update && apt-get install docker-engine -y`.

Now, create a persistent volume to house PostgreSQL data:


```bash
docker volume create postgres-data
```

```.output
postgres-data

```

Spin up a `postgres` container. Provide required environment variables (need to match the settings in bedbase configuration file) and bind the created docker volume to `/var/lib/postgresql/data` path in the container:


```bash
docker run -d --name bedbase-postgres -p 5432:5432 -e POSTGRES_PASSWORD=bedbasepassword -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -v postgres-data:/var/lib/postgresql/data postgres
```

```.output
42ed2028444042c3ceef801c0828ce016dde87f1c0ac0d9494ffb6274374f262
docker: Error response from daemon: driver failed programming external connectivity on endpoint bedbase-postgres (fe853ffbf2fa584785686c319c5a657021a860dce6c9e81f67f5e805ef2133a0): Bind for 0.0.0.0:5432 failed: port is already allocated.

```



If environment variables are not initialized with function above, We have to initialize them manually 


```bash
export DB_HOST_URL=localhost
export POSTGRES_PORT=5432
export POSTGRES_PASSWORD=docker
export POSTGRES_USER=postgres
export POSTGRES_DB=pep-db
```

### RUN BEDBoss

Additionally, we have to initialize environment variable $REFGENIE - the path to the refgenie configuration file. If Refgenie is not initialize, we will have to initialize it localy. use `pip install --user refgenie` to install and add to the PATH with `export PATH=~/.local/bin:$PATH`


```bash
export REFGENIE='genome_config.yaml'
refgenie init -c $REFGENIE
```

```.output
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/refgenie", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/refgenie/cli.py", line 133, in main
    rgc.initialize_config_file(os.path.abspath(gencfg))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/refgenconf/refgenconf.py", line 290, in initialize_config_file
    _write_fail_err("file exists")
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/refgenconf/refgenconf.py", line 281, in _write_fail_err
    raise OSError("Can't initialize, {}: {} ".format(reason, filepath))
OSError: Can't initialize, file exists: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml 

```




```bash
pwd
```

```.output
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial

```


```bash
ls bedbase/tutorial_files/bedboss
```

```.output
bedboss_pep_config.yaml  looper_config_bedboss.yaml  sample_table.csv
config_db_local.yaml     pipeline_interface.yaml

```

##### Run bedboss


```bash
looper --version
```

```.output
looper 1.5.1


```


```bash
looper run --help
```

```.output
usage: looper run [-h] [-i] [-d] [-t S] [-x S] [-y S] [-f] [--divvy DIVCFG] [-p P] [-s S]
                  [-c K [K ...]] [-u X] [-n N] [--looper-config LOOPER_CONFIG]
                  [-S YAML [YAML ...]] [-P YAML [YAML ...]] [-l N] [-k N]
                  [--sel-attr ATTR] [--sel-excl [E ...] | --sel-incl [I ...]]
                  [-a A [A ...]]
                  [config_file]

Run or submit sample jobs.

positional arguments:
  config_file                        Project configuration file (YAML) or pephub registry
                                     path.

options:
  -h, --help                         show this help message and exit
  -i, --ignore-flags                 Ignore run status flags? Default=False
  -d, --dry-run                      Don't actually submit the jobs. Default=False
  -t S, --time-delay S               Time delay in seconds between job submissions
  -x S, --command-extra S            String to append to every command
  -y S, --command-extra-override S   Same as command-extra, but overrides values in PEP
  -f, --skip-file-checks             Do not perform input file checks
  -u X, --lump X                     Total input file size (GB) to batch into one job
  -n N, --lumpn N                    Number of commands to batch into one job
  --looper-config LOOPER_CONFIG      Looper configuration file (YAML)
  -S YAML [YAML ...], --sample-pipeline-interfaces YAML [YAML ...]
                                     Path to looper sample config file
  -P YAML [YAML ...], --project-pipeline-interfaces YAML [YAML ...]
                                     Path to looper project config file
  -a A [A ...], --amend A [A ...]    List of amendments to activate

divvy arguments:
  Configure divvy to change computing settings

  --divvy DIVCFG                     Path to divvy configuration file. Default=$DIVCFG env
                                     variable. Currently: not set
  -p P, --package P                  Name of computing resource package to use
  -s S, --settings S                 Path to a YAML settings file with compute settings
  -c K [K ...], --compute K [K ...]  List of key-value pairs (k1=v1)

sample selection arguments:
  Specify samples to include or exclude based on sample attribute values

  -l N, --limit N                    Limit to n samples
  -k N, --skip N                     Skip samples by numerical index
  --sel-attr ATTR                    Attribute for sample exclusion OR inclusion
  --sel-excl [E ...]                 Exclude samples with these values
  --sel-incl [I ...]                 Include only samples with these values


```


```bash
pwd
```

```.output
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial

```


```bash
$BEDBASE_DATA_PATH_HOST
```

```.output
bash: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial: Is a directory

```




```bash
looper run --looper-config ./bedbase/tutorial_files/bedboss/looper_config_bedboss.yaml --output-dir $BEDBASE_DATA_PATH_HOST/outputs/outputs/bedstat_output/bedstat_pipeline_logs
```

```.output
Looper version: 1.5.1
Command: run
Using default config. No config found in env var: ['DIVCFG']
Pipestat compatible: False
## [1 of 11] sample: bedbase_demo_db1; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db1.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db1.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:35
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db1 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db1_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:35) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db1/33xf84g5`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db1/33xf84g5` (24312)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24312;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db1/33xf84g5 `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db1/33xf84g5) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:35) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f7ab5237fa0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [2 of 11] sample: bedbase_demo_db2; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db2.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db2.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:35
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db2 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db2_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:36) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db2/lypwq5fe`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db2/lypwq5fe` (24344)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 24344;	Command: zcat;	Return code: 0;	Memory used: 0.0GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db2/lypwq5fe `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db2/lypwq5fe) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:36) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7fb4accabfa0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [3 of 11] sample: bedbase_demo_db3; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db3.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db3.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:36
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db3 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db3_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:37) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db3/_5zvvg7p`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db3/_5zvvg7p` (24374)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 24374;	Command: zcat;	Return code: 0;	Memory used: 0.0GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db3/_5zvvg7p `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db3/_5zvvg7p) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:37) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f40cbcd7fd0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [4 of 11] sample: bedbase_demo_db4; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db4.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db4.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:37
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db4 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db4_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:37) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db4/gig106fd`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db4/gig106fd` (24404)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24404;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db4/gig106fd `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db4/gig106fd) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE105977_ENCFF937CGY_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:38) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7fa90da10280>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [5 of 11] sample: bedbase_demo_db5; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db5.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db5.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:38
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db5 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db5_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:38) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db5/ix1s2r3k`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db5/ix1s2r3k` (24435)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24435;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db5/ix1s2r3k `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db5/ix1s2r3k) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF316ASR_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:39) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f23282d3f70>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [6 of 11] sample: bedbase_demo_db6; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db6.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db6.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:39
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db6 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db6_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:40) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db6/jrhj1l5n`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db6/jrhj1l5n` (24466)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24466;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db6/jrhj1l5n `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db6/jrhj1l5n) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:40) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f697ae982b0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [7 of 11] sample: bedbase_demo_db7; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db7.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db7.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:40
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db7 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db7_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:40) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db7/9r0q9410`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db7/9r0q9410` (24496)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24496;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db7/9r0q9410 `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db7/9r0q9410) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:40) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f244a7082b0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [8 of 11] sample: bedbase_demo_db8; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db8.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db8.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:40
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db8 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db8_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:41) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db8/ny2pxb01`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db8/ny2pxb01` (24527)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24527;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db8/ny2pxb01 `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db8/ny2pxb01) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423312_ENCFF155HVK_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:41) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f7a160abfd0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [9 of 11] sample: bedhost_demo_db9; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedhost_demo_db9.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedhost_demo_db9.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:41
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedhost_demo_db9 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedhost_demo_db9_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:42) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedhost_demo_db9/h6i4w9_0`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedhost_demo_db9/h6i4w9_0` (24559)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24559;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedhost_demo_db9/h6i4w9_0 `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedhost_demo_db9/h6i4w9_0) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2423313_ENCFF722AOG_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:42) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7f0af155bfd0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [10 of 11] sample: bedbase_demo_db10; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db10.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db10.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:42
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db10 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db10_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:43) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db10/l3b3cyqx`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db10/l3b3cyqx` (24590)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24590;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db10/l3b3cyqx `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db10/l3b3cyqx) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827349_ENCFF196DNQ_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:43) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7fa158c6ffd0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.
## [11 of 11] sample: bedbase_demo_db11; pipeline: BEDBOSS
Calling pre-submit function: looper.write_sample_yaml
Writing script to /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db11.sub
Job script (n=1; 0.00Gb): /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/BEDBOSS_bedbase_demo_db11.sub
Compute node: bnt4me-Precision-5560
Start time: 2023-08-14 09:27:43
Using default config. No config found in env var: PIPESTAT_CONFIG
Config: None.
No schema supplied.
Initialize FileBackend
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss all --sample-name bedbase_demo_db11 --input-file /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz --input-type bed --genome hg38 --sample-yaml /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/submission/bedbase_demo_db11_sample.yaml --output_folder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs --narrowpeak True --rfg-config genome_config.yaml --bedbase-config /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml --outfolder /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial
*            Outfolder:  /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/
*  Pipeline started at:   (08-14 09:27:44) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.12
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.13.2
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0a2

### Arguments passed to pipeline:


### Initialized Pipestat Object:

* PipestatManager (bedboss-pipeline)
* Backend: File
*  - results: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/stats.yaml
*  - status: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs
* Multiple Pipelines Allowed: True
* Pipeline name: bedboss-pipeline
* Pipeline type: sample
* Status Schema key: None
* Results formatter: default_formatter
* Results schema source: None
* Status schema source: None
* Records count: 2
* Sample name: DEFAULT_SAMPLE_NAME


----------------------------------------

Unused arguments: {'command': 'all', 'silent': False, 'verbosity': None, 'logdev': False}
Getting Open Signal Matrix file path...
output_bed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz
output_bigbed = /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bigbed_files
Got input type: bed
Converting /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz to BED format.
Target exists: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz`  
Running bedqc...
Unused arguments: {}
Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db11/2pfkxwx0`  

> `zcat /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz > /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db11/2pfkxwx0` (24621)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 24621;	Command: zcat;	Return code: 0;	Memory used: 0.003GB


> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db11/2pfkxwx0 `
File (/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/outputs/outputs/bedstat_output/bedstat_pipeline_logs/bed_files/bedmaker_logs/bedbase_demo_db11/2pfkxwx0) has passed Quality Control!
Generating bigBed files for: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/files/GSM2827350_ENCFF928JXU_peaks_GRCh38.bed.gz
Determining path to chrom.sizes asset via Refgenie.
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/alias/hg38/fasta/default/hg38.chrom.sizes
Config: /home/bnt4me/virginia/repos/bedbase_all/bedbase/docs_jupyter/bedbase_tutorial/bedbase/tutorial_files/bedboss/config_db_local.yaml.
Initialize DBBackend
/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/parsed_schema.py:284: RuntimeWarning: fields may not start with an underscore, ignoring "_pipeline_name"
  return create_model(
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 689, in _engine
Using default schema: /home/bnt4me/virginia/venv/jupyter/bin/pipestat_output_schema.yaml
    return self.db_engine_key
AttributeError: 'DBBackend' object has no attribute 'db_engine_key'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/bin/bedboss", line 8, in <module>
    sys.exit(main())
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 180, in main
    run_all(pm=pm, **args_dict)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedboss.py", line 138, in run_all
    bedstat(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/bedstat.py", line 103, in bedstat
    bbc = bbconf.BedBaseConf(config_path=bedbase_config, database_only=True)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bbconf/bbconf.py", line 72, in __init__
    BED_TABLE: pipestat.PipestatManager(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/pipestat.py", line 161, in __init__
    self.backend = DBBackend(
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 63, in __init__
    SQLModel.metadata.create_all(self._engine)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pipestat/backends/dbbackend.py", line 694, in _engine
    self.db_engine_key = create_engine(self.db_url, echo=self.show_db_logs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlmodel/engine/create.py", line 139, in create_engine
    return _create_engine(url, **current_kwargs)  # type: ignore
  File "<string>", line 2, in create_engine
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/util/deprecations.py", line 309, in warned
    return fn(*args, **kwargs)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/create.py", line 518, in create_engine
    u = _url.make_url(url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 725, in make_url
    return _parse_rfc1738_args(name_or_url)
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/sqlalchemy/engine/url.py", line 781, in _parse_rfc1738_args
    components["port"] = int(components["port"])
ValueError: invalid literal for int() with base 10: '%24POSTGRES_PORT'
Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline failed at:  (08-14 09:27:44) elapsed: 0.0 _TIME_

Total time: 0:00:00
Failure reason: Pipeline failure. See details above.
Exception ignored in atexit callback: <bound method PipelineManager._exit_handler of <pypiper.manager.PipelineManager object at 0x7fe2f62bc2b0>>
Traceback (most recent call last):
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2191, in _exit_handler
    self.fail_pipeline(Exception("Pipeline failure. See details above."))
  File "/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper/manager.py", line 2036, in fail_pipeline
    raise exc
Exception: Pipeline failure. See details above.

Looper finished
Samples valid for job generation: 11 of 11
Commands submitted: 11 of 11
Jobs submitted: 11


```

### ❗❗ If You have errors in bedstat requirements:


```bash
pip install -r bedstat/requirements.txt --user > requirements_log.txt
```



Install R dependencies


```bash
Rscript bedstat/scripts/installRdeps.R > R_deps.txt
```

In case there is an issue installing `GenomicDistributionsData`, try:
```
wget http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.2.tar.gz
Rscript -e 'install.packages("GenomicDistributionsData_0.0.2.tar.gz", type="source", repos=NULL)'
```

There's an additional dependency needed by `bedstat` if we wish to calculate and plot the GC content of our bedfiles. Depending on the genome assemblies of the files listed on a PEP, the appropriate BSgenome packages should be installed. The following is an example of how we can do so:


```bash
cat bedbase/tutorial_files/scripts/BSgenome_install.R
```

```.output
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("BSgenome.Hsapiens.UCSC.hg38.masked")
```


```bash
Rscript bedbase/tutorial_files/scripts/BSgenome_install.R > BSgenome.txt
```

We'll need to create a directory where we can store the stats and plots generated by `bedstat`. Additionally, we'll create a directory where we can store log and metadata files that we'll need later on.

## 4. BEDBUNCHER: Create bedsets and their respective statistics 

### Create a new PEP describing the bedset name and specific JSON query 

Now that we've processed several individual BED files, we'll turn to the next task: grouping them together into collections of BED files, which we call *bedsets*. For this, we use the `bedbuncher` pipeline, which produces outputs for each bedset, such as a bedset PEP, bedset-level statistics and plots, and an `IGD` database. To run `bedbuncher`, we will need another PEP describing each bedset. Though the annotation sheet below specifies attributes for one bedset, you can create as many as you wish using additional rows. For each bedset, you need to provide the query to retrieve certain collection BED files. 

The following example PEP shows the attributes we need to provide for each bedset and the config.yaml file that will grab the files needed to run `bedbuncher`:


```bash
cat bedbase/tutorial_files/PEPs/bedbuncher_query.csv
```

```.output
sample_name,bedset_name,genome,query,operator,query_val,bbconfig_name,bedbase_config
sample1,bedsetOver1kRegions,hg38,'regions_no',gt,"""1000""",bedbase_configuration_compose,source1
sample2,bedsetOver50GCContent,hg38,'gc_content',gt,"""0.5""",bedbase_configuration_compose,source1
sample3,bedsetUnder500MeanWidth,hg38,'mean_region_width',lt,"""500""",bedbase_configuration_compose,source1
sample4,bedsetTestSelectCellType,hg38,"""other::text~~:str_1 or other::text~~:str_2""","""str_1,str_2""","""%GM12878%,%HEK293%""",bedbase_configuration_compose,source1
sample5,bedsetTestSelectGenome,hg38,"""name=:name_1 or name=:name_2""","""name_1,name_2""","""GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38,GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38""",bedbase_configuration_compose,source1
sample6,bedsetTestCellType,hg38,"""other""",contains,"""""{\""cell_type\"":\ \""K562\""}""""",bedbase_configuration_compose,source1
sample7,bedsetTestSpace,hg38,"""other""",contains,"""""{\""description\"":\ \""IKZF1\ ChIP-seq\ on\ human\ GM12878\""}""""",bedbase_configuration_compose,source1
sample8,bedsetTestsSpaceMult,hg38,"""other::text~~:str_1 or other::text~~:str_2""","""str_1,str_2""","""%IKZF1 ChIP-seq on human GM12878%,%ZEB2 ChIP-seq on human K562 (ENCODE)%""",bedbase_configuration_compose,source1
sample9,bedsetTestSpace2,hg38,"""other""",contains,"""""{\""description\"":\ \""HEK293\ cell\ line\ stably\ expressing\ N-terminal\ tagged\ eGFP-GLI2\ under\ the\ control\ of\ a\ CMV\ promoter\""}""""",bedbase_configuration_compose,source1
sample10,bedsetTestsSpaceMult2,hg38,"""other::text~~:str_1 or other::text~~:str_2""","""str_1,str_2""","""%ZEB2 ChIP-seq on human K562 (ENCODE)%,%HEK293 cell line stably expressing N-terminal tagged eGFP-GLI2 under the control of a CMV promoter %""",bedbase_configuration_compose,source1

```


```bash
cat bedbase/tutorial_files/PEPs/bedbuncher_config.yaml
```

```.output
pep_version: 2.0.0
sample_table: bedbuncher_query.csv

looper:
    output_dir: $BEDBASE_DATA_PATH_HOST/outputs/bedbuncher_output/bedbuncher_pipeline_logs

sample_modifiers:
  append:
    pipeline_interfaces: $CODE/bedbuncher/pipeline_interface.yaml 
  derive:
    attributes: [bedbase_config]
    sources:
      source1: $CODE/bedbase/tutorial_files/{bbconfig_name}.yaml

```

Running `bedbuncher` with arguments defined in the example PEP above will result in a bedset with bedfiles that consist of at least 1000 regions.

###  Create outputs directory and install bedbuncher command line dependencies

We need a folder where we can store bedset related outputs. Though not required, we'll also create a directory where we can store the `bedbuncher` pipeline logs. 


```bash
mkdir -p outputs/bedbuncher_output/bedbuncher_pipeline_logs
```

One of the feats of `bedbuncher` includes [IGD](https://github.com/databio/IGD) database creation from the files in the bedset. `IGD` can be installed by cloning the repository from github, executing the make file to create the binary, and pointing the binary location with the `$PATH` environment variable. 


```bash
git clone git@github.com:databio/IGD
cd IGD
make > igd_make_log.txt 2>&1
cd ..

export PATH=$BEDBASE_DATA_PATH_HOST/IGD/bin/:$PATH
```

```.output
Cloning into 'IGD'...
remote: Enumerating objects: 1297, done.[K
remote: Counting objects: 100% (67/67), done.[K
remote: Compressing objects: 100% (50/50), done.[K
remote: Total 1297 (delta 35), reused 40 (delta 17), pack-reused 1230[K
Receiving objects: 100% (1297/1297), 949.45 KiB | 10.79 MiB/s, done.
Resolving deltas: 100% (804/804), done.

```

### Run bedbuncher using Looper 

Once we have cloned the `bedbuncher` repository, set our local Postgres cluster and created the `iGD` binary, we can run the pipeline by pointing `looper run` to the appropriate `PEP` config file. As mentioned earlier, if the path to the bedbase configuration file has been stored in the `$BEDBASE` environment variable, it's not neccesary to pass the `--bedbase-config` argument. 


```bash
looper run  bedbase/tutorial_files/PEPs/bedbuncher_config.yaml  --package local \
--command-extra="-R" > outputs/bedbuncher_output/bedbuncher_pipeline_logs/looper_logs.txt
```

```.output
Looper version: 1.3.1
Command: run
/home/bnt4me/.local/lib/python3.8/site-packages/divvy/compute.py:150: UserWarning: The '_file_path' property is deprecated and will be removed in a future release. Use ComputingConfiguration["__internal"]["_file_path"] instead.
  os.path.dirname(self._file_path),
/home/bnt4me/.local/lib/python3.8/site-packages/divvy/compute.py:58: UserWarning: The '_file_path' property is deprecated and will be removed in a future release. Use ComputingConfiguration["__internal"]["_file_path"] instead.
  self.config_file = self._file_path
Activating compute package 'local'
## [1 of 10] sample: sample1; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample1.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample1.sub
## [2 of 10] sample: sample2; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample2.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample2.sub
## [3 of 10] sample: sample3; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample3.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample3.sub
## [4 of 10] sample: sample4; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample4.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample4.sub
## [5 of 10] sample: sample5; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample5.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample5.sub
## [6 of 10] sample: sample6; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample6.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample6.sub
## [7 of 10] sample: sample7; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample7.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample7.sub
## [8 of 10] sample: sample8; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample8.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample8.sub
## [9 of 10] sample: sample9; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample9.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample9.sub
## [10 of 10] sample: sample10; pipeline: BEDBUNCHER
Writing script to /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample10.sub
Job script (n=1; 0.00Gb): /home/bnt4me/Virginia/bed_maker/bedbase_tutorial/outputs/bedbuncher_output/bedbuncher_pipeline_logs/submission/BEDBUNCHER_sample10.sub

Looper finished
Samples valid for job generation: 10 of 10
Commands submitted: 10 of 10
Jobs submitted: 10

```

## 5. BEDEMBED: 

### bedembed_train: Uses the StarSpace method to embed the bed files and the meta data.

We need to install [StarSpace](https://github.com/facebookresearch/StarSpace) first.  


```bash
mkdir -p bedembed/tools
```

We need to install [Boost](http://www.boost.org/) library and specify the path of boost library in makefile in order to run StarSpace.


```bash
wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.zip
unzip boost_1_78_0.zip
sudo mv boost_1_78_0 /usr/local/bin
cd /usr/local/bin/boost_1_78_0
./bootstrap.sh
./b2
```

In order to build StarSpace on Mac OS or Linux, use the following:


```bash
cd $BEDBASE_DATA_PATH_HOST/bedembed/tools
git clone https://github.com/facebookresearch/Starspace.git
cd Starspace
make
make embed_doc
```

We need a folder where we can store bedembed related outputs. Though not required, we'll also create a directory where we can store the bedembed pipeline logs.


```bash
mkdir -p outputs/bedembed_output/bedembed_pipeline_logs
```


```bash
path_starspace=$BEDBASE_DATA_PATH_HOST'/bedembed/tools/Starspace/starspace'
path_meta=$BEDBASE_DATA_PATH_HOST'/bedbase/tutorial_files/PEPs/bedstat_annotation_sheet.csv'
# download Universe file from rivanna
path_universe=$BEDBASE_DATA_PATH_HOST'/tiles1000.hg19.bed'
path_output=$BEDBASE_DATA_PATH_HOST'/outputs/bedembed_output/'
assembly='hg38'
path_data=$BEDBASE_DATA_PATH_HOST'/bed_files/'
labels="exp_protocol,cell_type,tissue,antibody,treatment"
no_files=10
start_line=0
dim=50
epochs=20
learning_rate=0.001

python ./bedembed/pipeline/bedembed_train.py -star $path_starspace -i $path_data -g $assembly -meta $path_meta -univ $path_universe \
-l $labels -nof $no_files -o $path_output -startline $start_line -dim $dim -epochs $epochs -lr $learning_rate
```

### bedembed_test: calculate the distances between file labels and trained search terms

### Get a PEP describing the bedfiles to process 

We'll use the standard [PEP](http://pep.databio.org) format for the annotation, which consists of 1) a sample table (.csv) that annotates the files, and 2) a project config.yaml file that points to the sample annotation sheet. The config file also has other components, such as derived attributes, that in this case point to the bedfiles to be processed. Here is the PEP config file for this example project:


```bash
cat bedbase/tutorial_files/PEPs/bedembed_test_config.yaml
```

```.output
bedembed_version: 0.0.0
sample_table: bedstat_annotation_sheet.csv

looper:
  output-dir: $BEDBASE_DATA_PATH_HOST/outputs/bedembed_output/bedembed_pipeline_logs 
sample_modifiers:
  append:
    bedbase_config: $BEDBASE_DATA_PATH_HOST/bedbase/tutorial_files/bedbase_configuration_compose.yaml
    pipeline_interfaces: $BEDBASE_DATA_PATH_HOST/bedembed/pipeline_interface_test.yaml
    universe: /project/shefflab/data/StarSpace/universe/universe_tilelen1000.bed
    input_file_path: INPUT
    output_file_path: $BEDBASE_DATA_PATH_HOST/outputs/bedembed_output
    yaml_file: SAMPLE_YAML
  derive:
    attributes: [yaml_file, input_file_path]
    sources:
      INPUT: "/project/shefflab/data/encode/{file_name}"
      SAMPLE_YAML: "$BEDBASE_DATA_PATH_HOST/outputs/bedembed_output/bedembed_pipeline_logs/submission/{sample_name}_sample.yaml"

```

### Run bedembed using Looper 

Once we have cloned the `bedembed` repository, set our local postgres cluster, we can run the pipeline by pointing `looper run` to the appropriate `PEP` config file. As mentioned earlier, if the path to the bedbase configuration file is provided, the calculated distances will report to the postgres database, if not it will save as a csv file in the `output_file_path`


```bash
looper run bedbase/tutorial_files/PEPs/bedembed_test_config.yaml --package local
```

## 5. BEDHOST:  Serve BED files and API to explore pipeline outputs

The last part of the tutorial consists on running a local instance of `bedhost` (a REST API for `bedstat` and `bedbuncher` produced outputs) in order to explore plots, statistics and download pipeline outputs. 
To run `bedhost`, frist use `bedhost-ui` to built the bedhost user interface with React.


```bash
cd bedhost-ui
# Install node modules defined in package.json
npm install 
# Build the app for production to the ./build folder
npm run build
# copy the contents of the ./build directory to bedhost/bedhost/static/bedhost-ui
cp -avr ./build ../bedhost/bedhost/static/bedhost-ui

cd ..
```

To run `bedhost`, we'll pip install the package from the previously cloned repository:


```bash
pip install bedhost/. --user > bedhost_log.txt
```

To start `bedhost`, we simply need to run the following command passing the location of the bedbase configuration file to the `-c` flag.  


```bash
bedhost serve -c  $BEDBASE_DATA_PATH_HOST/bedbase/tutorial_files/bedbase_configuration_compose.yaml
```

```.output
Serving data for columns: ['md5sum']
Serving data for columns: ['md5sum']
Generating GraphQL schema
running bedhost app
INFO:     Started server process [648505]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     127.0.0.1:47532 - "GET / HTTP/1.1" 200 OK
INFO:     127.0.0.1:47532 - "GET /ui/static/css/2.fa6c921b.chunk.css HTTP/1.1" 200 OK
INFO:     127.0.0.1:47534 - "GET /ui/static/css/main.4620a2c9.chunk.css HTTP/1.1" 200 OK
INFO:     127.0.0.1:47536 - "GET /ui/static/js/2.b0639060.chunk.js HTTP/1.1" 200 OK
INFO:     127.0.0.1:47534 - "GET /ui/static/js/main.56118e82.chunk.js HTTP/1.1" 200 OK
INFO:     127.0.0.1:47536 - "GET /api/bed/all/data/count HTTP/1.1" 200 OK
[(None,), ({'alias': 'hg38', 'digest': '2230c535660fb4774114bfa966a62f823fdb6d21acf138d4'},)]
INFO:     127.0.0.1:47532 - "GET /api/bed/genomes HTTP/1.1" 200 OK
INFO:     127.0.0.1:47534 - "GET /api/versions HTTP/1.1" 200 OK
INFO:     127.0.0.1:47538 - "GET /ui/bedbase_logo.svg HTTP/1.1" 200 OK
INFO:     127.0.0.1:47538 - "GET /api/bedset/all/data/count HTTP/1.1" 200 OK
Serving data for columns: ['md5sum']
INFO:     127.0.0.1:47538 - "GET /api/bed/all/data?ids=md5sum&limit=1 HTTP/1.1" 200 OK
Serving data for columns: ['md5sum']
INFO:     127.0.0.1:47538 - "GET /api/bedset/all/data?ids=md5sum&limt=1 HTTP/1.1" 200 OK
INFO:     127.0.0.1:47538 - "GET /openapi.json HTTP/1.1" 200 OK
INFO:     127.0.0.1:47538 - "GET /ui/favicon.ico HTTP/1.1" 200 OK

```

If we have stored the path to the bedbase config in the environment variable `$BEDBASE` (suggested), it's not neccesary to use said flag. 


```bash
bedhost serve 
```

The `bedhost` API can be opened in the url [http://0.0.0.0:8000](http://0.0.0.0:8000). We can now explore the plots and statistics generated by the `bedstat` and `bedbuncher` pipelines.

## or optionally run BEDHOST using containers

Alternatively, you can run the application inside a container.

For that we'll use [docker compose](https://docs.docker.com/compose/), a tool that makes running multi-contaier Docker applications possible. The `docker-compose.yaml` file defines two services: 
- `fastapi-api`: runs the fastAPI server 
- `postgres-db`: runs the PostgeSQL database used by the server



```bash
cd $BEDBASE_DATA_PATH_HOST
```

Use the `BEDBASE_DATA_PATH_HOST` environment variable to point to the host directory with the pipeline results that will be mounted in the container as a volume. 

The environment variables are passed to the container via `.env` file, which the `docker-compose.yaml` points to for each service. Additionally, you can just export the environment variables before issuing the `docker-compose` command.
When you set the same environment variable in multiple files, here’s the priority used by Compose to choose which value to use:

1. Compose file
2. Shell environment variables
3. Environment file
4. Dockerfile
4. Variable is not defined


```bash
cd bedhost; docker-compose up
```

```.output
Pulling postgres-db (postgres:)...
latest: Pulling from library/postgres
Digest: sha256:8f7c3c9b61d82a4a021da5d9618faf056633e089302a726d619fa467c73609e4
Status: Downloaded newer image for postgres:latest
Recreating postgreSQL-bedbase ... 
[1BRecreating fastAPI-bedbase    ... mdone
[1BAttaching to postgreSQL-bedbase, fastAPI-bedbase
postgreSQL-bedbase | 
postgreSQL-bedbase | PostgreSQL Database directory appears to contain a database; Skipping initialization
postgreSQL-bedbase | 
postgreSQL-bedbase | 2020-11-02 23:10:28.883 UTC [1] LOG:  starting PostgreSQL 13.0 (Debian 13.0-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
postgreSQL-bedbase | 2020-11-02 23:10:28.885 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgreSQL-bedbase | 2020-11-02 23:10:28.885 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgreSQL-bedbase | 2020-11-02 23:10:28.891 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgreSQL-bedbase | 2020-11-02 23:10:28.901 UTC [25] LOG:  database system was shut down at 2020-11-02 23:03:14 UTC
postgreSQL-bedbase | 2020-11-02 23:10:28.909 UTC [1] LOG:  database system is ready to accept connections
fastAPI-bedbase | wait-for-it.sh: waiting 60 seconds for postgres-db:5432
fastAPI-bedbase | wait-for-it.sh: postgres-db:5432 is available after 0 seconds
fastAPI-bedbase | DEBU 2020-11-02 23:10:30,246 | bedhost:est:265 > Configured logger 'bedhost' using logmuse v0.2.6 
fastAPI-bedbase | DEBU 23:10:30 | bbconf:est:265 > Configured logger 'bbconf' using logmuse v0.2.6 
fastAPI-bedbase | DEBU 23:10:30 | bbconf:bbconf:105 > Established connection with PostgreSQL: postgres-db 
fastAPI-bedbase | DEBU 2020-11-02 23:10:30,299 | bedhost:main:503 > Determined React UI path: /app/bedhost/static/bedhost-ui 
fastAPI-bedbase | INFO 2020-11-02 23:10:30,299 | bedhost:main:510 > running bedhost app 
fastAPI-bedbase | INFO:     Started server process [1]
fastAPI-bedbase | INFO:     Waiting for application startup.
fastAPI-bedbase | INFO:     Application startup complete.
fastAPI-bedbase | INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
Gracefully stopping... (press Ctrl+C again to force)
Stopping fastAPI-bedbase      ... 
Stopping postgreSQL-bedbase   ... 
[1Bping postgreSQL-bedbase   ... done
```


```bash

```
