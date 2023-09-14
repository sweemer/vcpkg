cmake_minimum_required(VERSION 3.8)
project(lets-be-rational CXX)

add_library(lets-be-rational erf_cody.cpp
                             lets_be_rational.cpp
                             normaldistribution.cpp
                             rationalcubic.cpp)

file(GLOB_RECURSE PUBLIC_HEADERS "*.h")

install(TARGETS lets-be-rational
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include)
