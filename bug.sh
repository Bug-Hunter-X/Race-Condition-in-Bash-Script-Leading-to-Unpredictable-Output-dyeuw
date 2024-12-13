#!/bin/bash

# This script demonstrates a race condition that can lead to unexpected behavior.

# Create two files
touch file1.txt
touch file2.txt

# Start two background processes that write to the files concurrently
echo "Process 1" > file1.txt &
echo "Process 2" > file2.txt &

# Wait for both processes to finish. This is where the race condition occurs
wait

# Check the content of file1.txt which might be unexpected depending on the order of the process execution
cat file1.txt

# Check the content of file2.txt which might be unexpected depending on the order of the process execution
cat file2.txt
