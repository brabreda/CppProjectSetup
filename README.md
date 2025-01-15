# C++ project setup

## Steps to build
```
conan profile detect --force
```

```
conan install . --output-folder=build --build=missing
```

```
$ cd build
```

```
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
```

```
$ cmake --build .
```
