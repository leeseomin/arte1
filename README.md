# arte1


### Dependency install on m1 mac 

```
brew install imagemagick
brew install gmic
gmic up   (gmic update)
brew install parallel

if error installing :
xcode-select --install

```

### Dependency install on ubuntu 20.04 


```
 # parallel install
 
 sudo apt install parallel
 
 
   #  gimp gmic install

sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge

sudo apt-get update

sudo apt-get install gmic gimp-gmic


 #   imagemagick install

sudo apt install graphicsmagick-imagemagick-compat

sudo apt install imagemagick-6.q16


 #  Gmic update filters (follow the link)
 
https://telegra.ph/Gmic-update-filters-07-26

```



### Install

```

git clone https://github.com/leeseomin/arte1

cd arte1

mkdir s{1..27}


```

### Usage
```

input images folder : s ,   result folder : s25


bash main.sh 

bash retouch.sh (retouching) 

```

###  Input image 

Recommended : classic art, Painting

Not recommended : Image taken with a typical smartphone


###  Results


![alt text](https://github.com/leeseomin/arte1/blob/main/arles.png)


 <img src="https://github.com/leeseomin/arte1/blob/main/degas.png" width="2500">
 
### make smooth video
```
ffmpeg -framerate 1 -pattern_type glob -i '*.png' \
  -c:v libx264 out.mp4
  

ffmpeg \
  -i out.mp4 \
  -crf 18 \
  -vf "minterpolate=fps=60:mi_mode=mci:mc_mode=aobmc:me_mode=bidir:vsbmc=1" \
  smooth_60fps.mov 
  
  
ffmpeg -i smooth_60fps.mov -pix_fmt yuv420p -crf 18 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" smooth_60fps_good.mov
```  



###  3x3  array

```
montage *.* -duplicate 8 -geometry +0+0 -tile 3x3  3array.png
```
  
  

### License

This repo is made freely available to academic and non-academic entities for non-commercial purposes such as academic research, teaching, scientific publications. Permission is granted to use the arte1 given that you agree to my license terms. Regarding the request for commercial use, please contact me via email (leeseomin@gmail.com)



###  Author

LEE SEOMIN
