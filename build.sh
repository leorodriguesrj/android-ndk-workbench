docker build -t android-ndk-workbench \
	$([ -n "$1" ] && echo "--build-arg HTTP_PROXY=$1") \
	$([ -n "$2" ] && echo "--build-arg HTTPS_PROXY=$2") \
    	.
