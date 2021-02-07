

package body Display is

   function on_click(em : access Gtk_Event_Box_Record'class; ev : Gdk_Event)
                     return Boolean;

   function on_click(em : access Gtk_Event_Box_Record'class; ev : Gdk_Event)
                        return Boolean
   is
   begin
      put("on_click working");
      return True;
   end on_click;

   -- INIT GTK
   procedure winGTK(UserBoard : Array2D) is
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

      --Connect(ev_box, "button-press-event", To_Marshaller(on_click'Access));

      for j in Integer range 0 .. 9 loop
         for i in Integer range 0 .. 9 loop
            if UserBoard(j, i) = -1 then
               Gdk_New_From_File(pixbuf, "icons/not_disco.png", err );
            elsif UserBoard(j, i) = 0 then
               Gdk_New_From_File(pixbuf, "icons/0.png", err );
            elsif UserBoard(j, i) = 1 then
               Gdk_New_From_File(pixbuf, "icons/1.png", err );
            elsif UserBoard(j, i) = 2 then
               Gdk_New_From_File(pixbuf, "icons/2.png", err );
            elsif UserBoard(j, i) = 3 then
               Gdk_New_From_File(pixbuf, "icons/3.png", err );
            elsif UserBoard(j, i) = 4 then
               Gdk_New_From_File(pixbuf, "icons/4.png", err );
            elsif UserBoard(j, i) = 5 then
               Gdk_New_From_File(pixbuf, "icons/5.png", err );
            elsif UserBoard(j, i) = 6 then
               Gdk_New_From_File(pixbuf, "icons/6.png", err );
            elsif UserBoard(j, i) = 7 then
               Gdk_New_From_File(pixbuf, "icons/7.png", err );
            elsif UserBoard(j, i) = 8 then
               Gdk_New_From_File(pixbuf, "icons/8.png", err);
            elsif UserBoard(j, i) = 9 then
               Gdk_New_From_File(pixbuf, "icons/flagged.png", err );
            end if;

            pixbuf := scale_simple(pixbuf, 25 , 25);
            Gtk_New (img, pixbuf);
            Table.Attach_Defaults(img, Guint(j), Guint(j+1), Guint(i), Guint(i+1));

         end loop;
      end loop;



      --Stop the Gtk process when closing the window
      Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

      -- Show the window and present it
      Win.Show_All;
      Win.Present;

      --Start the Gtk+ main loop

      Gtk.Main.Main;

   end winGTK;

   procedure loseGTK(UserBoard : Array2D; RealBoard : Array2D) is
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

      --Connect(ev_box, "button-press-event", To_Marshaller(on_click'Access));

      for j in Integer range 0 .. 9 loop
         for i in Integer range 0 .. 9 loop
           if RealBoard(j, i) = 1 then
               Gdk_New_From_File(pixbuf, "icons/bomb.png", err );
            elsif UserBoard(j, i) = -1 then
               Gdk_New_From_File(pixbuf, "icons/not_disco.png", err );
            elsif UserBoard(j, i) = 0 then
               Gdk_New_From_File(pixbuf, "icons/0.png", err );
            elsif UserBoard(j, i) = 1 then
               Gdk_New_From_File(pixbuf, "icons/1.png", err );
            elsif UserBoard(j, i) = 2 then
               Gdk_New_From_File(pixbuf, "icons/2.png", err );
            elsif UserBoard(j, i) = 3 then
               Gdk_New_From_File(pixbuf, "icons/3.png", err );
            elsif UserBoard(j, i) = 4 then
               Gdk_New_From_File(pixbuf, "icons/4.png", err );
            elsif UserBoard(j, i) = 5 then
               Gdk_New_From_File(pixbuf, "icons/5.png", err );
            elsif UserBoard(j, i) = 6 then
               Gdk_New_From_File(pixbuf, "icons/6.png", err );
            elsif UserBoard(j, i) = 7 then
               Gdk_New_From_File(pixbuf, "icons/7.png", err );
            elsif UserBoard(j, i) = 8 then
               Gdk_New_From_File(pixbuf, "icons/8.png", err);
            elsif UserBoard(j, i) = 9 then
               Gdk_New_From_File(pixbuf, "icons/flagged.png", err );
            end if;

            pixbuf := scale_simple(pixbuf, 25 , 25);
            Gtk_New (img, pixbuf);
            Table.Attach_Defaults(img, Guint(j), Guint(j+1), Guint(i), Guint(i+1));



         end loop;
      end loop;



      --Stop the Gtk process when closing the window
      Win.On_Delete_Event (Delete_Event_Cb'Unrestricted_Access);

      -- Show the window and present it
      Win.Show_All;
      Win.Present;

      --Start the Gtk+ main loop

      Gtk.Main.Main;

   end loseGTK;



end Display;
