## Fashion Landmark Detection in the Wild
[[Project]](http://personal.ie.cuhk.edu.hk/~lz013/projects/FashionLandmarks.html) [[Paper]](https://arxiv.org/abs/1608.03049)   

## Overview
It is the authors' implementation of the fashion landmark detector described in:  
"Fashion Landmark Detection in the Wild"   
[Ziwei Liu](http://personal.ie.cuhk.edu.hk/~lz013/), [Sijie Yan](), [Ping Luo](http://personal.ie.cuhk.edu.hk/~pluo/), [Xiaogang Wang](http://www.ee.cuhk.edu.hk/~xgwang/), [Xiaoou Tang](https://www.ie.cuhk.edu.hk/people/xotang.shtml)    
In European Conference on Computer Vision (ECCV) 2016

<img src='./misc/demo_teaser.jpg' width=800>

Contact: Sijie Yan (yysijie@gmail.com) and Ziwei Liu (lz013@ie.cuhk.edu.hk)

## Getting started
* Install and compile the [Caffe](https://github.com/BVLC/caffe) libraries.
* Download the pre-trained models (See `Model Zoo` for details):
``` bash
Place "*.caffemodel" into "./models/FLD_upper(or lower or full)/" 
```
* Download the testing images. (See `Dataset` for details):
``` bash
Place "*.jpg" into "./data/FLD_upper(or lower or full)/" 
```
* Run the testing script:
``` bash
matlab ./scripts/demo.m
```

## Model Zoo:
* [FLD_upper_models.zip](https://drive.google.com/open?id=0B7EVK8r0v71pRTdiRHk3Sm9leXM): 3-stage cascaded CNN models trained on upper-body clothes of Fashion Landmark Detection Benchmark (FLD).
* [FLD_lower_models.zip](https://drive.google.com/open?id=0B7EVK8r0v71pcWtON1YtRU5xMUk): 3-stage cascaded CNN models trained on lower-body clothes of Fashion Landmark Detection Benchmark (FLD).
* [FLD_full_models.zip](https://drive.google.com/open?id=0B7EVK8r0v71pYnhhLXhVOWhTMEE): 3-stage cascaded CNN models trained on full-body clothes of Fashion Landmark Detection Benchmark (FLD).

## Dataset
[Large-scale Fashion (DeepFashion) Database](http://mmlab.ie.cuhk.edu.hk/projects/DeepFashion.html): [Fashion Landmark Detection Benchmark (FLD)](http://mmlab.ie.cuhk.edu.hk/projects/DeepFashion/LandmarkDetection.html)

## Citation
```
@inproceedings{liu2016fashionlandmark,
 author = {Ziwei Liu, Sijie Yan, Ping Luo, Xiaogang Wang, and Xiaoou Tang},
 title = {Fashion Landmark Detection in the Wild},
 booktitle = {European Conference on Computer Vision (ECCV)},
 month = {October},
 year = {2016} 
}
```
