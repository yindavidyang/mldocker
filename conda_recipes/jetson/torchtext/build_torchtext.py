git clone -b v0.8.1 https://github.com/pytorch/text
mv text torchtext
cd torchtext
git submodule update --init --recursive
export BUILD_VERSION=0.8.1
python setup.py bdist_wheel
