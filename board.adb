package body Board is

   procedure DumpBoard(Board : Array2D) is
   begin
      for i in Col loop
          Put("| ");
          for j in Line loop
              Put(Status'Image (Board (i, j)));
               Put(" | ");
          end loop;
          New_Line;
      end loop;
   end DumpBoard;

   function generateBoard(c : Col; l : Line) return Array2D is
       Board : Array2D := ((3, 2, 3, 1), (5, 1, 2, 0), (5, 1, 2, 2), (5, 1, 2, 1));
   begin
       return Board;
   end generateBoard;

end Board;
