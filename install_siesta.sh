#!/bin/bash

set -e  # در صورت وقوع خطا، اسکریپت متوقف شود

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing dependencies ==="
sudo apt install -y \
    build-essential \
    checkinstall \
    cmake \
    gfortran \
    g++ \
    make \
    pkg-config \
    libxc-dev \
    libreadline-dev \
    libblas-dev \
    liblapack-dev \
    libfftw3-dev \
    libnetcdf-dev \
    libnetcdff-dev \
    libscalapack-mpi-dev \
    libscalapack-openmpi-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-doc \
    libopenblas-dev \
    libelpa-dev \
    python3 \
    gnuplot \
    git \
    bison \
    flex

echo "=== Downloading SIESTA 5.2.2 ==="
wget https://gitlab.com/siesta-project/siesta/-/releases/5.2.2/downloads/siesta-5.2.2.tar.gz

echo "=== Extracting archive ==="

# Extract to temp folder
mkdir temp_extract
tar -xzf siesta-5.2.2.tar.gz -C temp_extract

# Move content from siesta-5.2.2 to current folder
mv temp_extract/siesta-5.2.2/* ./
mv temp_extract/siesta-5.2.2/.[!.]* ./ 2>/dev/null

# Cleanup
rm -rf temp_extract siesta-5.2.2.tar.gz

echo "=== Creating build directory ==="
mkdir -p build && cd build

echo "=== Running CMake ==="
cmake .. \
    -DSIESTA_WITH_MPI=ON \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_Fortran_COMPILER=mpif90 \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -Dlibgridxc_FIND_METHOD=fetch \
    -DSCALAPACK_LIBRARY=scalapack-openmpi \
    -DSCALAPACK_LIBRARY_DIR=/usr/lib/x86_64-linux-gnu \
    -DSIESTA_WITH_NETCDF=ON \
    -DSIESTA_WITH_LIBXC=ON \
    -DSIESTA_WITH_ELSI=ON \
    -DSIESTA_TOOLCHAIN=gnu \
    -DCMAKE_BUILD_TYPE=Release

echo "=== Building SIESTA ==="
make -j$(nproc)

echo "=== Installing SIESTA ==="
sudo make install

echo "✅ SIESTA installed successfully!"
