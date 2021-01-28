with Ada.Text_IO; use Ada.Text_IO;
with Display; use Display;

procedure main is
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");
   DumpBoard (Board);
end main;
