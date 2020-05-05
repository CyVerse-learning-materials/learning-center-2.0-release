# Read the Docs - Environment base from https://hub.docker.com/r/readthedocs/build/dockerfile
# See also https://github.com/readthedocs/readthedocs-docker-images

FROM ubuntu:18.04
LABEL mantainer="Tutorials@CyVerse.org"
LABEL version="2.0.0"

ENV DEBIAN_FRONTEND noninteractive
ENV APPDIR /app
ENV LANG C.UTF-8

# Versions, and expose labels for external usage
ENV RTD_PYTHON_VERSION_38 3.8.0
ENV RTD_PYPY_VERSION_35 pypy3.5-7.0.0

# Note: 4.7.12.1 drastically increases memory usage
ENV RTD_CONDA_VERSION 4.6.14

ENV RTD_PIP_VERSION 20.0.1
ENV RTD_SETUPTOOLS_VERSION 45.1.0
ENV RTD_VIRTUALENV_VERSION 16.7.9
LABEL python.version_38=$RTD_PYTHON_VERSION_38
LABEL pypy.version_35=$RTD_PYPY_VERSION_35
LABEL conda.version=$RTD_CONDA_VERSION

# System dependencies
RUN apt-get -y update
RUN apt-get -y install \
      software-properties-common \
      vim

# Install requirements
RUN apt-get -y install \
      build-essential \
      bzr \
      curl \
      doxygen \
      g++ \
      git-core \
      graphviz-dev \
      libbz2-dev \
      libcairo2-dev \
      libenchant1c2a \
      libevent-dev \
      libffi-dev \
      libfreetype6 \
      libfreetype6-dev \
      libgraphviz-dev \
      libjpeg8-dev \
      libjpeg-dev \
      liblcms2-dev \
      libmysqlclient-dev \
      libpq-dev \
      libreadline-dev \
      libsqlite3-dev \
      libtiff5-dev \
      libwebp-dev \
      libxml2-dev \
      libxslt1-dev \
      libxslt-dev \
      mercurial \
      pandoc \
      pkg-config \
      postgresql-client \
      subversion \
      zlib1g-dev

# pyenv extra requirements
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
RUN apt-get install -y \
      liblzma-dev \
      libncurses5-dev \
      libncursesw5-dev \
      libssl-dev \
      llvm \
      make \
      python-openssl \
      tk-dev \
      wget \
      xz-utils

# LaTeX -- split to reduce image layer size
RUN apt-get -y install \
      texlive-fonts-extra
RUN apt-get -y install \
      texlive-latex-extra-doc \
      texlive-pictures-doc \
      texlive-publishers-doc
RUN apt-get -y install \
      texlive-lang-english \
      texlive-lang-japanese
RUN apt-get -y install \
      texlive-full

# lmodern: extra fonts
# https://github.com/rtfd/readthedocs.org/issues/5494
#
# xindy: is useful to generate non-ascii indexes
# https://github.com/rtfd/readthedocs.org/issues/4454
RUN apt-get -y install \
      fonts-symbola \
      lmodern \
      latex-cjk-chinese-arphic-bkai00mp \
      latex-cjk-chinese-arphic-gbsn00lp \
      latex-cjk-chinese-arphic-gkai00mp \
      texlive-fonts-recommended \
      xindy

# plantuml: is to support sphinxcontrib-plantuml
# https://pypi.org/project/sphinxcontrib-plantuml/
#
# imagemagick: is to support sphinx.ext.imgconverter
# http://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html
#
# rsvg-convert: is for SVG -> PDF conversion
# using Sphinx extension sphinxcontrib.rsvgconverter, see
# https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter
#
# swig: is required for different purposes
# https://github.com/rtfd/readthedocs-docker-images/issues/15
RUN apt-get -y install \
      imagemagick \
      librsvg2-bin \
      plantuml \
      swig

# Install Python tools/libs
RUN apt-get -y install \
      python-pip \
 && pip install -U \
      auxlib \
      virtualenv==$RTD_VIRTUALENV_VERSION

# sphinx-js dependencies: jsdoc and typedoc (TypeScript support)
RUN apt-get -y install \
      nodejs \
      npm \
 && npm install --global \
      jsdoc \
      typedoc

# UID and GID from readthedocs/user
RUN groupadd --gid 205 docs
RUN useradd -m --uid 1005 --gid 205 docs

USER docs
WORKDIR /home/docs

# Install Conda
RUN curl -O https://repo.continuum.io/miniconda/Miniconda2-${RTD_CONDA_VERSION}-Linux-x86_64.sh
RUN bash Miniconda2-${RTD_CONDA_VERSION}-Linux-x86_64.sh -b -p /home/docs/.conda/
ENV PATH $PATH:/home/docs/.conda/bin
RUN rm -f Miniconda2-${RTD_CONDA_VERSION}-Linux-x86_64.sh

# Install pyenv
RUN wget https://github.com/pyenv/pyenv/archive/master.zip
RUN unzip master.zip && \
    rm -f master.zip && \
    mv pyenv-master ~docs/.pyenv
ENV PYENV_ROOT /home/docs/.pyenv
ENV PATH /home/docs/.pyenv/shims:$PATH:/home/docs/.pyenv/bin

# Install supported Python versions
RUN pyenv install $RTD_PYTHON_VERSION_38 && \
    pyenv global \
        $RTD_PYTHON_VERSION_38

WORKDIR /tmp

RUN pyenv local $RTD_PYTHON_VERSION_38 && \
    pyenv exec pip install --no-cache-dir -U pip==$RTD_PIP_VERSION && \
    pyenv exec pip install --no-cache-dir -U setuptools==$RTD_SETUPTOOLS_VERSION && \
    pyenv exec pip install --no-cache-dir --only-binary numpy numpy && \
    pyenv exec pip install --no-cache-dir pandas matplotlib virtualenv==$RTD_VIRTUALENV_VERSION && \
    pyenv exec pip install --no-cache-dir sphinx && \
    pyenv exec pip install --no-cache-dir sphinx-autobuild && \
    pyenv exec pip install --no-cache-dir sphinx_rtd_theme && \
    pyenv exec pip install --no-cache-dir sphinx-fontawesome && \
    pyenv exec pip install --no-cache-dir restview && \
    pyenv exec pip install --no-cache-dir recommonmark && \
    pyenv exec pip install --no-cache-dir Jinja2 && \
    pyenv exec pip install --no-cache-dir docutils

WORKDIR /

CMD ["/bin/bash"]
