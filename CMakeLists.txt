cmake_minimum_required(VERSION 3.10)
project(PanTompkins LANGUAGES C)
add_library(PanTompkins SHARED panTompkins.c)
add_executable(PanTompkins_test panTompkins.c)

set(CMAKE_BUILD_TYPE Release)