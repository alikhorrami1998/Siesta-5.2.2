#!/bin/bash

# بروزرسانی Homebrew
brew update

# نصب وابستگی‌های مورد نیاز
brew install gcc
brew install open-mpi
brew install scalapack
brew install netcdf
brew install hdf5
brew install cmake
brew install make
brew install lapack


# نصب کتابخانه‌های اضافی برای محاسبات علمی
brew install openblas
brew install fftw

# ایجاد دایرکتوری برای نصب SIESTA
mkdir -p ~/software/siesta
cd ~/software/siesta

# دانلود کد منبع SIESTA (نسخه جدید)
curl -L -O https://gitlab.com/siesta-project/siesta/-/archive/master/siesta-master.tar.gz
tar -xzf siesta-master.tar.gz
cd siesta-master

# ایجاد دایرکتوری build
mkdir -p build
cd build

# پیکربندی با CMake

cmake .. -DCMAKE_Fortran_COMPILER=gfortran -DMPI_Fortran_COMPILER=mpif90 -DCMAKE_BUILD_TYPE=Release -DMPI=ON -DSCALAPACK_LIBRARIES=/opt/homebrew/lib/libscalapack.a -DBLAS_LIBRARIES=/opt/homebrew/lib/libblas.a -DLAPACK_LIBRARIES=/opt/homebrew/lib/liblapack.a

# کامپایل
make -j$(sysctl -n hw.ncpu)

# نصب
make install

# اضافه کردن مسیر به PATH
echo 'export PATH=$HOME/software/siesta/install/bin:$PATH' >> ~/.zshrc
echo 'export PATH=$HOME/software/siesta/install/bin:$PATH' >> ~/.bash_profile

# بارگذاری مجدد shell
source ~/.zshrc 2>/dev/null || source ~/.bash_profile

echo "نصب SIESTA تکمیل شد!"
echo "برای استفاده از SIESTA، یک terminal جدید باز کنید یا دستور زیر را اجرا کنید:"
echo "source ~/.zshrc"

# تست نصب
if command -v siesta &> /dev/null; then
    echo "SIESTA با موفقیت نصب شد!"
    siesta --version
else
    echo "خطا در نصب SIESTA. لطفاً مراحل را دوباره بررسی کنید."
fi
