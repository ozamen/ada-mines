

package body Display is

   function on_click(em : access Gtk_Event_Box_Record'class; ev : Gdk_Event)
     return Boolean;

      function on_click(em : access Gtk_Event_Box_Record'class; ev : Gdk_Event)
     return Boolean
   is
   begin
      put("stp marche frrrr");
      return True;
   end on_click;

   -- INIT GTK
   procedure initGTK(UserBoard : Array2D) is
      Win    : Gtk_Window;
      img    : Gtk_Image;
      pixbuf : Gdk_Pixbuf;
      vbox   : Gtk_Vbox;
      err    : GError;
      table  : Gtk_Table;
      ev_box : Gtk_Event_Box;

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
      Put("INIT GTK");

      --Initialize GtkAda.
      Gtk.Main.Init;

      Gtk_New (Win);
      Set_Title (Win, "Ada Minesweeper - OZAMEN");
      Win.Set_Default_Size (250, 250);

      Gtk_New(ev_box);
      win.add(ev_box);

      Gtk_New_Vbox (vbox);
      ev_box.Add (vbox);

      table := Gtk_Table_New(10, 10, False);
      table.Set_Col_Spacings(0);
      table.Set_Row_Spacings(0);

      vbox.add(table);

      Connect(ev_box, "button-press-event", To_Marshaller(on_click'Access));

      for i in Integer range 0 .. 9 loop
         for j in Integer range 0 .. 9 loop
            if UserBoard(j, i) = -1 then
               Gdk_New_From_File(pixbuf, "icons/not_disco.png", err );
            end if;
            if UserBoard(j, i) = 1 then
               Gdk_New_From_File(pixbuf, "icons/1.png", err );
            end if;
            pixbuf := scale_simple(pixbuf, 25 , 25);


            Gtk_New (img, pixbuf);
            Table.Attach_Defaults(img, Guint(i), Guint(i+1), Guint(j), Guint(j+1));

         end loop;
      end loop;



      --Stop the Gtk process when closing the window
      Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

      -- Show the window and present it
      Win.Show_All;
      Win.Present;

      --Start the Gtk+ main loop

      Gtk.Main.Main;

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
