# C Testing Framework

## Overview

This C Testing Framework is designed to compile and run C source code from a given folder structure, check the execution correctness, and compare output against predefined test cases. It simplifies the process of unit testing for C projects and ensures that changes to the code do not break functionality.

## Features

- Automatic identification of `.c` source files for compilation.
- Compilation of C code with support for custom flags.
- Execution of compiled binaries with output capture.
- Comparison of program output against expected results.
- Generation of detailed test reports.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before running the scripts, ensure you have `gcc` installed on your system as it is required for compiling the C code.

### Running the Application

To compile and run your application, first clone it with ```bash git clone https://github.com/UserLH1/OSproject.git```, then follow these steps:

1. **Navigate to Scripts Directory**:
   Change your current working directory to the `scripts` directory within the project.

    ```bash
    cd scripts
    ```

2. **Compile the Source Code**:
   Run the `Compile.sh` script to compile all `.c` source files into executables. Ensure that the script is executable by running `chmod +x Compile.sh` if necessary.

    ```bash
    ./Compile.sh
    ```

    This will compile the source files found in the `src` directory and place the resulting executables in the `bin` directory.

3. **Execute the Compiled Binaries**:
   After compiling the source files, execute the `Run.sh` script to run all the compiled binaries. Make sure that `Run.sh` is also executable.

    ```bash
    ./Run.sh
    ```

    The `Run.sh` script will execute each binary and save their output in the `output` folder.

4. **Check the Output**:
   The output from each executable will be saved in separate files within the `output` folder. To view these outputs, navigate to the `output` directory.

    ```bash
    cd ../output
    ```

    Use `cat` or any text editor to view the contents of the output files:

    ```bash
    cat <output_file_name>
    ```

    Replace `<output_file_name>` with the actual name of the file you wish to view.

## Built With

* [GCC](https://gcc.gnu.org/) - The GNU Compiler Collection.

## Authors

* **Lazea Horatiu**  - UserLH1(https://github.com/UserLH1)
* **Lepadatu Emanuel**  - UserLEmanuel(https://github.com/UserLH1)

