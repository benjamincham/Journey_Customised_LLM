#!/bin/bash

# Function to display the help message
show_help() {
    echo "Usage: $0 [--download-models] [--help]"
    echo
    echo "Options:"
    echo "  --download-models    Download models after installing requirements."
    echo "  --help               Display this help message and exit."
    echo
    echo "The script installs necessary Python packages and can optionally download models."
    echo "It checks for the presence of an NVIDIA GPU for CUDA support during installation."
}

# Default flag for model downloading set to false
download_models=false

# Check for command-line arguments
for arg in "$@"
do
    case $arg in
        --download-models)
            download_models=true
            shift # Remove argument from processing
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $arg"
            show_help
            exit 1
            ;;
    esac
done

# Check if an NVIDIA GPU is present using nvidia-smi
if nvidia-smi &> /dev/null; then
    echo "NVIDIA GPU detected. Installing with CUDA support."
    CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install -r requirements.txt
else
    echo "No NVIDIA GPU detected. Installing without CUDA support."
    pip install -r requirements.txt
fi

# Check if model downloading is enabled
if [ "$download_models" = true ]; then
    echo "Downloading models..."
    ./models/download_models.sh
else
    echo "Skipping model download."
fi
