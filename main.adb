with Ada.Text_IO;
use Ada.Text_IO;

procedure main is
    type My_Int is range 0 .. 1000;
    type col is range 1 .. 4;
    type line is range 1 .. 4;
    type My_Int_Array is array (col, line) of My_Int;
    Arr : My_Int_Array := ((3, 6, 7, 1), (5, 1, 2, 7), (5, 1, 2, 7), (5, 1, 2, 7));
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   for i in col loop
       Put("| ");
       for j in line loop
            Put(My_Int'Image (Arr (i, j)));
            Put(" | ");
        end loop;
        New_Line;
   end loop;
end main;
