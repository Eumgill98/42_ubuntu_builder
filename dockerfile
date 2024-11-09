# Usign Base image of Ubuntu latest LTS version (22.04)
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install package
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libreadline-dev \
    vim \
    valgrind \
    python3 \
    python3-pip \
    git \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install norminette 
RUN pip3 install --upgrade pip && \
    pip3 install norminette

# setting 42 header plugin 
RUN mkdir -p ~/.vim/plugin && \
    echo 'let g:user42 = "your_login"' >> ~/.vimrc && \
    echo 'let g:mail42 = "your_email@student.42.fr"' >> ~/.vimrc

# install 42 header
RUN cd ~/.vim/plugin && \
    wget https://raw.githubusercontent.com/42Paris/42header/master/plugin/stdheader.vim

# setting workspace
WORKDIR /workspace

# setting volume
VOLUME ["/workspace"]

# using base shell -> bash
SHELL ["/bin/bash", "-c"]

# PATH -> norminette add
ENV PATH="/root/.local/bin:${PATH}"

# 컨테이너 시작 시 bash 쉘 실행
CMD ["/bin/bash"]