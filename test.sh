#! /bin/bash
echo "Текущая директория: $(pwd)"
echo "Файлы в директории:"
ls -la
echo "Сборка проекта"
make clean
make
echo "Сборка завершена"
