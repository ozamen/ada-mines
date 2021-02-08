with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Board; use Board;
with Display; use Display;

package Game is
    subtype Col is Integer range 0 .. Width - 1;
    subtype Line is Integer range 0 .. Height - 1;
    function clickBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D;
    function setFlag(UserBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D with Pre => Userclick_x >= 0 and Userclick_y >= 0;
    function countFlag(UserBoard : Array2D) return Integer with Post => countFlag'Result >= 0;
    function countUndiscoverCell(UserBoard : Array2D) return Integer with Post => countUndiscoverCell'Result >= 0;
    function discoverZone(UserBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D;
    function discoverSafeZone(DiscoverBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D;
    function gameLoop(UserBoard, RealBoard, MineBoard : Array2D) return Integer;
    function Is_Numeric (Item : in String) return Boolean;

end Game;
