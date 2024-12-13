#!/bin/bash

# This script demonstrates how to prevent a race condition using file locking.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to acquire a lock on each file before writing
flock -e file1.txt && echo "Process 1" > file1.txt && flock -u file1.txt
flock -e file2.txt && echo "Process 2" > file2.txt && flock -u file2.txt

# Check the content of file1.txt
cat file1.txt

# Check the content of file2.txt
cat file2.txt
