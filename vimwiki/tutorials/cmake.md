# Modern Simple CMake Tutorial

### Simple hello world
* Create a `CMakeLists.txt` file
* Simple hello world program

  ```cmake
  cmake_minimum_required(VERSION 3.10)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)

  project(hello VERSION 1.0)
  add_executable(hello main.cpp)
  ```

### Running CMake
* CMake from the command line.

  ```bash
  cmake . && make && ./hello
  ```

### Adding a header file
* Slightly more involved program with header files. To include a header file directory:

 ```cmake
  target_include_directories(hello PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
  ```

### Multiple source files
* Ok, what if we have a bunch of source files?

  * Now the CMake source explicitly [discourages this](https://cmake.org/cmake/help/latest/command/file.html#filesystem) but the "alternative" of listing every source file or using some other build system that generates your CMakeLists.txt files is perhaps even more cumbersome. So knowing all that, I'd recommend continuing to use glob until some sane alternative shows up:

  ```cmake
  file(GLOB_RECURSE SRC_FILES src/*.cpp CONFIGURE_DEPENDS)
  add_executable(hello ${SRC_FILES})
  ```

### My own lib
* Create a lib from some source files:

  * Replace `add_executable` with `add_library` 
  * E.g:

  ```cmake
  add_library(mylib STATIC lib/blah.cpp)
  ```

* Can then include it in your main executable

  ```cmake
  target_link_libraries(hello PUBLIC mylib)
  ```

### Depending on external library with find_package
* A lot simpler, things are "cmake ready".
* Has two modes: Module mode (uses FindXXX.cmake files) and Config mode(uses XXXConfig.cmake files)
* Install the library in your system: `yay -S sfml`
* Use find_package to find it:
  ```cmake
  find_package(SFML 2 REQUIRED network audio graphics window system)
  ```
* Note that required fails the build if it can't find it.
* This sets certain 'result' variables (`_INCLUDE_DIR(S)`, `_LIBRARIES`, etc) although can differ from library to library.
* then you can simply include and link it:
  ```cmake
  target_include_directories(hello PUBLIC ${SFML_INCLUDE_DIR})
  target_link_libraries(hello PUBLIC ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
  ```

### Depending on external lib manually

**If the library doesn't have a cmake file**, there are two parts to it:
1. You manually link the library and include files.
2. You figure out that library's dependencies and link those as well.

To manually link a library:

* If it's in a default system lib directory (e.g: /usr/lib), we can simply link it:
  ```cmake
  find_library(MYLIB mylib)
  target_link_libraries(hello PUBLIC ${MYLIB})
  ```
* If it's in a custom path (e.g: /tmp/customPath/mylib.so):
  ```cmake
  find_library(MYLIB mylib PATHS /tmp/customPath)
  target_link_libraries(hello PUBLIC ${MYLIB})
  ```
* Note that you still need include directories for these libraries, you can put these in variables and then link them to the target:
  ```cmake
  set(MYLIB_INCLUDE_DIRS /tmp/customPath/include)
  target_include_directories(hello PUBLIC ${MYLIB_INCLUDE_DIRS})
  ```
* To figure out the library's dependencies, refer to its documentation and then manually link/include those like above.

### Directory structure
* Now, your project might be structured across multiple folders. You can easily create a top level `CMakeLists.txt` that just includes all directories using the `add_subdirectory(subdir)` command and CMake execute those in order.
* One thing to be careful about is setting variables, a subdirectory has its own scope. And in order to make a variable accessible in a higher scope, you need to set it with `PARENT_SCOPE`.


### Variables and scopes in CMake

First, a quick note of caution: Variables exist in an entirely separate universe from properties, and so what I say about variables may well not apply to properties, which I am much less well versed in.

Variables are set in CMake using set:

set(SOME_VARIABLE <value>)

The key to understanding variables in CMake in my mind is to understand where these variables get set.

Variables are set in a particular scope. I am aware of two places where new scopes are created:

    When add_subdirectory is used to add a new directory to the CMake source tree and
    When invoking a function

Each scope when created maintains a link to its parent scope, and so you can think of all the scopes in a project as a tree.

Here's the trick to understanding scopes in CMake: Unlike other languages, where name lookup would walk up the tree of scopes, each new scope is a copy by value of the parent scope at that point. This means add_subdirectory and function inherit the scope from the point where they're called, but modification will not be reflected in the parent scope.

This actually can be put to use to simplify your CMakeLists.txt. A surprising amount of CMake configuration is still done only through what seem to be 'global' variables -- despite the existence of more modern forms. i.e despite the existence of target_compile_options, if you need to add compiler options only to a C++ compile, you'll still have to use CMAKE_CXX_FLAGS.

If you don't realize, as i didn't, that scopes are copied-by-value, you may freak out at contaminating the build flags of other parts of a project. The trick is realizing that the scope copying limits the impact of the changes you make to these variables
Parent Scope

Given that a scope has a reference to the scope it was copied from, it maybe isn't surprising that there's a way in CMake to affect the parent scope:

set(FOO <foo value> PARENT_SCOPE)

Sets FOO in the parent scope... but not the current scope! So if you're going to want to read FOO back again, and see the updated value, you'll want to write to FOO without PARENT_SCOPE as well.
Cache Variables

Cache variables are special ones that persist across runs of CMake. They get written to a special file called CMakeCache.txt.

There's a little bit different about cache variables. They're typed, as they interact with CMake's configuration GUI system), as well they tend to override normal variables (which makes a bit of sense). Mostly though, on the subject, I'll defer to the documentation!

**Scope Tidbits:**
There's a couple other random notes related to scoping I'd like to share.

    * It appears that not all scopes are created equal. In particular, it appears that targets will always use target-affecting variables from the contained directory scope, not function scopes.

    ```cmake
    function(add_library_with_option)
        set(CMAKE_CXX_FLAGS "-added-option)
        add_library(foo T.cpp) 
     endfunction(add_library_with_option)
    ```

    * It's been my experience that the above doesn't work as expected, because the add_library call doesn't seem to see the modification of the CXX flags.

    Pro Tip: If anything has gone wrong in your CMakeLists.txt, try looking in the cache! It's just a text file, but can be crazy helpful to figure out what's going on.


### Details
Find difference in findpackage-packageconfig.cmake and package.cmake

### CPM
https://github.com/TheLartians/CPM.cmake


### Some resources

* https://cliutils.gitlab.io/modern-cmake
* https://github.com/dev-cafe/cmake-cookbook


