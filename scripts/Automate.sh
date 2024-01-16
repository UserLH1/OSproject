#!/bin/bash

project_root="$(dirname "$(realpath "$0")")/.."

compile_script="$project_root/scripts/Compile.sh"
run_script="$project_root/scripts/Run.sh"
test_script="$project_root/scripts/Test.sh" 

# Define colors for terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo_color() {
    echo -e "${1}${2}${NC}"
}

echo_color_format() {
    echo -e "${1}#### ${2} ####${NC}"
}

# Header
echo_color_format $GREEN "C Testing Framework Automation Process"
echo "---------------------------------------------------"

# Step 1: Compilation
echo_color_format $GREEN "Step 1: Starting the compilation process"
if ! bash "$compile_script"; then
    echo_color $RED "Error in the compilation process. Check the compilation script."
    exit 1
fi
echo "---------------------------------------------------"

# Step 2: Execution
echo_color_format $GREEN "Step 2: Running the compiled programs"
if ! bash "$run_script"; then
    echo_color $RED "Error in the execution process. Check the execution script."
    exit 1
fi
echo "---------------------------------------------------"

# Step 3: Testing
echo_color_format $GREEN "Step 3: Checking the correctness of the executions"
if ! bash "$test_script"; then
    echo_color $RED "Error in the testing process. Check the testing script."
    exit 1
fi
echo "---------------------------------------------------"

# Footer
echo_color_format $GREEN "The process has been successfully completed."
echo "---------------------------------------------------"
