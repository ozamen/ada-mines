with Gdk.Event;       use Gdk.Event;
with GTk.Event_Box;   use Gtk.Event_Box;
with Gtk.Handlers;    use Gtk.Handlers;
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
with Ada.Strings.Unbounded; use Ada.Strings.unbounded;





package Display is
   subtype Col is Integer range 0 .. Width - 1;
   subtype Line is Integer range 0 .. Height - 1;

   procedure winGTK(UserBoard : Array2D);
   procedure loseGTK(UserBoard : Array2D; RealBoard : Array2D);

end Display;
