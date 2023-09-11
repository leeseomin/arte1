



cd s

# 파일 이름에 공백이 있는 경우 공백을 '_'로 변경
for f in *\ *; do mv "$f" "${f// /_}"; done

# 모든 이미지를 3000x3000 크기로 리사이징
parallel convert {} -resize 3000x3000 {.}.png ::: *.* 

# .jpg 및 .JPG 확장자를 가진 파일 삭제
rm *.jpg
rm *.JPG

# 4k 크기의 하얀 배경 이미지 생성
convert -size 4000x4000 canvas:white -colorspace RGB white_background.png

# 3000x3000 크기의 이미지를 4k 하얀 배경의 중앙에 배치
parallel convert {} -gravity center -background white -extent 4000x4000 {/.}_centered.png ::: *.png

# 변환된 이미지를 .webp 형식으로도 저장
parallel convert {} {/.}_centered.webp ::: *_centered.png


# 임시로 생성한 하얀 배경 이미지 삭제
rm white_background.png

rm white_background_centered.png

rm white_background_centered_centered.webp






