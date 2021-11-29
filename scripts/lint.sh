for file in ./src/*.py
do
    pylint $file
done