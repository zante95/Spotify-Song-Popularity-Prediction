#
# Dockerfiles that creates our Docker image for development.
#

FROM jupyter/scipy-notebook
ENV PYTHONPATH "/home/jovyan/workspace:$JUPYTER_PATH"
RUN pip install -U kaggle pytest

