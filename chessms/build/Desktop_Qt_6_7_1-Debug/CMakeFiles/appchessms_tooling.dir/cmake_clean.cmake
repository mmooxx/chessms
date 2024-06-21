file(REMOVE_RECURSE
  "chessms/Chessms.qml"
  "chessms/Flower.qml"
  "chessms/GameWindow.qml"
  "chessms/Grassland.qml"
  "chessms/Images.qml"
  "chessms/Main.qml"
  "chessms/Tree.qml"
  "chessms/ctroller.js"
  "chessms/images/chessms.png"
  "chessms/images/flower01.png"
  "chessms/images/flower02.png"
  "chessms/images/flower03.png"
  "chessms/images/flower04.png"
  "chessms/images/grassland.png"
  "chessms/images/tree.png"
  "chessms/paintCtroller.js"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appchessms_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
