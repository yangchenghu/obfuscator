### Install

``` bash
$ git clone -b llvm-4.0-string-obfuscation https://github.com/lingyfh/obfuscator.git
$ mkdir build
$ cd build
$ cmake -DCMAKE_BUILD_TYPE=Release ../../obfuscator/
$ make -j7
```

### Features

``` bash
-mllvm -sub 
-mllvm -fla 
-mllvm -sobf 
-mllvm -seed=0x12345678111111111111111111111111
```

### Android

Android.mk

``` bash
LOCAL_CFLAGS := -DANDROID_NDK \
                -DDISABLE_IMPORTGL \
                -fvisibility=hidden \
                -mllvm -sub \
                -mllvm -fla \
                -mllvm -split_num=3 \
                -mllvm -sobf \
                -mllvm -seed=0x12345678111111111111111111111111
                
```


Please have a look at the [wiki](https://github.com/obfuscator-llvm/obfuscator/wiki)!

Current version: [LLVM-4.0-string-obfuscation](https://github.com/lingyfh/obfuscator/tree/llvm-4.0-string-obfuscation)


Low Level Virtual Machine (LLVM)
================================

This directory and its subdirectories contain source code for LLVM,
a toolkit for the construction of highly optimized compilers,
optimizers, and runtime environments.

LLVM is open source software. You may freely distribute it under the terms of
the license agreement found in LICENSE.txt.

Please see the documentation provided in docs/ for further
assistance with LLVM, and in particular docs/GettingStarted.rst for getting
started with LLVM and docs/README.txt for an overview of LLVM's
documentation setup.

If you are writing a package for LLVM, see docs/Packaging.rst for our
suggestions.
