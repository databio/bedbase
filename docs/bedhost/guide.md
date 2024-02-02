# Developer Guide

## Introduction

### Data types

BEDbase stores two types of data, which we call *records*. They are 1. BEDs, and 2. BEDsets. BEDsets are simply collections of BEDs. Each record in the database is either a BED or a BEDset.

### Endpoint organization

The endpoints are divided into 3 groups:

1. `/bed` endpoints are used to interact with metadata for BED records.
2. `/bedset` endpoints are used to interact with metadata for BEDset records.
3. `/objects` endpoints are used to download metadata and get URLs to retrieve the underlying data itself. These endpoints implement the [GA4GH DRS standard](https://ga4gh.github.io/data-repository-service-schemas/).

Therefore, to get information and statistics about BED or BEDset records, or what is contained in the database, look through the `/bed` and `/bedset` endpoints. But if you need to write a tool that gets the actual underlying files, then you'll need to use the `/objects` endpoints. The type of identifiers used in each case differ.

## Record identifiers vs. object identifiers

Each record has an identifier. For example, `eaf9ee97241f300f1c7e76e1f945141f` is a BED identifier. You can use this identifier for the metadata endpoints. To download files, you'll need something slightly different -- you need an *object identifier*. This is because each BED record includes multiple files, such as the original BED file, the BigBed file, analysis plots, and so on. To download a file, you will construct what we call the `object_id`, which identifies the specific file.

## How to construct object identifiers

Object IDs take the form `<record_type>.<record_identifier>.<result_id>`. An example of an object_id for a BED file is `bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile`

So, you can get information about this object like this:

`GET` [/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile](/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile)

Or, you can get a URL to download the actual file with:

`GET` [/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile/access/http](/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile/access/http)


