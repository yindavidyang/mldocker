git clone -b v0.8.0 https://github.com/pytorch/audio
mv audio torchaudio
cd torchaudio
git submodule update --init --recursive
export BUILD_VERSION=0.8.0
apt install sox libsox-dev libsox-fmt-all
conda install pybind11 ninja
export CPLUS_INCLUDE_PATH=/opt/conda/include/
python setup.py bdist_wheel
