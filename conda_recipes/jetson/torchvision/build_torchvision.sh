git clone -b v0.9.0 https://github.com/pytorch/vision
mv vision torchvision
cd torchvision
apt install pybind11-dev
export BUILD_VERSION=0.9.0
python setup.py bdist_wheel
