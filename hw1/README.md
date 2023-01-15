# Homework 1 (SQL)

## Downloading the database
```
$ cd cmu-15445/hw1
$ wget https://15445.courses.cs.cmu.edu/fall2022/files/imdb-cmudb2022.db.gz
```

## Running the SQL queries

### SQLite (Ubuntu)
```
$ cd cmu-15445/hw1
$ sqlite3 imdb-cmudb2022.db < placeholder/query.sql
```

## Docker Compose
First of all, set the env variable QUERY_FILE to one of the queries in `hw1/placeholder` and run the sqlite3
```
$ cd cmu-15445/hw1
$ docker compose up --build
```