with Ada.Text_IO; use Ada.Text_IO;

package Board is

    type Status is range 0 .. 5;
    type Col is range 1 .. 4;
    type Line is range 1 .. 4;
    type Array2D is array (Col, Line) of Status;

   procedure DumpBoard(Board : Array2D);
   function generateBoard (c : Col; l : Line) return Array2D;


end Board;
