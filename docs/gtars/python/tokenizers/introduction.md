# Genomic tokenizers
## Overview
Our genomic tokenizers (AKA _gtokenizers_) are designed to tokenize arbitrary genomic interval data into a defined "universe" or "vocabulary" of known genomic regions. This is particularly useful for machine learning applications where we want to convert genomic intervals into a format that can be easily processed by machine learning models, like transformers.

Our API is designed to closely resemble the [Huggingface tokenizers](https://github.com/huggingface/tokenizers) API, making it easier for users familiar with that ecosystem to adapt to our tools, as well as for us to adapt tools from that ecosystem.

## Installation
To use the tokenizers in Python, you need to have the `gtars` package installed. You can install it using pip:

```bash
pip install gtars
```