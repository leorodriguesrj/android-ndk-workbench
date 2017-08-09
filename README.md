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

## Run workbench with specific volumes

``bash
docker run -i -t \
    -v $(pwd)/working-directory:/workbench \
    -v $(pwd)/ndk:/ndk \
    android-ndk-workbench
``