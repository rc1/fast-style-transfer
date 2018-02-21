FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get install -y \
    git \
	  python-pil \
    python-scipy \
    python-numpy \
    ffmpeg \
    wget

# Download neural-style
RUN git clone https://github.com/rc1/fast-style-transfer.git

# Setup project
RUN cd fast-neural-style; bash setup.sh

# create volume for the images
RUN mkdir /images
VOLUME /images

# Prepare execution environment
WORKDIR /notebooks/fast-neural-style/

CMD python style.py


# nvidia-docker build -t rc1/fast-neural-style-tf-gpu .
# nvidia-docker run --runtime= --rm -v $(pwd):/images ahbrosha/fast-neural-style-tf python style.py --style /images/van_gogh_cafe_600.jpg --checkpoint-dir /images --checkpoint-iterations 100
# nvidia-docker run --runtime=nvidia --rm -v $(pwd):/images ahbrosha/fast-neural-style-tf python evaluate.py --checkpoint /images/test/hodor.ckpt --in-path /images/test/brad_pitt.jpg --out-path /images/test/
