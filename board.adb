

package body Board is
   -- PRINT THE CONSOLE BOARD
   procedure DumpBoard(Board : Array2D) is
   begin
      for i in Line loop
          Put("| ");
          for j in Col loop
              Put(Status'Image (Board (j, i)));
              Put(" | ");
          end loop;
          New_Line;
      end loop;
   end DumpBoard;

   -- GENERATE THE BOARD WITH THE FIRST CLICK POSITION OF THE USER
   function generateBoard(c : Col; l : Line) return Array2D is
       Board : Array2D := ((others => (others => 0)));
       subtype Rand_Range is Integer range 0 .. 10;
       package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
       use Rand_Int;
       gen : Rand_Int.Generator;
       ret_val: Rand_Range;
   begin
       for i in 0 .. 10 loop
            Rand_Int.Reset(gen);
            ret_val := Random(gen);
            Put(ret_val);

            Put(ret_val);
            --Board (ret_val, 3) := 1;
       end loop;

       return Board;
   end generateBoard;

end Board;
