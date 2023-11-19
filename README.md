# 🧠 A Journey into customised LLM 

Large Language Model (LLM), like ChatGPT, is a type of advanced artificial intelligence program to understand and generate human-like text. LLM, in my opinion, would exceed the limitations of traditional chatbots and overtake recommendation systems to play a pivotal role and significantly enhance human-AI interaction and automating complex tasks.

This project aims explore the development of personalised Large Language Models on [**Medium**](https://medium.com/@benjaminchamwb).

This project provides:
- All-in-one [setup script](setup.sh)
- [Cli Demo App](/demo/demo_llama.py)
- [Web-GUI Demo App](/demo/demo_llama_webui.py)

## Setup Instructions
### Pre-requisite
- A Linux System (Prefably Ubuntu 20.04 and later)
- The System is installed with Anaconda or any conda flavors (i.e. miniconda etc)

### Installation

1.) Clone the git repository
```bash
git clone https://github.com/benjamincham/Journery_Customised_LLM.git
```

2.) Create a conda environment. In my example, i named it 'Journery_Customised_LLM', and to use python version 3.10
```bash
conda create -n Journery_Customised_LLM python=3.10
```

3.) Grant execute permission for the scripts
```bash
chmod +x setup.sh
chmod +x models/download_models.sh
```

4.) Execute the script **setup.sh** to install all the necessary dependencies and download llama2 models.

Point to note, if your system has Nvidia Cuda driver installed.. the script will install  **OpenBLAS / cuBLAS / CLBlast support** for acceleration.
```bash
./setup.sh --download-models # inclue --download-models flag if you wish to download models
```

## How to run the demo

#### Running [Cli Demo App](/demo/demo_llama.py)

To run the demo using terminal, use python to run the demo_llama.py with input arguement '--model' to specify which weights to use. 

In the example below, i am using llama-2 with 7B weights.

```bash
python ./demo/demo_llama.py --model ./models/llama-2-13b.Q2_K.gguf
```

#### Running [Web-GUI Demo App](/demo/demo_llama_webui.py)

To run the demo using web-UI interface, use python to run the demo_llama_webui.py with input arguement '--model' to specify which weights to use. 

In the example below, i am using llama-2 with 7B weights.
Use your internet browser and navigate to default url [http://0.0.0.0:8090/](http://0.0.0.0:8090/) to interact with the LLM.

```bash
python ./demo/demo_llama_webui.py --model ./models/llama-2-7b.Q6_K.gguf
```