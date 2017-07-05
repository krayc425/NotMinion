# NotMinion
This APP is inspired by __Not Hotdog__ of Jian Yang's idea in *Silicon Valley*, and it is just another version of it: __Not Minion__

# Requirements
 
* [TensorFlow](https://www.tensorflow.org)
* Python 2 & 3 (Only for **Step 2**)

# Introduction
It first retrains `TensorFlow Inception v3`'s last layer to learn how a Minion image looks like, makes a model, then applies this model into `TensorFlow`'s example iOS App to recognize a Minion.

If you want to build your own __Not something__ from scratch, you should read from **Step 1**. Otherwise, you can jump to **Step 5**.

## Step 1
First you have to install all tools listed in __Requirements__. Please refer to their websites and GitHub.

## Step 2
Prepare for image sets.  
`TensorFlow Inception v3` is used to classify objects, so you have to divide images into 2 categories: __Minions__ and __Not Minions__. And the root image directory should be organized as below:  

```
└── Minion Images           <---- DIRECTORY_TO_YOUR_IMAGES
    ├── Minions
    └── Not Minions         <---- DIRECTORY_TO_IMAGE_DOWNLOAD
```

1. You can download or scrape many Minion images from Internet, and put them into __Minions__.  

2. In `Image Crawler` there is a random image downloader for __Not Minions__. Usage:  

```
python3 /Image Crawler/random_imgur.py -i 200 -o DIRECTORY_TO_IMAGE_DOWNLOAD
python2 /Image Crawler/delete_not_jpg.py -o DIRECTORY_TO_IMAGE_DOWNLOAD
```

#### Attention
* `random_imgur.py` uses Python3, and `delete_not_jpg.py` uses Python2.
* The `DIRECTORY_TO_IMAGE_DOWNLOAD` in two commands should be the same.


## Step 3
Once you have installed `TensorFlow`, you can begin to retrain it to learn your __something__. In this App, it is __Minion__.

It means the image directory should contains 2 sub directories, each of them contains the corresponding images. (You have done this in **Step 2**)

Then execute the following commands in terminal:
    
```
cd ROOT_DIRECTORY_OF_TENSORFLOW
bazel build tensorflow/examples/image_retraining:retrain
bazel-bin/tensorflow/examples/image_retraining/retrain --image_dir DIRECTORY_TO_YOUR_IMAGES
```
This shall take a while, based on the performance of your computer.

## Step 4
Now you have generated the `output_graph.pb` file in `/tmp` by default. Now in terminal, please enter

```
cd ROOT_DIRECTORY_OF_TENSORFLOW
bazel build tensorflow/examples/label_image:label_image && \
bazel-bin/tensorflow/examples/label_image/label_image \
--graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt \
--output_layer=final_result \
--input_layer=Mul \
--image=PATH_TO_YOUR_TEST_IMAGE
```

and witness Miracle!

#### A minion image:

```
2017-06-12 14:32:09.507037: I tensorflow/examples/label_image/main.cc:251] minions (1): 0.999147
2017-06-12 14:32:09.507057: I tensorflow/examples/label_image/main.cc:251] not minions (0): 0.000853157
```

#### Not a minion image:

```
2017-06-12 14:31:43.194735: I tensorflow/examples/label_image/main.cc:251] not minions (0): 0.890092
2017-06-12 14:31:43.194766: I tensorflow/examples/label_image/main.cc:251] minions (1): 0.109908
```

The float number at the end of each line represents the likelihood that this image is (not) a minion.

## Step 5

If you just want to run this app on your iPhone, you can start from this step. You need to have `TensorFlow` prepared on your Mac.

1. Clone this repo.

2. Copy the `/Not Minion TensorFlow Example` directory (which is an example iOS App provided by `TensorFlow` with our own model applied) into `ROOT_DIRECTORY_OF_TENSORFLOW/tensorflow/tensorflow/contrib/ios_examples/`.

3. Download the trained Minion model from [BaiduDisk](http://pan.baidu.com/s/1jI0xXiu) and copy it to `../Not Minion TensorFlow Example/data` 
  
    or
    
    Copy your own `output_labels.txt` and `output_graph.pb` to `../Not Minion TensorFlow Example/data` and rename them as `imagenet_comp_graph_label_strings.txt` and `tensorflow_inception_graph.pb`.

4. Open `Not Minion TF.xcodeproj` and run!

    *Maybe you need to change Developer Certificates.*
    
#### Preview
<table>
    <tr>
        <td><img src="https://github.com/songkuixi/NotMinion/blob/master/Minion_Preview.png"></td>
        <td><img src="https://github.com/songkuixi/NotMinion/blob/master/Not_Minion_Preview.png"></td>
    </tr>
</table>


# TODO

Transform `Inception v3` model to `Core ML` format and apply it with `CoreML Framework` in iOS 11.

Created on 2017-07-05

