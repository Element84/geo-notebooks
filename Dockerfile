# Copyright ©2021. Element 84, Inc. All Rights Reserved.
FROM jupyter/scipy-notebook:latest

LABEL maintainer="Matthew Hanson <matt.a.hanson@gmail.com>"

USER root

RUN mamba install --yes \
  cartopy==0.20.0 \
  datacube==1.8.5 \
  geopandas==0.9.0 \
  pystac==1.1.0 \
  pystac-client==0.3.0 \
  coiled \
  stackstac \
  rasterio \
  rioxarray \
  hvplot; \
  mamba clean --all -f -y;

# enable importing jupyter notebooks as modules
RUN pip install geoviews odc-stac odc-algo planetary_computer geogif

ENV \
  GDAL_DISABLE_READDIR_ON_OPEN=YES

USER ${NB_UID}
