# Geospatial Python Notebooks

[![Open In SageMaker Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/https://github.com/rsignell-usgs/geo-notebooks/blob/main/notebooks/odc-landsat.ipynb)
This repository contains example Jupyter notebooks for working with STAC, OpenDataCube, and Dask. 

The [ODC Planetary Computer](notebooks/odc-planetary-computer.ipynb) and the 
[ODC Landsat on AWS](notebooks/odc-landsat.ipynb) notebooks were presented at FOSS4G-2021, see the 
[accompanying slides](https://docs.google.com/presentation/d/1JUZG_tOscAwXUzdzOAR0wL71a0UdQDWnuz9O5HZjOjQ/edit?usp=sharing).

The [aois](aois/) directory contains several example GeoJSON features that can be used
as AOIs for querying STAC APIs.

The [Dockerfile](./Dockerfile) and [docker-compose](./docker-compose.yml) files can be used to run
a Jupyter Notebook container complete with all needed libraries.

For Dask there are a few options:

- Use [Dask Gateway](https://gateway.dask.org/) to launch a Dask cluster in your preferred cloud provider.
The Planetary Computer notebook uses Dask Gateway to launch a cluster within the Planetary Computer environment.
- Use a local Dask cluster - no external setup is required, but is useful for development and trying out Dask.
The data will be downloaded to the local Dask cluster.
- Use [coiled.io](https://coiled.io/) to easily manage Dask clusters with any cloud provider and region. Great way
to get started when running local notebooks and for tracking costs.

## Docker Usage

First, create a .env file in the root directory of this repository and provide the following environment variables:

- AWS_ACCESS_KEY_ID="your id"
- AWS_SECRET_ACCESS_KEY="your secret key"
- AWS_REQUEST_PAYER=requester

If you are using temporary credentials, you also need to set:

- AWS_SESSION_TOKEN="your session token"

**Note**: Only some notebooks, e.g. [notebooks/odc-landsat.ipynb](notebooks/odc-landsat.ipynb), require AWS credentials.
If you are only running notebooks that do NOT require AWS credentials (e.g. [notebooks/odc-planetary-computer.ipynb](notebooks/odc-planetary-computer.ipynb)), you can simply create an empty `.env` file.

Then build the Docker container:

```
$ docker-compose build
```

Then run using Docker compose:

```
$ docker-compose up
```

After starting up the container it will print a local URL that can be copy and pasted into a browser.

## About

The notebooks in this repository were created by [Element 84](http://element84.com/).
