#!/bin/bash


while getopts ":l:e:x:d:" flag
do
    case "${flag}" in
        l) location=${OPTARG} ;;
        e) extensions=(${OPTARG}) ;;
        x) exclude=${OPTARG};;
        d) destination=${OPTARG};;
    esac
done


echo "location: $location";
echo "extensions: ${extensions[@]}";
echo "exclude: ${exclude[@]}";
echo "destination: $destination";

arr_extensions=(${extensions[@]})

function not_excluded () {
    arr_excludes=(${@:2})
    local e
    for e in ${arr_excludes[@]}; 
    do 
        [[ $e == $1 ]] && return 1; 
    done
    return 0
}

for directory in $(find "$location" -type d);
do 
    if not_excluded "$directory" "${exclude[@]}"; 
    then
        for ext in ${arr_extensions[@]}; 
        do
            mv "$directory"/*."$ext" "$destination" 2>/dev/null
        done
    fi
done
