**Example: Full `GlobalRefgetStore` Usage**

```python
import os
import tempfile
from gtars.refget import GlobalRefgetStore, StorageMode, digest_fasta, RetrievedSequence

def run_store_example():
    with tempfile.TemporaryDirectory() as temp_dir:
        # 1. Prepare a dummy FASTA file
        fasta_content = (
            ">chr1\n"
            "ATGCATGCATGCAGTCGTAGC\n"
            ">chr2\n"
            "GGGGAAAA\n"
        )
        source_fasta_path = os.path.join(temp_dir, "source.fa")
        with open(source_fasta_path, "w") as f:
            f.write(fasta_content)

        # 2. Digest the FASTA to get collection info and digest
        collection = digest_fasta(source_fasta_path)
        collection_digest = collection.digest
        print(f"Source FASTA digested. Collection digest: {collection_digest}\n")

        # 3. Initialize GlobalRefgetStore in Encoded mode
        store = GlobalRefgetStore(StorageMode.Encoded)
        print(f"Initialized store: {store}\n")

        # 4. Import FASTA into the store
        store.import_fasta(source_fasta_path)
        print("FASTA imported into the store.\n")

        # 5. Get a sequence by its ID (using the digest from the first sequence in collection)
        seq_digest_chr1 = collection[0].metadata.sha512t24u
        record_chr1 = store.get_sequence_by_id(seq_digest_chr1)
        if record_chr1:
            print(f"Retrieved sequence by ID: {record_chr1.metadata.name}, length {record_chr1.metadata.length}")
            # Note: record_chr1.data might be None if store mode is Encoded and data isn't decoded automatically
            print(f"  Sequence (full): {store.get_substring(seq_digest_chr1, 0, record_chr1.metadata.length)}\n")

        # 6. Get a substring
        sub_seq = store.get_substring(seq_digest_chr1, 5, 15)
        print(f"Substring from chr1[5:15]: {sub_seq}\n") # Expected: TGCAGTCGTA

        # 7. Prepare a BED file for region retrieval
        bed_content = (
            "chr1\t0\t10\n"
            "chr2\t2\t6\n"
            "chr_nonexistent\t0\t5\n" # This entry will be skipped
        )
        bed_path = os.path.join(temp_dir, "regions.bed")
        with open(bed_path, "w") as f:
            f.write(bed_content)

        # 8. Retrieve sequences from BED file to a list
        retrieved_list = store.get_seqs_bed_file_to_vec(collection_digest, bed_path)
        print("Retrieved sequences from BED file (as list):")
        for rs in retrieved_list:
            print(f"  - {rs}")
        print("\n")

        # 9. Retrieve sequences from BED file and write to new FASTA
        output_fasta_path = os.path.join(temp_dir, "output_regions.fa")
        store.get_seqs_bed_file(collection_digest, bed_path, output_fasta_path)
        print(f"Retrieved sequences from BED file written to: {output_fasta_path}")
        with open(output_fasta_path, "r") as f:
            print("Content of output FASTA:\n" + f.read())
        print("\n")

        # 10. Write store to a new directory
        saved_store_path = os.path.join(temp_dir, "my_refget_store")
        store.write_store_to_directory(saved_store_path, "{digest_prefix}/{digest}.gz") # Custom template
        print(f"Store saved to: {saved_store_path}\n")

        # 11. Load store from the directory
        loaded_store = GlobalRefgetStore.load_from_directory(saved_store_path)
        print(f"Store successfully loaded from: {saved_store_path}")

if __name__ == "__main__":
    run_store_example()
```