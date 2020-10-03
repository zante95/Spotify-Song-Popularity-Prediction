#
# Dockerfiles that creates our Docker image for development.
#

FROM jupyter/scipy-notebook
RUN pip install -U kaggle

