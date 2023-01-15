FROM ubuntu:20.04

WORKDIR /root

RUN apt-get update
RUN apt-get install -y sqlite3

CMD sqlite3 imdb-cmudb2022.db < placeholder/${QUERY_FILE}.sql
