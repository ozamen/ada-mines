with Ada.Text_IO;
use Ada.Text_IO;

procedure main is
    type Status is range 0 .. 5;
    type Col is range 1 .. 4;
    type Line is range 1 .. 4;
    type Array2D is array (Col, Line) of Status;
    Board : Array2D := ((3, 2, 3, 1), (5, 1, 2, 0), (5, 1, 2, 2), (5, 1, 2, 1));
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   for i in Col loop
       Put("| ");
       for j in Line loop
            Put(Status'Image (Board (i, j)));
            Put(" | ");
        end loop;
        New_Line;
   end loop;
end main;
