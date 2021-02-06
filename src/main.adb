

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with Board; use Board;
with Game; use Game;
with Display; use Display;


procedure Main is
   RealBoard, MineBoard, UserBoard : Array2D;
   GameStatus : Integer:= 0;
   Userclick_x : Integer; Userclick_y : Integer;

   subtype Col is Integer range 0 .. Width - 1;
   subtype Line is Integer range 0 .. Height - 1;
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   UserBoard := generateUserBoard(-1);
   DumpBoard (UserBoard);

   initGTK(UserBoard);
   DumpGTK(UserBoard);

   Userclick_x := 2; Userclick_y := 3; Put_Line("Userclick_x: ");
   Get(Userclick_x, 2); Skip_Line;
   Put_Line("Userclick_y: "); Get(Userclick_y, 2); Skip_Line;
   --   Userclick_x := 3; Userclick_y := 3;
   Put("Userclick_x: "); Put(Userclick_x); Put("| Userclick_y: "); Put(Userclick_y); New_Line;
   RealBoard := generateBoard(Userclick_x, Userclick_y);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
   UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);

   -- USER WANT TO FLAG A CELL
   Put_Line("FLAG Userclick_x: "); Get(Userclick_x, 2); Skip_Line;
   Put_Line("FLAG Userclick_y: "); Get(Userclick_y, 2); Skip_Line;
   --Userclick_x := 3;
   --Userclick_y := 3;

   Put("FLAG Userclick_x: "); Put(Userclick_x); Put("| FLAG Userclick_y: "); Put(Userclick_y); New_Line;
   UserBoard := setFlag(UserBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);



   GameStatus := gameLoop(UserBoard, RealBoard, MineBoard);

   if GameStatus = 1 then
       Put("******* WIN ********"); New_Line;
   else
       Put("****** PERDU *******"); New_Line;

      end if;
end Main;
