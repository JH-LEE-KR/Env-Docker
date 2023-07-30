# Docker Development Environment
This repository contains build scripts for development environment docker image.
<br>
An instance container can be used as a development environment for python, pytorch, tensorflow projects.


## Pre-requisites
Docker tools must be installed using [Docker Desktop](https://www.docker.com/products/docker-desktop/) (recommended) or using [binaries](https://docs.docker.com/engine/install/binaries/).
<br>
(Optional) If you want to use GPU device from docker container, [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) must be installed.

## Available Images
- Ubuntu20.04+python3.8 (ubuntu2004_python38)
- Ubuntu20.04+python3.8+torch1.13 (CPU) (ubuntu2004_torch113)
- Ubuntu20.04+python3.8+tensorflow2.12 (CPU) (ubuntu2004_tf212)
- Ubuntu20.04+python3.8+cuda11.7+cudnn8+torch1.13 (GPU) (ubuntu2004_cuda117_torch113)
- Ubuntu20.04+python3.8+cuda11.7+cudnn8+tensorflow2.12 (GPU) (ubuntu2004_cuda117_tf212)


## Usage
First, clone the repository locally:
```
git clone https://github.com/JH-LEE-KR/Env-Docker
cd Env-Docker
```
Build the image you want to use:
```
docker build -t $tag -f $image .

# Examples:
# docker build -t env/python -f ubuntu2004_python38 .
# docker build -t env/cpu -f ubuntu2004_torch113 .
# docker build -t env/cpu -f ubuntu2004_tf212 .
# docker build -t env/gpu -f ubuntu2004_cuda117_torch113 .
# docker build -t env/gpu -f ubuntu2004_cuda117_tf212 .
```

Run container:
```
docker run --rm -it env/cpu
docker run --rm -it --gpus all env/gpu

# Examples:
# docker run --rm -it --shm-size 20G --mount type=bind,source=/home/code,target=/home/code env/cpu
# docker run --rm -it --shm-size 20G --mount type=bind,source=/home/code,target=/home/code --gpus all env/gpu

# Optional:
# --shm-size $mem
# --mount type=bind,source=$src,target=$tgt
```

The arguments below can be changed:
```
FROM  nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
FROM  ubuntu:20.04
ARG PYTORCH='1.13.0'
ARG TORCH_VISION='0.14.0'
ARG TORCH_AUDIO='0.13.0'
ARG TENSORFLOW='2.12'
```
