# Copyright ©2021. Element 84, Inc. All Rights Reserved.
FROM jupyter/scipy-notebook:latest

LABEL maintainer="Matthew Hanson <matt.a.hanson@gmail.com>"

USER ${NB_UID}

COPY environment.yaml /opt/conda/environment.yml
RUN mamba env update -p /opt/conda --file /opt/conda/environment.yml \
    && mamba clean --all -f -y

COPY dask.yaml /home/jovyan/.config/dask/dask.yaml

ENV \
  GDAL_DISABLE_READDIR_ON_OPEN=EMPTY_DIR

