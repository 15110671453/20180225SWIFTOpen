# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_SOURCE_DIR = /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources

# Include any dependencies generated for this target.
include sources/CMakeFiles/hiredis_bridge.dir/depend.make

# Include the progress variables for this target.
include sources/CMakeFiles/hiredis_bridge.dir/progress.make

# Include the compile flags for this target's objects.
include sources/CMakeFiles/hiredis_bridge.dir/flags.make

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o: sources/CMakeFiles/hiredis_bridge.dir/flags.make
sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o: hiredis_bridge.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o"
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o   -c /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/hiredis_bridge.c

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.i"
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/hiredis_bridge.c > CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.i

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.s"
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/hiredis_bridge.c -o CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.s

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.requires:

.PHONY : sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.requires

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.provides: sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.requires
	$(MAKE) -f sources/CMakeFiles/hiredis_bridge.dir/build.make sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.provides.build
.PHONY : sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.provides

sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.provides.build: sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o


# Object files for target hiredis_bridge
hiredis_bridge_OBJECTS = \
"CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o"

# External object files for target hiredis_bridge
hiredis_bridge_EXTERNAL_OBJECTS =

libdir/libhiredis_bridge.a: sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o
libdir/libhiredis_bridge.a: sources/CMakeFiles/hiredis_bridge.dir/build.make
libdir/libhiredis_bridge.a: sources/CMakeFiles/hiredis_bridge.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../libdir/libhiredis_bridge.a"
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && $(CMAKE_COMMAND) -P CMakeFiles/hiredis_bridge.dir/cmake_clean_target.cmake
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hiredis_bridge.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sources/CMakeFiles/hiredis_bridge.dir/build: libdir/libhiredis_bridge.a

.PHONY : sources/CMakeFiles/hiredis_bridge.dir/build

sources/CMakeFiles/hiredis_bridge.dir/requires: sources/CMakeFiles/hiredis_bridge.dir/hiredis_bridge.c.o.requires

.PHONY : sources/CMakeFiles/hiredis_bridge.dir/requires

sources/CMakeFiles/hiredis_bridge.dir/clean:
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources && $(CMAKE_COMMAND) -P CMakeFiles/hiredis_bridge.dir/cmake_clean.cmake
.PHONY : sources/CMakeFiles/hiredis_bridge.dir/clean

sources/CMakeFiles/hiredis_bridge.dir/depend:
	cd /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources /home/admindyn/CLionProjects/Swift_Linux/Sources/hiredis_bridge/sources/sources/CMakeFiles/hiredis_bridge.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sources/CMakeFiles/hiredis_bridge.dir/depend

