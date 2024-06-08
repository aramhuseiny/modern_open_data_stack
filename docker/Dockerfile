FROM apache/airflow:2.7.3
USER root
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C
RUN apt update -y
RUN apt-get install -y git libpq-dev python3 python3-pip 
RUN apt-get autoremove -yqq --purge 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
USER airflow
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade cffi
RUN pip3 install cryptography~=3.4 dbt-core dbt-postgres
