with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Board; use Board;

package Game is
    subtype Col is Integer range 0 .. Width - 1;
    subtype Line is Integer range 0 .. Height - 1;
    function clickBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D;
    function setFlag(UserBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D;
    function countFlag(UserBoard : Array2D) return Integer;
    function countFlaggedMine(UserBoard, RealBoard : Array2D) return Integer;
    function discoverZone(UserBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D;
    function discoverSafeZone(DiscoverBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D;

end Game;
