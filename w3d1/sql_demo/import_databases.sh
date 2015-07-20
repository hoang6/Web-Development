#!/usr/bin/env sh

dropdb bank
dropdb tasks
dropdb sports

createdb bank
createdb tasks
createdb sports

psql bank < data/bank.sql
psql tasks < data/tasks.sql
psql sports < data/sports.sql
