## Fashion Landmark Detection in the Wild
Fashion landmarks are functional keypoints defined on clothes, such as corners of neckline, hemline and cuff. They have been recently introduced as an effective visual representation for fashion image understanding.
Our Deep Fashion Alignment (DFA) takes clothes bounding box as input and predict both fashion landmark locations and visibility states.

[[Project]](http://personal.ie.cuhk.edu.hk/~lz013/projects/FashionLandmarks.html) [[Paper]](https://arxiv.org/abs/1608.03049)   

<img src='./misc/demo.gif' width=540>

## Overview
`Deep Fashion Alignment (DFA)` is the authors' implementation of the fashion landmark detector described in:  
"Fashion Landmark Detection in the Wild"   
[Ziwei Liu](http://personal.ie.cuhk.edu.hk/~lz013/), [Sijie Yan](http://mmlab.ie.cuhk.edu.hk/), [Ping Luo](http://personal.ie.cuhk.edu.hk/~pluo/), [Xiaogang Wang](http://www.ee.cuhk.edu.hk/~xgwang/), [Xiaoou Tang](https://www.ie.cuhk.edu.hk/people/xotang.shtml) (The Chinese University of Hong Kong)   
In European Conference on Computer Vision (ECCV) 2016

<img src='./misc/demo_teaser.jpg' width=800>

Contact: Sijie Yan (ys016@ie.cuhk.edu.hk) and Ziwei Liu (lz013@ie.cuhk.edu.hk)

## Getting started
* Install and compile the [Caffe](https://github.com/BVLC/caffe) library.
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
* [FLD_upper_models.zip](https://drive.google.com/file/d/0B7EVK8r0v71pa1BTRnJSaEI3a2c/view?usp=sharing&resourcekey=0-OUWgaD_1-NhR_Otu5HmLMw): 3-stage cascaded CNN models trained on upper-body clothes of Fashion Landmark Detection Benchmark (FLD).
* [FLD_lower_models.zip](https://drive.google.com/file/d/0B7EVK8r0v71pMmpXbDY5R3hkUFU/view?usp=sharing&resourcekey=0-pi68iUGKRpTqzMnoQKCuIQ): 3-stage cascaded CNN models trained on lower-body clothes of Fashion Landmark Detection Benchmark (FLD).
* [FLD_full_models.zip](https://drive.google.com/file/d/0B7EVK8r0v71pTlpsZENTRHg2ZW8/view?usp=sharing&resourcekey=0-PCNxyNm6WZOAg7vbucBhJQ): 3-stage cascaded CNN models trained on full-body clothes of Fashion Landmark Detection Benchmark (FLD).

## Dataset
[Large-scale Fashion (DeepFashion) Database](http://mmlab.ie.cuhk.edu.hk/projects/DeepFashion.html): [Fashion Landmark Detection Benchmark (FLD)](http://mmlab.ie.cuhk.edu.hk/projects/DeepFashion/LandmarkDetection.html)

## License and Citation
The use of this software is RESTRICTED to **non-commercial research and educational purposes**.

```
@inproceedings{liu2016fashionlandmark,
 author = {Ziwei Liu, Sijie Yan, Ping Luo, Xiaogang Wang, and Xiaoou Tang},
 title = {Fashion Landmark Detection in the Wild},
 booktitle = {European Conference on Computer Vision (ECCV)},
 month = {October},
 year = {2016} 
}
```
