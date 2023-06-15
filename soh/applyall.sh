#!/bin/bash

python_script="excel2sheets.py"
for file in ./*.xlsx; do
    echo "Processing file: $file"
    python3 "$python_script" "$file" ./pruebas/
done
# EXTRAER DATOS
# cd ../2018 # a cada repo
# sh applyall.sh 
# MOVERLOS A UN MISMO DIRECTORIO
# mv 2018/pruebas/* csvs
# mv 2019/pruebas/* csvs
# mv 2020/pruebas/* csvs
# mv 2021/pruebas/* csvs
# mv 2022/pruebas/* csvs
# mv 2023/pruebas/* csvs
