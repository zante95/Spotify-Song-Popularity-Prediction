#
# Dockerfiles that creates our Docker image for development.
#

FROM jupyter/scipy-notebook
USER root
ENV PYTHONPATH "/home/jovyan/workspace:$JUPYTER_PATH"
RUN apt-get update && apt-get install -y graphviz
RUN pip install -U kaggle pytest fuzzywuzzy[speedup] imbalanced-learn pydot graphviz
USER jovyan