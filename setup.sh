#! /bin/bash

mkdir data
cd data
wget -nc http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
mkdir bin
wget -nc http://msvocds.blob.core.windows.net/coco2014/train2014.zip
unzip train2014.zip
