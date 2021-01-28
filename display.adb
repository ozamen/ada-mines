package body Display is

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

end Display;
