# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /run/media/root/linux/实训/chessms

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug

# Utility rule file for appchessms_qmllint_json.

# Include any custom commands dependencies for this target.
include CMakeFiles/appchessms_qmllint_json.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/appchessms_qmllint_json.dir/progress.make

CMakeFiles/appchessms_qmllint_json: /opt/Qt/6.7.1/gcc_64/bin/qmllint
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Main.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/GameWindow.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Flower.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Chessms.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Tree.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Grassland.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/ctroller.js
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Chessms_slash.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/Monster.qml
CMakeFiles/appchessms_qmllint_json: /run/media/root/linux/实训/chessms/View.qml
CMakeFiles/appchessms_qmllint_json: .rcc/qmllint/appchessms_json.rsp
	cd /run/media/root/linux/实训/chessms && /opt/Qt/6.7.1/gcc_64/bin/qmllint @/run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug/.rcc/qmllint/appchessms_json.rsp

appchessms_qmllint_json: CMakeFiles/appchessms_qmllint_json
appchessms_qmllint_json: CMakeFiles/appchessms_qmllint_json.dir/build.make
.PHONY : appchessms_qmllint_json

# Rule to build all files generated by this target.
CMakeFiles/appchessms_qmllint_json.dir/build: appchessms_qmllint_json
.PHONY : CMakeFiles/appchessms_qmllint_json.dir/build

CMakeFiles/appchessms_qmllint_json.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/appchessms_qmllint_json.dir/cmake_clean.cmake
.PHONY : CMakeFiles/appchessms_qmllint_json.dir/clean

CMakeFiles/appchessms_qmllint_json.dir/depend:
	cd /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /run/media/root/linux/实训/chessms /run/media/root/linux/实训/chessms /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/appchessms_qmllint_json.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/appchessms_qmllint_json.dir/depend

