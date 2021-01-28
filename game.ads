with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Board; use Board;

package Game is
    function generateUserBoard(Board, MineBoard : Array2D; Userclick_x : Integer; Userclick_y : Integer) return Array2D;

end Game;
