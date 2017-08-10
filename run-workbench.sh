docker run -i --network host \
	$([ -n "$1" ] && echo "-e HTTP_PROXY=$1") \
	$([ -n "$2" ] && echo "-e HTTPS_PROXY=$2") \
	-v $(pwd)/ndk:/ndk \
	-v $(pwd)/working-directory:/workbench \
	-t android-ndk-workbench 
