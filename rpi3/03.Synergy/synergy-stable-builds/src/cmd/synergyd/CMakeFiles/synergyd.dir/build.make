# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e

# Include any dependencies generated for this target.
include src/cmd/synergyd/CMakeFiles/synergyd.dir/depend.make

# Include the progress variables for this target.
include src/cmd/synergyd/CMakeFiles/synergyd.dir/progress.make

# Include the compile flags for this target's objects.
include src/cmd/synergyd/CMakeFiles/synergyd.dir/flags.make

src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.o: src/cmd/synergyd/CMakeFiles/synergyd.dir/flags.make
src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.o: src/cmd/synergyd/synergyd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.o"
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/synergyd.dir/synergyd.cpp.o -c /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd/synergyd.cpp

src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/synergyd.dir/synergyd.cpp.i"
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd/synergyd.cpp > CMakeFiles/synergyd.dir/synergyd.cpp.i

src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/synergyd.dir/synergyd.cpp.s"
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd/synergyd.cpp -o CMakeFiles/synergyd.dir/synergyd.cpp.s

# Object files for target synergyd
synergyd_OBJECTS = \
"CMakeFiles/synergyd.dir/synergyd.cpp.o"

# External object files for target synergyd
synergyd_EXTERNAL_OBJECTS =

bin/synergyd: src/cmd/synergyd/CMakeFiles/synergyd.dir/synergyd.cpp.o
bin/synergyd: src/cmd/synergyd/CMakeFiles/synergyd.dir/build.make
bin/synergyd: lib/libarch.a
bin/synergyd: lib/libbase.a
bin/synergyd: lib/libcommon.a
bin/synergyd: lib/libio.a
bin/synergyd: lib/libipc.a
bin/synergyd: lib/libmt.a
bin/synergyd: lib/libnet.a
bin/synergyd: lib/libplatform.a
bin/synergyd: lib/libsynergy.a
bin/synergyd: lib/libshared.a
bin/synergyd: lib/libclient.a
bin/synergyd: lib/libserver.a
bin/synergyd: lib/libipc.a
bin/synergyd: lib/libplatform.a
bin/synergyd: lib/libsynergy.a
bin/synergyd: lib/libclient.a
bin/synergyd: lib/libserver.a
bin/synergyd: lib/libnet.a
bin/synergyd: lib/libmt.a
bin/synergyd: lib/libio.a
bin/synergyd: lib/libshared.a
bin/synergyd: lib/libarch.a
bin/synergyd: lib/libbase.a
bin/synergyd: lib/libcommon.a
bin/synergyd: src/cmd/synergyd/CMakeFiles/synergyd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/synergyd"
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/synergyd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cmd/synergyd/CMakeFiles/synergyd.dir/build: bin/synergyd

.PHONY : src/cmd/synergyd/CMakeFiles/synergyd.dir/build

src/cmd/synergyd/CMakeFiles/synergyd.dir/clean:
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd && $(CMAKE_COMMAND) -P CMakeFiles/synergyd.dir/cmake_clean.cmake
.PHONY : src/cmd/synergyd/CMakeFiles/synergyd.dir/clean

src/cmd/synergyd/CMakeFiles/synergyd.dir/depend:
	cd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd /home/pi/Downloads/afzaalace-synergy-stable-builds-c30301e/src/cmd/synergyd/CMakeFiles/synergyd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cmd/synergyd/CMakeFiles/synergyd.dir/depend

