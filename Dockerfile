# we will build our image upon debian
# we will use version 8.5 explicitly so our dockefile doesn't get screw up after next release of debian
FROM debian:8.5

# set TERM environment variable so we don't get annoyed later
ENV TERM xterm

# update package manager repositories
RUN apt-get update

# install dependencies, git and mc
RUN apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mc

# clear caches
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# install conda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

# set PATH variable so ve can use it
ENV PATH /opt/conda/bin:$PATH

# install jupyter in conda default environment
RUN conda install jupyter

# create working directory for our notebooks inside the image, so we can map it to our workdir on our host machine
RUN mkdir /hello
