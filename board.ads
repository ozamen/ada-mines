with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;

package Board is

    Height: constant Integer := 16;
    Width: constant Integer := 30;
    MinesNumber: constant Integer := 99;

    --type Status is range 0 .. 5;
    subtype Col is Integer range 0 .. Width - 1;
    subtype Line is Integer range 0 .. Height - 1;
    type Array2D is array (Col, Line) of Integer;

   procedure DumpBoard(Board : Array2D);
   function generateBoard (Userclick_x : Col; Userclick_y : Line) return Array2D;
   function generateMineBoard (Board : Array2D) return Array2D;
   function getMineCount(Board : Array2D; Pos_x : Col ; Pos_y : Line) return Integer;
   function checkMine(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Integer;
   function checkCoord(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Boolean;
   function generateRandom(size : Integer) return Integer;

end Board;
