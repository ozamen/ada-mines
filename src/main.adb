with Gdk.Event;       use Gdk.Event;
with Gtk.Box;         use Gtk.Box;
with Gtk.Table;       use Gtk.Table;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Button;      use Gtk.Button;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;
with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Glib; use Glib;

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;
with Board; use Board;
with Game; use Game;


procedure Main is
   RealBoard, MineBoard, UserBoard : Array2D;
   GameStatus : Integer:= 0;
   Userclick_x : Integer; Userclick_y : Integer;
   Win    : Gtk_Window;
   img    : Gtk_Image;
   pixbuf : Gdk_Pixbuf;
   vbox   : Gtk_Vbox;
   hbox   : Gtk_Hbox;
   err    : GError;
   button : Gtk_Button;
   table  : Gtk_Table;

    subtype Col is Integer range 0 .. Width - 1;
    subtype Line is Integer range 0 .. Height - 1;

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

   UserBoard := generateUserBoard(-1);
   DumpBoard (UserBoard);

   -- ASK TO CLICK WHEREVER THE USER WANTS
   -- Userclick_x := 2; Userclick_y := 3;
   --Put_Line("Userclick_x: ");
   --Get(Userclick_x, 2);
   --Skip_Line;
   --Put_Line("Userclick_y: ");
   --Get(Userclick_y, 2);
   --Skip_Line;
      Userclick_x := 3;
   Userclick_y := 3;
   Put("Userclick_x: "); Put(Userclick_x); Put("| Userclick_y: "); Put(Userclick_y); New_Line;
   RealBoard := generateBoard(Userclick_x, Userclick_y);
   DumpBoard (RealBoard);
   MineBoard := generateMineBoard(RealBoard);
   DumpBoard (MineBoard);
   UserBoard := clickBoard(UserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);

   -- USER WANT TO FLAG A CELL
   Put_Line("FLAG Userclick_x: ");
   --Get(Userclick_x, 2);
   --Skip_Line;
   --Put_Line("FLAG Userclick_y: ");
   --Get(Userclick_y, 2);
   --Skip_Line;
   Userclick_x := 3;
   Userclick_y := 3;

   Put("FLAG Userclick_x: "); Put(Userclick_x); Put("| FLAG Userclick_y: "); Put(Userclick_y); New_Line;
   UserBoard := setFlag(UserBoard, Userclick_x, Userclick_y);
   DumpBoard (UserBoard);




   --Initialize GtkAda.
   Gtk.Main.Init;

   --Create a window with a size of 400x400
   Gtk_New (Win);
   Set_Title (Win, "Ada Minesweeper - OZAMEN");
   Win.Set_Default_Size (250, 250);
   --  Create a box to organize vertically the contents of the window

   Gtk_New_Vbox (vbox);
   Win.Add (vbox);

   --Gtk_New(button);
   --button.Set_Size_Request(16, 16);
   --Box.add(button);
   table := Gtk_Table_New(10, 10, False);
   table.Set_Col_Spacings(0);
   table.Set_Row_Spacings(0);

   vbox.add(table);

   if 0 = 1 then
   for i in Integer range 1 .. 10 loop
      --Gtk_New_Hbox (hbox);
      for j in Integer range 1 .. 10 loop

         Gdk_New_From_File(pixbuf, "flag.jpg", err );
         pixbuf := scale_simple(pixbuf, 25 , 25);


         Gtk_New (img, pixbuf);
         Table.Attach_Defaults(img, Guint(i - 1), Guint(i), Guint(j-1), Guint(j));

         --hbox.Add (img);
      end loop;
      --vbox.Add (hbox);
      end loop;
      end if;


   for i in Line loop
      Put(i); Put("|");
      for j in Col loop
         if RealBoard(j, i) = 1 then
         --Put(Integer'Image (Board (j, i)));

          Gdk_New_From_File(pixbuf, "flag.jpg", err );
         pixbuf := scale_simple(pixbuf, 25 , 25);


         Gtk_New (img, pixbuf);
         Table.Attach_Defaults(img, Guint(i), Guint(i + 1), Guint(j), Guint(j + 1));
         end if;
      end loop;
      New_Line;
   end loop;



   -- Stop the Gtk process when closing the window
   Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --  Show the window and present it
   Win.Show_All;
   Win.Present;

   --Start the Gtk+ main loop
   Gtk.Main.Main;





      if 0 = 1 then
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

      end if;




    --USER WANT TO CLICK ON 1, 0
   --UserBoard := updateUserBoard(UserBoard, RealBoard, MineBoard, 1, 0);
   --DumpBoard (UserBoard);


end Main;
