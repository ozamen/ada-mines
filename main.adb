with Ada.Text_IO; use Ada.Text_IO;
with Display; use Display;

procedure main is
    Board : Array2D := ((3, 2, 3, 1), (5, 1, 2, 0), (5, 1, 2, 2), (5, 1, 2, 1));
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   DumpBoard (Board);
end main;
