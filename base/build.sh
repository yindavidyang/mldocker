set -e 

docker build -t yinyang/base .

cd cuda10.2
docker build -t yinyang/base:cuda10.2 .

cd ../cpu
docker build -t yinyang/base:cpu .
