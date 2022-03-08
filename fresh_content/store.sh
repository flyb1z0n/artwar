#!/bin/zsh

media_files=`ls *.(jpeg|png|jpg|JPEG|PNG|JPG)`
media_files=$(echo "$media_files" | tr '\n' ' ')

# idx=0
# for filename in "$media_files"
# do 
#     ((idx++))
#     echo "$filename"
#     echo "$idx"
    
# done

idx=0
cur_date=$(date +%y-%m-%d-%H_%M_%S_)
has_files=false
for file in ./*.(jpeg|png|jpg|JPEG|PNG|JPG); 
do 
    has_files=true
    ((idx++))
    extension="${file##*.}"
    echo "mv ./$file ../content/home/images/$cur_date$idx.$extension"
    mv ./$file ../content/home/images/$cur_date$idx"."$extension
done

if [ "$has_files" = true ] ; then
    git add ../content/home/images/*
    git commit -m "add new images at "$cur_date
    git push
fi
