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

# Utility rule file for appchessms_qmlimportscan.

# Include any custom commands dependencies for this target.
include CMakeFiles/appchessms_qmlimportscan.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/appchessms_qmlimportscan.dir/progress.make

CMakeFiles/appchessms_qmlimportscan: .qt/qml_imports/appchessms_build.cmake

.qt/qml_imports/appchessms_build.cmake: /opt/Qt/6.7.1/gcc_64/libexec/qmlimportscanner
.qt/qml_imports/appchessms_build.cmake: .qt/rcc/qmake_chessms.qrc
.qt/qml_imports/appchessms_build.cmake: .qt/rcc/appchessms_raw_qml_0.qrc
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/Main.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/GameWindow.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/Flower.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/Chessms.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/Tree.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/Grassland.qml
.qt/qml_imports/appchessms_build.cmake: /run/media/root/linux/实训/chessms/ctroller.js
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running qmlimportscanner for appchessms"
	cd /run/media/root/linux/实训/chessms && /opt/Qt/6.7.1/gcc_64/libexec/qmlimportscanner @/run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug/.qt/qml_imports/appchessms_build.rsp

appchessms_qmlimportscan: .qt/qml_imports/appchessms_build.cmake
appchessms_qmlimportscan: CMakeFiles/appchessms_qmlimportscan
appchessms_qmlimportscan: CMakeFiles/appchessms_qmlimportscan.dir/build.make
.PHONY : appchessms_qmlimportscan

# Rule to build all files generated by this target.
CMakeFiles/appchessms_qmlimportscan.dir/build: appchessms_qmlimportscan
.PHONY : CMakeFiles/appchessms_qmlimportscan.dir/build

CMakeFiles/appchessms_qmlimportscan.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/appchessms_qmlimportscan.dir/cmake_clean.cmake
.PHONY : CMakeFiles/appchessms_qmlimportscan.dir/clean

CMakeFiles/appchessms_qmlimportscan.dir/depend:
	cd /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /run/media/root/linux/实训/chessms /run/media/root/linux/实训/chessms /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug /run/media/root/linux/实训/chessms/build/Desktop_Qt_6_7_1-Debug/CMakeFiles/appchessms_qmlimportscan.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/appchessms_qmlimportscan.dir/depend

