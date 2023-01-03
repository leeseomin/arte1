#only sket

parallel --no-notice rm -r ::: s1/* s2/* s3/* s4/* s5/* s6/* s7/* s8/* s9/* s10/* s11/* s12/* s13/*
parallel --no-notice rm -r ::: s14/* s15/* s16/* s17/* s18/* s19/* s20/* s21/* s22/* s23/* s24/* s25/*
cd s
for f in *\ *; do mv "$f" "${f// /_}"; done
cd ..
cd s
parallel convert {} -resize 3500x3500 {.}.png ::: *.* 
rm *.jpg
rm *.JPG
parallel convert {} ../s25/{} ::: *.*
cd ..
cd s
parallel convert {} -modulate 100,105,100  ../s1/{} ::: *.* 
cd ..
cd s1
for i in *.* 
do 
convert $i ../s/$i -alpha set -channel A -evaluate set 100% -compose softlight -composite ../s3/$i 
done 
cd .. 
cd s3
parallel gmic {} -fx_AbstractFlood 1,10,7,2,0,10,5,3,255,255,255,255,0,300,10,90,0.7,0,0,0 -o ../s4/{} ::: *.* 
cd ..
cd s4
for i in *.*; do
   convert $i  -set filename:new ../s25/"%t_re" "%[filename:new].png"
done


