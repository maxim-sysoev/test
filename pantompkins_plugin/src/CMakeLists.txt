# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(pantompkins_plugin_library VERSION 0.0.1 LANGUAGES C)

add_library(pantompkins_plugin SHARED
  "pantompkins_plugin.c"
)

set_target_properties(pantompkins_plugin PROPERTIES
  PUBLIC_HEADER pantompkins_plugin.h
  OUTPUT_NAME "pantompkins_plugin"
)

target_compile_definitions(pantompkins_plugin PUBLIC DART_SHARED_LIB)
