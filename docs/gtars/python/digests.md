# Computing gtars digests from Python

## Tutorial

Computing digests for all sequences in a FASTA file:

```python
from gtars.digests import digest_fasta

path_to_fasta_file = "../gtars/gtars/tests/data/base.fa"
df = digest_fasta(path_to_fasta_file)
```

View results:

```python
for chr in df:
    print(chr)
# DigestResult for sequence chrX
#   length: 8
#   sha512t24u: iYtREV555dUFKg2_agSJW6suquUyPpMw
#   md5: 5f63cfaa3ef61f88c9635fb9d18ec945
# DigestResult for sequence chr1
#   length: 4
#   sha512t24u: YBbVX0dLKG1ieEDCiMmkrTZFt_Z5Vdaj
#   md5: 31fc6ca291a32fb9df82b85e5f077e31
# DigestResult for sequence chr2
#   length: 4
#   sha512t24u: AcLxtBuKEPk_7PGE_H4dGElwZHCujwH6
#   md5: 92c6a56c9e9459d8a42b96f7884710bc
```

Acccess a particular digest type:

```python
df[0].sha512t24u
# 'iYtREV555dUFKg2_agSJW6suquUyPpMw'
```

Compute a digest for a given sequence:

```python
from gtars.digests import sha512t24u_digest, md5_digest
sha512t24u_digest("TCGA")
# 'ORLd3OQy8whca09ypkTExMc_ByFalnnO'

md5_digest("TCGA")
# '45d0ff9f1a9504cf2039f89c1ffb4c32'
```