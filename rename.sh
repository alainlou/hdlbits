START=$1
OFFSET=$2

for file in `ls|sort -g -r`
do
    filename=$(basename "$file")
    filename=${filename:1:10}
    extension=${filename##*.}
    filename=${filename%.*}

    if [ $filename -ge $START ]
    then
 	echo $file p$(($filename + $OFFSET)).$extension
        mv "$file" "p$(($filename + $OFFSET))".$extension
    fi
done
