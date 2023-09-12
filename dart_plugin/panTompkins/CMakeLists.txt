cmake_minimum_required(VERSION 3.10)
project(panTompkins LANGUAGES C)
add_library(panTompkins SHARED panTompkins.c)
add_executable(panTompkins_test panTompkins.c)

set(CMAKE_BUILD_TYPE Release)