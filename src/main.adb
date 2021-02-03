with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;


with Ada.Text_IO; use Ada.Text_IO;
with Board; use Board;
with Game; use Game;


procedure Main is
    RealBoard, MineBoard, UserBoard : Array2D;
    Userclick_x : Integer; Userclick_y : Integer;
   Win   : Gtk_Window;
   Label : Gtk_Label;
   Box   : Gtk_Vbox;

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean;

   ---------------------
   -- Delete_Event_Cb --
   ---------------------

   function Delete_Event_Cb
     (Self  : access Gtk_Widget_Record'Class;
      Event : Gdk.Event.Gdk_Event)
      return Boolean
   is
      pragma Unreferenced (Self, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Delete_Event_Cb;

begin

   Ada.Text_IO.Put_Line ("Welcome to ADA Minesweeper v1.0.0");


   -- ASK TO CLICK WHEREVER THE USER WANTS
   Userclick_x := 2; Userclick_y := 3;
   RealBoard := generateBoard(Userclick_x, Userclick_y);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
   UserBoard := generateUserBoard;
   DumpBoard (UserBoard);

   UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);

   -- USER WANT TO FLAG CELL 2, 4
   --UserBoard := setFlag(UserBoard, 2, 4);
   --DumpBoard (UserBoard);

   -- USER WANT TO CLICK ON 1, 0
   --UserBoard := updateUserBoard(UserBoard, RealBoard, MineBoard, 1, 0);
   --DumpBoard (UserBoard);


   --  Initialize GtkAda.
   Gtk.Main.Init;

   --  Create a window with a size of 400x400
   Gtk_New (Win);
   Win.Set_Default_Size (500, 500);

   --  Create a box to organize vertically the contents of the window
   Gtk_New_Vbox (Box);
   Win.Add (Box);

   --  Add a label
   Gtk_New (Label, "Hello world.");
   Box.Add (Label);

   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --  Start the Gtk+ main loop
   Gtk.Main.Main;
end Main;
