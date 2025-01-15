#!/bin/bash

# Check if a path argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <project-path>"
    exit 1
fi

# Get the absolute path of the project directory
PROJECT_PATH=$(realpath "$1")

# Create the project directory if it doesn't exist
if [ ! -d "$PROJECT_PATH" ]; then
    mkdir -p "$PROJECT_PATH"
    echo "Created project directory: $PROJECT_PATH"
else
    echo "Using existing project directory: $PROJECT_PATH"
fi

# Create src and test directories
SRC_DIR="$PROJECT_PATH/src"
TEST_DIR="$PROJECT_PATH/test"

mkdir -p "$SRC_DIR"
echo "Created source directory: $SRC_DIR"

mkdir -p "$TEST_DIR"
echo "Created test directory: $TEST_DIR"

# Copy files/main.cpp to src/main.cpp
MAIN_CPP_SOURCE="files/main.cpp"
MAIN_CPP="$SRC_DIR/main.cpp"
if [ -f "$MAIN_CPP_SOURCE" ]; then
    cp "$MAIN_CPP_SOURCE" "$MAIN_CPP"
    echo "Copied main.cpp to: $SRC_DIR"
fi

# Copy conanfile.txt to the project directory
CONANFILE="files/conanfile.txt"
if [ -f "$CONANFILE" ]; then
    cp "$CONANFILE" "$PROJECT_PATH/"
    echo "Copied conanfile.txt to: $PROJECT_PATH"
fi

# Copy CMakeLists.txt to the project directory
CMAKEFILE="files/CMakeLists.txt"
if [ -f "$CMAKEFILE" ]; then
    cp "$CMAKEFILE" "$PROJECT_PATH/"
    echo "Copied CMakeLists.txt to: $PROJECT_PATH"
fi