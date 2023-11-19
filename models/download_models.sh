#!/bin/bash

# Get the directory where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Define the path to the model URLs file relative to the script's location
model_urls_file="$script_dir/model_urls.txt"

# Check if the file exists
if [ ! -f "$model_urls_file" ]; then
    echo "File $model_urls_file does not exist."
    exit 1
fi

# Function to download a model
download_model() {
    model_name=$1
    url=$2
    model_path="$script_dir/$model_name"

    # Check if the model already exists
    if [ -f "$model_path" ]; then
        echo "Model $model_name already exists, skipping download."
        return
    fi

    echo "Downloading $model_name from $url..."
    wget -O "$model_path" "$url" &
}

# Read the file and start downloads in parallel
while IFS=':' read -r model_name url; do
    # Pass the URL enclosed in quotes to handle special characters
    download_model "$model_name" "$url"
done < "$model_urls_file"

# Wait for all parallel downloads to complete
wait
echo "All downloads completed."
