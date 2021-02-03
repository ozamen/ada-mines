--with Gdk.Event;       use Gdk.Event;

--with Gtk.Box;         use Gtk.Box;
--with Gtk.Label;       use Gtk.Label;
--with Gtk.Widget;      use Gtk.Widget;
--with Gtk.Main;
--with Gtk.Window;      use Gtk.Window;


with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with Board; use Board;
with Game; use Game;


procedure Main is
   RealBoard, MineBoard, UserBoard : Array2D;
   GameStatus : Integer:= 0;
   Userclick_x : Integer; Userclick_y : Integer;
   --Win   : Gtk_Window;
   --Label : Gtk_Label;
   --Box   : Gtk_Vbox;

   --function Delete_Event_Cb
     --(Self  : access Gtk_Widget_Record'Class;
     -- Event : Gdk.Event.Gdk_Event)
      --return Boolean;

   ---------------------
   -- Delete_Event_Cb --
   ---------------------

   --function Delete_Event_Cb
    -- (Self  : access Gtk_Widget_Record'Class;
     -- Event : Gdk.Event.Gdk_Event)
      --return Boolean
   --is
     -- pragma Unreferenced (Self, Event);
 --begin
    --  Gtk.Main.Main_Quit;
     -- return True;
 --end Delete_Event_Cb;

begin

   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");

   UserBoard := generateUserBoard(-1);
   DumpBoard (UserBoard);

   -- ASK TO CLICK WHEREVER THE USER WANTS
   -- Userclick_x := 2; Userclick_y := 3;
   Put_Line("Userclick_x: ");
   Get(Userclick_x, 2);
   Skip_Line;
   Put_Line("Userclick_y: ");
   Get(Userclick_y, 2);
   Skip_Line;
   Put("Userclick_x: "); Put(Userclick_x); Put("| Userclick_y: "); Put(Userclick_y); New_Line;
   RealBoard := generateBoard(Userclick_x, Userclick_y);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
   UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);

   -- USER WANT TO FLAG A CELL
   Put_Line("FLAG Userclick_x: ");
   Get(Userclick_x, 2);
   Skip_Line;
   Put_Line("FLAG Userclick_y: ");
   Get(Userclick_y, 2);
   Skip_Line;
   Put("FLAG Userclick_x: "); Put(Userclick_x); Put("| FLAG Userclick_y: "); Put(Userclick_y); New_Line;
   UserBoard := setFlag(UserBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);

   while GameStatus = 0 loop
       Put("Apparently Mines Remaining: "); Put(MinesNumber - countFlag(UserBoard)); New_Line;
       Put("Number of Flagged Mine: "); Put(countFlaggedMine(UserBoard, RealBoard)); New_Line;

       Put_Line("Userclick_x: ");
       Get(Userclick_x, 2);
       Skip_Line;
       Put_Line("Userclick_y: ");
       Get(Userclick_y, 2);
       Skip_Line;
       Put("Userclick_x: "); Put(Userclick_x); Put("| Userclick_y: "); Put(Userclick_y); New_Line;

       UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
       if UserBoard(0, 0) = 666 then
           GameStatus := 2;
       else
           DumpBoard (UserBoard);
       end if;

       if countFlaggedMine(UserBoard, RealBoard) = MinesNumber then
           GameStatus := 1;
       end if;
   end loop;

   if GameStatus = 1 then
       Put("******* WIN ********"); New_Line;
   else
       Put("****** PERDU *******"); New_Line;
   end if;




   -- USER WANT TO CLICK ON 1, 0
   --UserBoard := updateUserBoard(UserBoard, RealBoard, MineBoard, 1, 0);
   --DumpBoard (UserBoard);


   --  Initialize GtkAda.
   -- Gtk.Main.Init;

   --  Create a window with a size of 400x400
   -- Gtk_New (Win);
   -- Win.Set_Default_Size (500, 500);

   --  Create a box to organize vertically the contents of the window
   -- Gtk_New_Vbox (Box);
   -- Win.Add (Box);

   --  Add a label
   -- Gtk_New (Label, "Hello world.");
   -- Box.Add (Label);

   -- Stop the Gtk process when closing the window
   -- Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --  Show the window and present it
   -- Win.Show_All;
   -- Win.Present;

   --  Start the Gtk+ main loop
   -- Gtk.Main.Main;
end Main;
