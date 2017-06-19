#!/bin/bash

# This is a shell script to build a snapshot version of this container for testing
docker build -t pavlovmedia/pavlov-moqui-base-container:snapshot .
