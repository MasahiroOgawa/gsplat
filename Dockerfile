FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-devel
COPY . /workspace
WORKDIR /workspace/examples
RUN apt-get update && apt-get install -y \
  git libgl1-mesa-glx libglib2.0-0 wget unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install gsplat
RUN pip install -r requirements.txt
RUN if [ -d data/360_v2 ]; then rm -rf data/360_v2; fi
RUN python datasets/download_dataset.py