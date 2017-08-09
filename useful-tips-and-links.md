
# USEFUL LINKS

https://developer.android.com/ndk/guides/standalone_toolchain.html
https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v-read-only

# Make NDK toolchain

$NDK_PATH/bin/make_standalone_toolchain.py \
    --arch arm --api 21 --install-dir $DESTINATION_PATH

