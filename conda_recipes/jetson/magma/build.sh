# export CUDADIR=/usr/local/cuda
# cp -f make.inc-examples/make.inc.openblas make.inc
# sed -i 's/^#GPU_TARGET ?= \([[:alnum:][:blank:]]\+\)/GPU_TARGET ?= VOLTA/' make.inc
# sed -i 's/^NVCC\s*= nvcc/NVCC = \/usr\/local\/cuda\/bin\/nvcc/' make.inc
# sed -i 's/^#OPENBLASDIR ?= \/usr\/local\/openblas/OPENBLASDIR ?= \($PREFIX\)/' make.inc
# cat >> make.inc <<EOF
# CFLAGS += -D_FORCE_INLINES
# CXXFLAGS += -D_FORCE_INLINES
# NVCCFLAGS += -D_FORCE_INLINES
# EOF

# export OPENBLASDIR=$CONDA_PREFIX
# make -j $CPU_COUNT
# prefix=$PREFIX make install


# mkdir build
# cd build
# cmake ..
# make -j $CPU_COUNT
# make install
cp /usr/local/lib/libmagma* $PREFIX/lib/
cp /usr/local/include/magma* $PREFIX/include/
cp -r /usr/local/lib/pkgconfig/ $PREFIX/lib/