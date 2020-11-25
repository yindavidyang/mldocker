docker build -t yinyang/ml .

cd cuda10.2
docker build -t yinyang/ml:cuda10.2 .

cd ../cpu
docker build -t yinyang/ml:cpu .

cd ../nightly
docker build -t yinyang/ml:nightly .

cd ../fastai1
docker build -t yinyang/ml:fastai1 .
