#!/bin/bash
cd /Users/Kray/Documents/Programming/TensorFlow-Source/tensorflow 	# cd to root dir of TensorFlow
bazel build tensorflow/examples/label_image:label_image && \
bazel-bin/tensorflow/examples/label_image/label_image \
--graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt \
--output_layer=final_result \
--input_layer=Mul \
--image=/Users/Kray/Desktop/timg.jpg	# point to test image