with Ada.Text_IO; use Ada.Text_IO;


package Display is

    type Status is range 0 .. 5;
    type Col is range 1 .. 4;
    type Line is range 1 .. 4;
    type Array2D is array (Col, Line) of Status;
    Board : Array2D := ((3, 2, 3, 1), (5, 1, 2, 0), (5, 1, 2, 2), (5, 1, 2, 1));

   procedure DumpBoard(Board : Array2D);

end Display;
