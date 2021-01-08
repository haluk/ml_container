FROM python:3.8
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt requirements.txt

RUN apt-get update \
    && apt-get clean \
    && apt-get update -qqq \
    && apt-get install -y -q build-essential graphviz graphviz-dev \
    && apt-get install -y -q ffmpeg libsm6 libxext6 \
    && pip install --upgrade pip \
    && pip install Cython scipy \
    && pip install -r requirements.txt

RUN pip install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 \
    -f https://download.pytorch.org/whl/torch_stable.html \
    && pip install fastai

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs

RUN jupyter server extension enable jupyterlab_code_formatter

RUN ipython profile create
COPY ./start.ipy /root/.ipython/profile_default/startup/

VOLUME /notebooks
WORKDIR /notebooks

# Run shell command for notebook on start
CMD jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --allow-root
