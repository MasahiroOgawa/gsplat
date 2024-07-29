FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-devel
COPY . /workspace
WORKDIR /workspace/examples
RUN apt update && apt install -y \
  git libgl1-mesa-glx libglib2.0-0 wget unzip \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install gsplat
RUN pip install -r requirements.txt
RUN [ -d data/360_v2 ] && rm -rf data/360_v2
RUN python datasets/download_dataset.py
CMD ["python","simple_trainer_mcmc.py"]