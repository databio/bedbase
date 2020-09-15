#!/usr/bin/env python3

from bbconf import BedBaseConf
from bbconf.const import *

parser = ArgumentParser(description="Count records in a PostgreSQL table and verify")

parser.add_argument("-t", "--table", help="Table to count records in", 
	required=True, type=str)
parser.add_argument("-e", "--expected-count", help="Expected number of records", 
	type=int, required=False, default=None)

args = parser.parse_args()

bbc = BedBaseConf('$GITHUB_WORKSPACE/ci/cfg/config_min.yaml')
row_count = bbc._count_rows(table_name=args.table)
if args.expected_count:
	assert row_count == args.expected_count, 
	f"Number of records in the '{args.table}' table ({row_count}) not equal {args.expected_count}"
sys.exit(0)
