git clone -b release/0.9 https://github.com/pytorch/text
mv text torchtext
cd torchtext
git submodule update --init --recursive
export BUILD_VERSION=0.9.0
python setup.py bdist_wheel
