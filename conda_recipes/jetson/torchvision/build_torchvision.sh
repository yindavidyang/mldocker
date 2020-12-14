git clone -b v0.8.2 https://github.com/pytorch/vision
mv vision torchvision
cd torchvision
apt install pybind11-dev
export BUILD_VERSION=0.8.2
python setup.py bdist_wheel
