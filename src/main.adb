with Ada.Text_IO; use Ada.Text_IO;
with Board; use Board;
with Game; use Game;

procedure main is
    RealBoard, MineBoard, UserBoard : Array2D;
    Userclick_x : Integer; Userclick_y : Integer;
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   Userclick_x := 2; Userclick_y := 3;
   RealBoard := generateBoard(Userclick_x, Userclick_y);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
   UserBoard := generateUserBoard(RealBoard, MineBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);


end main;
