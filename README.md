# 5IF Deep Learning Project - CNNs for Face Recognition

## Prerequisites

Run it preferably on GNU/Linux. Latest version available to you of Git and Docker (google them to find their installation instructions for your OS).

## Quickstart

Clone this repository:

```bash
git clone
```

Run the build.sh, then start_jupyter with sudo if you haven't set your user so that you can use docker commands without being root.

```bash
sudo ./build.sh
sudo ./start_jupyter.sh
```

The first command log should end with a message like the following:

```
Successfully built 554f78aa2d91
Successfully tagged deep:latest
```

The first one should return something like:

```
52aac7bf9976a85dd9b98258dc350bbe790acb94152c33884f6b3885a21bf31a
```

You can check whether the container started properly by writing:

```bash
sudo docker ps -a
```

If everything is fine you should get a line like the following (what matters here is that the "STATUS" field):

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS                    NAMES
52aac7bf9976        deep                "/bin/sh -c 'jupyter…"   13 minutes ago      Up 13 minutes             0.0.0.0:8887->8888/tcp   deep_jupyter

```

Once this is done, you should have a "data" folder in your cloned repository. Copy the test_images and train_images data folders into it. Then open a bash in the container :

```bash
sudo docker exec -it deep_jupyter \bin\bash
```

And run the following commands inside to build the image database :

```bash
cd data

/opt/caffe/build/tools/convert_imageset --shuffle --gray train_images/ posneg.txt train_lmdb

/opt/caffe/build/tools/convert_imageset --shuffle --gray test_images/ testposneg.txt test_lmdb

/opt/caffe/build/tools/compute_image_mean train_lmdb/ train_mean.binaryproto

/opt/caffe/build/tools/compute_image_mean test_lmdb/ test_mean.binaryproto
```

You can then close your terminal and open your favorite web browser to http://localhost:8887/ . This will open the Jupyter Notebook instance that is inside the container.

You will get to a login form. In the "Password or token" field, enter "demo". You will then be redirected to the usual Jupyter Notebook interface. Open the "notebooks" folder, and then the "01_CNN_Training.ipynb" if you want to train the neural network, or "02_CNN_Usage.ipynb" if you want to use a pre-trained one or your own.

## Resources

+ Stefan Duffner's website (where test data and latest version of the assignment can be found):
http://www.duffner-net.de/

+ Caffe Official Tutorial to get to know the tool:
http://caffe.berkeleyvision.org/tutorial/

+ Official Caffe Docker Image, for easy deployment:
https://github.com/BVLC/caffe/tree/master/docker

+ Caffe with Docker Tutorial, base for our own Dockerfile:
https://towardsdatascience.com/playing-with-caffe-and-docker-to-build-deep-learning-models-99c9570ffc3d

+ Deep Learning with Caffe tutorial, to get started:
http://christopher5106.github.io/deep/learning/2015/09/04/Deep-learning-tutorial-on-Caffe-Technology.html
