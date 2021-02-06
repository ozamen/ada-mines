

package body Display is
   -- INIT GTK
   procedure initGTK(UserBoard : Array2D) is
   begin
      Put("INIT GTK");

      --Win    : Gtk_Window;
   --img    : Gtk_Image;
   --pixbuf : Gdk_Pixbuf;
   --vbox   : Gtk_Vbox;
   --hbox   : Gtk_Hbox;
   --err    : GError;
   --button : Gtk_Button;
   --table  : Gtk_Table;

   --function Delete_Event_Cb
   --(Self  : access Gtk_Widget_Record'Class;
   --Event : Gdk.Event.Gdk_Event)
   --   return Boolean;

   ---------------------
   -- Delete_Event_Cb --
   ---------------------

   --function Delete_Event_Cb
    --(Self  : access Gtk_Widget_Record'Class;
     --Event : Gdk.Event.Gdk_Event)
     --return Boolean
   --is
      --pragma Unreferenced (Self, Event);
   --begin
      --Gtk.Main.Main_Quit;
      --return True;
   --end Delete_Event_Cb;


   --Initialize GtkAda.
   --Gtk.Main.Init;

   --Create a window with a size of 400x400
   --Gtk_New (Win);
   --Set_Title (Win, "Ada Minesweeper - OZAMEN");
   --Win.Set_Default_Size (250, 250);
   --  Create a box to organize vertically the contents of the window

   --Gtk_New_Vbox (vbox);
   --Win.Add (vbox);

   --Gtk_New(button);
   --button.Set_Size_Request(16, 16);
   --Box.add(button);
   --table := Gtk_Table_New(10, 10, False);
   --table.Set_Col_Spacings(0);
   --table.Set_Row_Spacings(0);

   --vbox.add(table);


   --for i in Integer range 1 .. 10 loop
      --Gtk_New_Hbox (hbox);
     -- for j in Integer range 1 .. 10 loop

         --Gdk_New_From_File(pixbuf, "flag.jpg", err );
       --  pixbuf := scale_simple(pixbuf, 25 , 25);


         --Gtk_New (img, pixbuf);
         --Table.Attach_Defaults(img, Guint(i - 1), Guint(i), Guint(j-1), Guint(j));

         --hbox.Add (img);
     -- end loop;
      --vbox.Add (hbox);
   --end loop;



   --for i in Line loop
     -- Put(i); Put("|");
      --for j in Col loop
        -- if RealBoard(j, i) = 1 then
         --Put(Integer'Image (Board (j, i)));

          --Gdk_New_From_File(pixbuf, "flag.jpg", err );
         --pixbuf := scale_simple(pixbuf, 25 , 25);


         --Gtk_New (img, pixbuf);
         --Table.Attach_Defaults(img, Guint(i), Guint(i + 1), Guint(j), Guint(j + 1));
         --end if;
      --end loop;
      --New_Line;
      --end loop;





   -- Stop the Gtk process when closing the window
   --Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

   --  Show the window and present it
   --Win.Show_All;
   --Win.Present;

   --Start the Gtk+ main loop
   --Gtk.Main.Main;
   --end if;

   end initGTK;

   -- DUMP GTK WINDOW
   procedure DumpGTK(UserBoard : Array2D) is
   begin
      Put("DUMP GTK WINDOW");
      for i in Line loop
         for j in Col loop
             Put(Integer'Image (UserBoard (j, i)));
         end loop;
         New_Line;
      end loop;
   end DumpGTK;


end Display;
