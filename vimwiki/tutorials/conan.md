# Conan
Conan is a package manager for c/c++. 

Features
* Language used for package description and implementation is *python*
* Compatible with different build systems.
* Decentralized(Can host recipes and binaries) and can work offline - Just like git. 

## Info 
```
Package: lib/2.0.0 


                              Recipe 
                                           
09253234234134135134134              09234231534132412348593   (package ids)
         
   [options]                         [options]   
      shared:False                      shared:true
   [settings]                        [settings]
      arch:x86_64                       arch:x86_64
      build_type:Release                build_type:debug
      compiler:gcc                      compiler:clang
      os:linux                          os:linux
        
recipe can select appropriate package binaries based on id for install. Different binaries for each setting/options
```

## Servers
JforgArtifactory, Conanio


## Setup 
### Using existing packages

1. Create *conanfile.txt*
```
[requires]
Poco/1.7.2@lasote/stable

[generators]
cmake
```

2. Enter this in build directory to install library
```
conan install *location of build conanfile.txt* 
```

3. Create cmakeList  and build project
```cmake
cmake_minimum_required(VERSION 3.4)
project(myproject CXX)

include (${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(main main.cpp)
target_link_libraries(main ${CONAN_LIBS})
```

### Create a package from existing project   
1. Create conanfile.py  in project. Alternatively, use `conan new Pkg/1.0`
2. Enter `conan export *testing1\test*` 
3. To use conan package Enter `conan install .. --build=missing` This tells conan to build from source

To add code to artifactory repo

4. `conan remote add myremote "url"`
5. `conan upload *package* -r=myremote --all``
 


## Commands

| command                          | Description                     |
| -------------------------------- | --------------------------      |
| conan info "path to conanfile"   | view package information        |
| conan search "package recipe"    | Inspect local cache             |
| conan export "package"           | Exports package to local cache  |
| conan install                    | Install package                 |
| conan upload "package"           | upload package to repo          |
| conan remove "package"           | Remove package from local cache |
| conan remote list                | see list of remotes             |



