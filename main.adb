with Ada.Text_IO; use Ada.Text_IO;
with Board; use Board;

procedure main is
    RealBoard, MineBoard : Array2D;
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   RealBoard := generateBoard(2, 3);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
end main;
