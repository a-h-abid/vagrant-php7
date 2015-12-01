#!/usr/bin/env bash

DB=$1;
mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS $DB";
