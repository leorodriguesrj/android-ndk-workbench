# android-ndk-workbench

Dockerized workbench for Android NDK

## Build container

``bash
docker build -t android-ndk-workbench \
    --build-arg HTTP_PROXY=$PRX \
    --build-arg HTTPS_PROXY=$PRX \
    .
``

## Run workbench

``bash
docker run -i -t android-ndk-workbench
``