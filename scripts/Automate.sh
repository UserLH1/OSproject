#!/bin/bash

# Set the project root directory
project_root="$(dirname "$(realpath "$0")")/.."

# Define the directories for scripts
compile_script="$project_root/scripts/Compile.sh"
run_script="$project_root/scripts/Run.sh"
test_script="$project_root/scripts/Test.sh" # Assuming there's a separate script for testing

# Step 1: Compilation
echo "Starting the compilation process..."
if ! bash "$compile_script"; then
    echo "Error in the compilation process. Check the compilation script."
    exit 1
fi

# Step 2: Execution
echo "Running the compiled programs..."
if ! bash "$run_script"; then
    echo "Error in the execution process. Check the execution script."
    exit 1
fi

# Step 3: Testing
echo "Checking the correctness of the executions..."
if ! bash "$test_script"; then
    echo "Error in the testing process. Check the testing script."
    exit 1
fi

echo "The automation of the testing process has been successfully completed."
