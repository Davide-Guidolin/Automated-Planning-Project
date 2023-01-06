# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_problem5popf_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED problem5popf_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(problem5popf_FOUND FALSE)
  elseif(NOT problem5popf_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(problem5popf_FOUND FALSE)
  endif()
  return()
endif()
set(_problem5popf_CONFIG_INCLUDED TRUE)

# output package information
if(NOT problem5popf_FIND_QUIETLY)
  message(STATUS "Found problem5popf: 0.0.4 (${problem5popf_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'problem5popf' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${problem5popf_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(problem5popf_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "ament_cmake_export_dependencies-extras.cmake")
foreach(_extra ${_extras})
  include("${problem5popf_DIR}/${_extra}")
endforeach()
