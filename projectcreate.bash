echo '{' >>.vimspector.json
echo '  "configurations": {'>>.vimspector.json
echo '    "cpp-Launch": {'>>.vimspector.json
echo '      "adapter": "vscode-cpptools",'>>.vimspector.json
echo '      "configuration": {'>>.vimspector.json
echo '        "request": "launch",'>>.vimspector.json
echo '        "program": "${fileDirname}/main",'>>.vimspector.json
echo '        "stopOnEntry": true,'>>.vimspector.json
echo '        "cwd": "${workspaceFolder}",'>>.vimspector.json
echo '        "externalConsole": true,'>>.vimspector.json
echo '        "MIMode": "gdb"'>>.vimspector.json
echo '      }'>>.vimspector.json
echo '    },'>>.vimspector.json
echo '    "python-Launch": {'>>.vimspector.json
echo '      "adapter": "vscode-python",'>>.vimspector.json
echo '      "configuration": {'>>.vimspector.json
echo '        "request": "launch",'>>.vimspector.json
echo '        "program": "${file}",'>>.vimspector.json
echo '        "stopOnEntry": true,'>>.vimspector.json
echo '        "cwd": "${workspaceFolder}",'>>.vimspector.json
echo '        "externalConsole": true'>>.vimspector.json
echo '      }'>>.vimspector.json
echo '    }'>>.vimspector.json
echo '  }'>>.vimspector.json
echo '}'>>.vimspector.json


echo 'cmake_minimum_required(VERSION 3.5)'>>CMakeLists.txt
echo 'set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")'>>CMakeLists.txt
echo 'set(CMAKE_CXX_STANDARD 11)'>>CMakeLists.txt
echo 'set(CMAKE_CXX_STANDARD_REQUIRED ON)'>>CMakeLists.txt
echo 'set(CMAKE_BUILD_TYPE Debug)'>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo 'project(main VERSION 1.0)'>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo 'find_package(SDL2 REQUIRED)'>>CMakeLists.txt
echo 'find_package(SDL2_image REQUIRED)'>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo 'include_directories(${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIR})'>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo 'file(GLOB_RECURSE SRC_FILES src/*.cpp CONFIGURE_DEPENDS)'>>CMakeLists.txt
echo 'add_executable(main main.cpp ${SRC_FILES})'>>CMakeLists.txt
echo ''>>CMakeLists.txt
echo 'target_include_directories(main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)'>>CMakeLists.txt
echo 'string(STRIP ${SDL2_LIBRARIES} SDL2_LIBRARIES)'>>CMakeLists.txt
echo 'target_link_libraries(main ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES})'>>CMakeLists.txt


echo 'g++'>>.ccls
echo '%h %cpp -std=c++11'>>.ccls
echo ''>>.ccls
echo '-I/home/ak/practice/cpp_practice/proj/include'>>.ccls

