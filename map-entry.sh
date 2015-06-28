#!/bin/bash

cd /var/www/html
apache2 -Dforeground &

cd /node-monstra
npm start
