---
layout: post
date: 2017-04-27 09:15:00
title: "<center>PyTorch and ROSPY Interoperability</center>"
excerpt: "<center>Using PyTorch Modules in ROSPY.</center>"
permalink: pytorch-ros
comments: true
mathjax: true
---

### [Table of Contents](#table-of-contents):

  - [Introduction](#introduction)
  - [Background](#nonlinear)
  - [Importing Torch into ROSPY](#problem-formulation)  
  - [Solution](#solution)

<a name='introduction'></a>
## Introduction

Yesterday was a nightmare in the life of this developer. I had trained a conv-net meant to classifer an object I was trying to recognize and later on manipulate using vision-based control. Since `PYTORCH` had tensor computation with strong GPU acceleration and differential backprop capabilities based on the `torch auto-grad` system, I took advantage of its python compatibility since it would mean I could easily write my control code in `rospy` or `roscpp` and publish vision/control topics that reduces interoperability issues when working with different Linux processes. Only that I didn't anticipate `Python 2` and `Python 3` module import problems way ahead of time. I would give more background below.

<a name="nonlinear"></a>
### Background

For the record, I run `ROS 1.0 (indigo bare bones)` on a `ubuntu 14.04 machine` with a 32GB RAM. The PYTORCH developers encourage users to install Torch with `conda` and typically use `Python3` since `python 2` will be phased out in the near future. And so, I had been using pytorch in a conda environment that both had a `python 2` and `python 3` environment. I could easily switch environments by turning on or off whichever python version I wanted. Fo rdetails on how to do this, see this [doc](https://conda.io/docs/py2or3.html) from the folks at conda.

So far, everything was working great. For `ros` applications that does not involve image processing classes such as `CvBridge`, I was able to get ros and pytorch to talk in python3 despite python3 being unofficially supported for `ROS 1.x` (see this [github repo](https://github.com/ros2/ros2/wiki)). Getting this to walk involves one of pip installing the necessary ros dependencies in python3 using this [requirements.txt file](https://github.com/lakehanne/RAL2017/blob/master/requirements.txt). This [github repo page](https://github.com/lakehanne/RAL2017/blob/master/pyrnn/src) shows how I do this.


Anyways, so I trained a conv net model in pytorch, no big deal. I had a roscpp node in on a different workstation, but within the same ros network broadcasting `sensor_msgs/Image` `RGB` images on a designated topic. Given what I know, it should be easy subscribing to the image topic and forwarding the video stream through the pre-trained neural network model to obtain classification results. But boy was I wrong.


<a name="problem-formulation"></a>
### Importing Torch into ROSPY

When you install PYTORCH with conda, it typically places the installation relative to your `anaconda` install path. For me this was in `/home/$USER/anaconda3`. So to be able to import `Torch` and use `rospy's`  `CvBridge` simultaneously, I installed the following modules: `netifaces`, `catkin_pkgs` and `rospkg` via `pip` while in the python3 conda environment. Then I tried to import the convet model from a different module's class into a rospy module I had written.

Say `convnet.py` model had entries like so:

  ```python
    import torch
    import torch.nn as nn

    class ResNet(object):
      def __init__(self, args, **kwargs)

      def convModel(self, arg1, arg2):
        '''
          define some conv models
        '''

      def forward(self, x):
        '''
         do stuff with conv layers
        '''
        return self.fc(prev_layer(x))

  ```

and `process_images.py` file had an import statement like so

```python
  from convnet import ResNet

  '''
    do stuff with imported model
  '''

```
  I got weird errors like

  ```python
    Python 3.6.0 (default, Oct 26 2016, 20:30:19)
    [GCC 4.8.4] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    No module named Torch
  ```
Huh? Country boy come to town. What could possibly be wrong? But the `convnet.py` model imports Torch ok. I figured the problem must be because I installed Torch with Python3 version. And so I pulled the python2 version of pytorch from Soumith's channel.

Now when I import, it says stuff like `convnet module xx compiled with a different Torch version`. What the heck `pytorch`?


<a name="solution"></a>
### Solution

At this moment, I stepped out for a walk, and caught a Euphemism. What if I do away with conda build of Pytorch and instead install pytorch from source or `PyPI`?

It turns out that this is the most error-less prone way to import Pytorch models into a rospy file or indeed a python2 file. To do this, I temporarily moved my `anaconda3` folder out of bash's native path, pulled the latest pytorch commit from github and then installed with `python setup.py install`.

Now when I try out the above commands, everything works well.

So my two cents to the robotics community running neural net models in `pytorch` or `tensorflow` and using such models in `rospy` or equivalent environments is to always go for the source installation whenever and if possible. You would save yourself a lot of headache and time-waste.