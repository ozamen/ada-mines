

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with Board; use Board;
with Game; use Game;
with Display; use Display;


procedure Main is
   RealBoard, MineBoard, UserBoard : Array2D;
   GameStatus : Integer:= 0;
   Userclick_x : Integer := -1; Userclick_y : Integer := -1;

   subtype Col is Integer range 0 .. Width - 1;
   subtype Line is Integer range 0 .. Height - 1;
begin
   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0 - An Ozamen Project");
   New_Line;


   -- GENERATE THE INITIAL USER BOARD
   UserBoard := generateUserBoard(-1);
   DumpBoard (UserBoard);

   -- GRAPHICAL INTERFACE
   --initGTK(UserBoard);
   --DumpGTK(UserBoard);

   -- ASK TO DISCOVER THE FIRST CELL
   while not (Userclick_x >= 0 and Userclick_x < Width) loop
      Put ("X: "); Get(Userclick_x, 2); Skip_Line;
   end loop;
   while not (Userclick_y >= 0 and Userclick_y < Height) loop
      Put ("Y: "); Get(Userclick_y, 2); Skip_Line;
   end loop;

   -- GENERATE THE REAL BOARD : MAPPING ALL THE MINE
   RealBoard := generateBoard(Userclick_x, Userclick_y);

   -- GENERATE THE MINE BOARD : COMPUTING THE NUMBER OF MINE AROUND EACH CELL
   MineBoard := generateMineBoard(RealBoard);

   -- GENERATE THE USER BOARD : THE CLIENT INTERFACE
   UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);

   -- PRINT THE BOARD
   DumpBoard (UserBoard);

   -- START THE GAME LOOP
   GameStatus := gameLoop(UserBoard, RealBoard, MineBoard);

   if GameStatus = 1 then
       Put("           YOU WIN THE GAME! "); New_Line;
   else
       Put("           YOU LOST THE GAME! "); New_Line;
   end if;

end Main;
