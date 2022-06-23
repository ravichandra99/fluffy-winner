# syntax=docker/dockerfile:1
FROM python:3.8-slim
ADD /python /code
WORKDIR /code
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
COPY python/requirements.txt /code/requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["gunicorn", "--config", "gunicorn_config.py", "wsgi:app"]
