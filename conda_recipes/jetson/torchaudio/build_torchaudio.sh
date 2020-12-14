git clone -b v0.7.2 https://github.com/pytorch/audio
mv audio torchaudio
cd torchaudio
export BUILD_VERSION=0.7.2
apt install sox libsox-dev libsox-fmt-all
conda install pybind11
export CPLUS_INCLUDE_PATH=/opt/conda/include/
python setup.py bdist_wheel
