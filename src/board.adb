

package body Board is
   -- PRINT THE CONSOLE BOARD
   procedure DumpBoard(Board : Array2D) is
   begin
      for i in 0 .. Width loop
          Put("--");
      end loop;
      New_Line;

      for i in Line loop
          Put("");
          for j in Col loop
              Put(Integer'Image (Board (j, i)));
          end loop;
          New_Line;
      end loop;

      for i in 0 .. Width loop
          Put("--");
      end loop;
      New_Line;
   end DumpBoard;

   function copyBoard(Board : Array2D) return Array2D is
       NewBoard : Array2D;
   begin
       for i in Line loop
           for j in Col loop
               NewBoard(j, i) := Board(j, i);
           end loop;
       end loop;
       return NewBoard;
   end copyBoard;




   -- GENERATE THE BOARD WITH THE FIRST CLICK POSITION OF THE USER
   function generateBoard(Userclick_x : Col; Userclick_y : Line) return Array2D is
       Board : Array2D := ((others => (others => 0)));
       Pos_x, Pos_y, Diff_x, Diff_y : Integer;
   begin
       put("[GENERATE BOARD]"); New_Line;
       Board (Userclick_x, Userclick_y) := 2;
       for i in 0 .. MinesNumber loop
            Pos_x := generateRandom(Width - 1);
            Pos_y := generateRandom(Height - 1);
            Diff_x := abs (Userclick_x - Pos_x);
            Diff_y := abs (Userclick_y - Pos_y);

            --Put("x:"); put(Pos_x); Put(" | y:"); put(Pos_y);
            --Put(" | x:"); put(Diff_x); Put(" | y:"); put(Diff_y);New_Line;

            while Board (Pos_x, Pos_y) = 1 or (Diff_x <= 1 and Diff_y <= 1) loop
                Pos_x := generateRandom(Width - 1);
                Pos_y := generateRandom(Height - 1);
                Diff_x := abs (Userclick_x - Pos_x);
                Diff_y := abs (Userclick_y - Pos_y);
            end loop;

            Board (Pos_x, Pos_y) := 1;
       end loop;

       return Board;
   end generateBoard;

   -- GENERATE BOARD WITH DISTANCE FROM EACH Mine
   function generateMineBoard(Board : Array2D) return Array2D is
       MineBoard : Array2D;
   begin
       put("[GENERATE MINES BOARD]"); New_Line;

       for i in Line loop
           for j in Col loop
               MineBoard (j, i) := getMineCount(Board, j, i);
           end loop;
       end loop;

       return MineBoard;
   end generateMineBoard;

   -- GET DISTANCE
   function getMineCount(Board : Array2D; Pos_x : Col ; Pos_y : Line) return Integer is
       Sum : Integer := 0;
   begin
       Sum := Sum + checkMine(Board, Pos_x + 1, Pos_y + 1);
       Sum := Sum + checkMine(Board, Pos_x + 1, Pos_y - 1);
       Sum := Sum + checkMine(Board, Pos_x - 1, Pos_y + 1);
       Sum := Sum + checkMine(Board, Pos_x - 1, Pos_y - 1);
       Sum := Sum + checkMine(Board, Pos_x + 1, Pos_y);
       Sum := Sum + checkMine(Board, Pos_x - 1, Pos_y);
       Sum := Sum + checkMine(Board, Pos_x, Pos_y - 1);
       Sum := Sum + checkMine(Board, Pos_x, Pos_y + 1);

       return Sum;
   end getMineCount;

   function checkMine(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Integer is
       Sum : Integer := 0;
   begin
       if checkCoord(Board, Pos_x, Pos_y) then
           if Board(Pos_x, Pos_y) = 1 then
               return 1;
           else
               return 0;
           end if;
       else
           return 0;
       end if;
   end checkMine;

   function checkCoord(Board : Array2D; Pos_x : Integer ; Pos_y : Integer) return Boolean is
   begin
       if Pos_x < 0 or Pos_y < 0 or Pos_x >= Width or Pos_y >= Height then
           return False;
       else
           return True;
       end if;
   end checkCoord;


   -- GENERATE RANDOM WITH RANGE
   function generateRandom(Size : Integer) return Integer is
       subtype Rand_Range is Integer range 0 .. Size;
       package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
       use Rand_Int;
       gen : Rand_Int.Generator;
       ret_val: Rand_Range;
   begin
       Rand_Int.Reset(gen);
       ret_val := Random(gen);
       return ret_val;
   end generateRandom;

end Board;
