FROM gnuoctave/octave:jupyterlab

USER root
RUN pip install jupyter_http_over_ws
RUN jupyter serverextension enable --py jupyter_http_over_ws
RUN apt-get update
RUN apt-get install build-essential -y
RUN pip install octave_kernel


ENTRYPOINT jupyter notebook \
  --NotebookApp.allow_origin='https://colab.research.google.com' \
  --port=8888 \
  --NotebookApp.ip='0.0.0.0' \
  --NotebookApp.port_retries=0 \
  --allow-root
