#!/bin/bash
echo "Hello, World" > index.html
nohup python -m SimpleHTTPServer 8080 &
