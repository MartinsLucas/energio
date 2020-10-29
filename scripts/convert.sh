FILE="./bdgd/latest/layers.txt"

if test -f "$FILE"; then
    echo "$FILE exists."
    echo "Deleting $FILE."
    rm $FILE
fi

echo "Creatng $FILE"
touch $FILE

for entry in ./bdgd/latest/*.gdb; do
    ogrinfo -q $entry | while read line; do
        echo "$line" | sed 's/\([0-9]\+: \)//g' | sed 's/\ .*//g'
    done
done