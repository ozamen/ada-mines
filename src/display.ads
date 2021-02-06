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
with Board; Use Board;

package Display is
   subtype Col is Integer range 0 .. Width - 1;
   subtype Line is Integer range 0 .. Height - 1;

   procedure DumpGTK(UserBoard : Array2D);
   procedure initGTK(UserBoard : Array2D);
end Display;
