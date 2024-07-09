cmake_minimum_required(VERSION 3.29)

project(
  chessms
  VERSION 0.1
  LANGUAGES CXX)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appchessms main.cpp)

qt_add_qml_module(
  appchessms
  URI
  chessms
  VERSION
  1.0
  QML_FILES
  Main.qml
  SOURCES
  QML_FILES
  GameWindow.qml
  QML_FILES
  Flower.qml
  QML_FILES
  Chessms.qml
  QML_FILES
  Tree.qml
  QML_FILES
  Grassland.qml
  QML_FILES
  ctroller.js
  RESOURCES
  images/chessms.png
  images/grassland.png
  images/sakula_fall01.png
  images/sakula_fall02.png
  images/sakula_fall03.png
  images/sakula_fall04.png
  images/sakula_fall05.png
  images/sakula_fall06.png
  images/sakula_fall07.png
  images/sakula_fall08.png
  images/sakula_fall09.png
  images/sakula_fall10.png
  images/sakula_fall11.png
  images/sakula_fall12.png
  images/sakula_fall13.png
  images/sakula_fall14.png
  images/sakula_fall15.png
  images/sakula_fall16.png
  images/sakula_fall17.png
  images/sakula_fall18.png
  images/sakula_fall19.png
  images/sakula_fall20.png
  images/sakula_fall21.png
  images/sakula_fall22.png
  images/sakula_fall23.png
  images/sakula_fall24.png
  images/sakula_fall25.png
  images/sakula_fall26.png
  images/sakula_fall27.png
  images/sakula_fall28.png
  images/tree.png
  images/slash1.png
  images/slash2.png
  images/slash3.png
  images/slash4.png
  QML_FILES Chessms_slash.qml)
target_compile_features(appchessms PRIVATE cxx_std_20)

set_target_properties(
  appchessms
  PROPERTIES AUTORCC TRUE
             MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
             MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
             MACOSX_BUNDLE_SHORT_VERSION_STRING
             ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
             MACOSX_BUNDLE TRUE
             WIN32_EXECUTABLE TRUE)

target_link_libraries(appchessms PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(
  TARGETS appchessms
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

# qt_add_executable(chessms)  //Creates and finalizes an application target of a
# platform-specific type. This command performs the following tasks: 1. Create a
# CMake target of the appropriate type for the target platform. 2. Link the
# target to the Qt::Core library. 3. Handle finalization of the CMake target.

# qt_standard_project_setup()     #set(CMAKE_AUTOUIC ON)  set(CMAKE_AUTOMOC ON)

# @if %{HasTranslation} find_package(Qt6 REQUIRED COMPONENTS Core Quick
# LinguistTools) @else find_package(Qt6 REQUIRED COMPONENTS Core Quick) @endif

# target_sources(appchessms PRIVATE main.cpp qml.qrc @if %{HasTranslation}
# %{TsFileName} @endif
#
# PUBLIC
#
# )

# qt_import_qml_plugins(chessms)

# cmake_minimum_required(VERSION 3.16)
#
# project(chessms VERSION 0.1 LANGUAGES CXX)
#
# @if !true set(CMAKE_AUTOMOC ON) @endif set(CMAKE_CXX_STANDARD_REQUIRED ON)
#
# find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
#
# @if true @if false qt_standard_project_setup(REQUIRES 6.5) @else
# qt_standard_project_setup() @endif @endif
#
# qt_add_executable(appchessms main.cpp )
#
# qt_add_qml_module(appchessms URI chessms VERSION 1.0 QML_FILES Main.qml )
#
# # Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1. #
# If you are developing for iOS or macOS you should consider setting an #
# explicit, fixed bundle identifier manually though.
# set_target_properties(appchessms PROPERTIES #    MACOSX_BUNDLE_GUI_IDENTIFIER
# com.example.appchessms MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
# MACOSX_BUNDLE_SHORT_VERSION_STRING
# ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR} MACOSX_BUNDLE TRUE
# WIN32_EXECUTABLE TRUE )
#
# target_link_libraries(appchessms PRIVATE Qt6::Quick )
#
# include(GNUInstallDirs) install(TARGETS appchessms BUNDLE DESTINATION .
# LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION
# ${CMAKE_INSTALL_BINDIR} )
