FROM apache/airflow:2.1.2
USER root
RUN apt-get update \
  && apt-get install -y git libpq-dev python3 python3-pip \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
USER airflow
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade cffi
RUN pip3 install cryptography~=3.4 dbt==0.19.0
