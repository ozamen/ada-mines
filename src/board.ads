with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;

package Board is
    -- CHOOSE YOUR DIFFICULTY

    -- BEGINNER MODE (10x10, 10 Mines)
    Height: constant Integer := 10;
    Width: constant Integer := 10;
    MinesNumber: constant Integer := 10;

    -- ADVANCED MODE (16x16, 40 Mines)
    --Height: constant Integer := 16;
    --Width: constant Integer := 16;
    --MinesNumber: constant Integer := 40;


    --EXPERT MODE (30x16, 99 Mines)
    --Height: constant Integer := 16;
    --Width: constant Integer := 30;
    --MinesNumber: constant Integer := 99;

    subtype Col is Integer range 0 .. Width - 1;
    subtype Line is Integer range 0 .. Height - 1;
    type Array2D is array (Col, Line) of Integer;

   procedure DumpBoard(Board : Array2D);

   function generateBoard (Userclick_x : Col; Userclick_y : Line) return Array2D;
   function generateMineBoard (Board : Array2D) return Array2D;
   function generateUserBoard(initValue : Integer) return Array2D;

   function getMineCount(Board : Array2D; Pos_x : Col ; Pos_y : Line) return Integer;
   function checkMine(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Integer with Post => checkMine'Result <= 8;
   function checkCoord(Pos_x : Integer ; Pos_y : Integer) return Boolean;
   function generateRandom(size : Integer) return Integer with Pre => size >=0, Post => generateRandom'Result <= size;
   function copyBoard(Board : Array2D) return Array2D;

end Board;
