parallel --no-notice rm -r ::: s1/* s2/* s3/* s4/* s5/* s6/* s7/* s8/* s9/* s10/* s11/* s12/* s13/*
parallel --no-notice rm -r ::: s14/* s15/* s16/* s17/* s18/* s19/* s20/* s21/* s22/* s23/* s24/* s25/*
parallel --no-notice rm -r ::: s26/* s27/* s28/* s29/* s30/* s31/* s32/* s33/* s34/* s35/* s36/* s37/* s38/*
# input folder s
# output folder s25
cd s
for f in *\ *; do mv "$f" "${f// /_}"; done
cd ..
cd s
parallel convert {} -resize 2500x2500 {.}.png ::: *.* 
rm *.jpg
rm *.JPG
parallel convert {} ../s25/{} ::: *.*
cd ..
cd s
for i in *.* 
do
gmic -input $i -gtutor_fpaint 0.5,0.5,0,0,45,0.5,0.5,0.5,0 -o ../s1/$i 
done
cd ..
cd s1
for i in *.* 
do 
convert $i ../s/$i -alpha set  -compose softlight -composite ../s2/$i 
done 
cd ..
cd s2
parallel convert {}  -set filename:new  ../s25/"%tyfinger" "%[filename:new].png" ::: *.*
cd ..
cd s2
for i in *.* 
do
gmic -input $i -gtutor_fpaint 0.5,0.5,0,0,45,0.5,0.5,0.5,0 -o ../s1/$i 
done
cd ..
cd s1
for i in *.* 
do 
convert $i ../s2/$i -alpha set  -compose softlight -composite ../s3/$i 
done 
cd ..
cd s3
parallel gmic {} -fx_unsharp 1,1.25,10,2,0,1,1,1,0,0,0,50,50 -o ../s4/{} ::: *.*
cd ..
cd s4
parallel convert {}  -set filename:new  ../s25/"%tyfinger2_un" "%[filename:new].png" ::: *.*

