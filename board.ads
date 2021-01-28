with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;

package Board is

    Height: constant Integer := 15;
    Width: constant Integer := 15;

    type Status is range 0 .. 5;
    type Col is range 1 .. Width;
    type Line is range 1 .. Height;
    type Array2D is array (Col, Line) of Status;

   procedure DumpBoard(Board : Array2D);
   function generateBoard (c : Col; l : Line) return Array2D;


end Board;
