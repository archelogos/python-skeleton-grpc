#!/bin/bash
set -e

case "$1" in
    develop)
        echo "Running Development Server"
        python -m grpc.tools.protoc -I./protos --python_out=./microservice/generated_pb2 --grpc_python_out=./microservice/generated_pb2 ./protos/dataset.proto
        exec python main.py
        ;;
    test)
        echo "Test (not yet)"
        ;;
    start)
        echo "Running Start"
        exec python main.py
        ;;
    *)
        exec "$@"
esac
