package body Game is

    -- Click on the board at (Userclick_x, Userclick_y)
    function clickBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D :=  copyBoard(UserBoard);
        discoverBoard : Array2D;
    begin
        Put("[USERCLICK]"); New_Line;



        Put("[GENERATE DISCOVER BOARD]"); New_Line;
        discoverBoard := discoverZone(NewUserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
        -- DumpBoard(discoverBoard);

        -- MERGE DISCOVER BOARD WITH USER BOARD
        Put("[GENERATE USER BOARD]"); New_Line;
        for i in Line loop
            for j in Col loop
                if discoverBoard(j, i) = 1 then
                    NewUserBoard(j, i) := MineBoard (j, i);
                end if;
            end loop;
        end loop;


        return NewUserBoard;
    end clickBoard;

    -- Right click on the board at (Userclick_x, Userclick_y)
    function setFlag(UserBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        if UserBoard(Userclick_x, Userclick_y) = -1 then
            NewUserBoard(Userclick_x, Userclick_y) := 9;
        else
            Put("THIS CELL IS ALREADY DISCOVER"); New_Line;
        end if;
        return NewUserBoard;
    end setFlag;

    -- Count number of flag put in the board
    function countFlag(UserBoard : Array2D) return Integer is
        sum : Integer := 0;
    begin
        for i in Line loop
            for j in Col loop
                if UserBoard(j, i) = 9 then
                    sum := sum + 1;
                end if;
            end loop;
        end loop;
        return sum;
    end countFlag;

    -- Count number of discover cell in the board
    function countUndiscoverCell(UserBoard : Array2D) return Integer is
        sum : Integer := 0;
    begin
        for i in Line loop
            for j in Col loop
                if UserBoard(j, i) = -1 or UserBoard(j, i) = 9 then
                    sum := sum + 1;
                end if;
            end loop;
        end loop;
        return sum;
    end countUndiscoverCell;

    -- Discovering (Pos_x, Pos_y) for each different cases
    function discoverZone(UserBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewUserBoard : Array2D :=  copyBoard(UserBoard);
    begin
        if not checkCoord(Pos_x, Pos_y) then
            --Put("PAF LE MUR"); New_Line;
            return NewUserBoard;
        end if;

        if UserBoard(Pos_x, Pos_y) = 1 then
            --Put("DEFA FAIT"); New_Line;
            return NewUserBoard;
        end if;

        if UserBoard(Pos_x, Pos_y) = 2 then
            --Put("IL Y A UN FLAG J'OUVRE PAS ÇA T OUF"); New_Line;
            return NewUserBoard;
        end if;

            -- IF SAFE ZONE (0 mines)
        if MineBoard(Pos_x, Pos_y) = 0 then
                NewUserBoard := discoverSafeZone(NewUserBoard, RealBoard, MineBoard, Pos_x, Pos_y);
                return NewUserBoard;
        end if;

            -- IF NUMBER OR BOMB
        NewUserBoard(Pos_x, Pos_y) := 1;

        return NewUserBoard;
    end discoverZone;

    -- Sub function for discovering (Pos_x, Pos_y) with 0 mines around
    function discoverSafeZone(DiscoverBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewDiscoverBoard : Array2D := copyBoard(DiscoverBoard);
        type Pos_Neighboors_Index is range 0 .. 7;
        type Pos_Neighboors is array (Pos_Neighboors_Index) of Integer;
        Pos_x_Neighboors : Pos_Neighboors := (1, 1, 1, -1, -1, -1, 0, 0);
        Pos_y_Neighboors : Pos_Neighboors := (1, -1, 0, 1, -1, 0, 1, -1);
    begin
        -- Discover current point
        NewDiscoverBoard(Pos_x, Pos_y) := 1;
        for i in Pos_Neighboors_Index loop
            -- Recursion with discoverZone on neighboors
            NewDiscoverBoard := discoverZone(NewDiscoverBoard, RealBoard, MineBoard, Pos_x + Pos_x_Neighboors(i), Pos_y + Pos_y_Neighboors(i));
        end loop;
        return NewDiscoverBoard;
   end discoverSafeZone;

   function Is_Numeric (Item : in String) return Boolean is
      Dummy : Float;
   begin
      Dummy := Float'Value (Item);
      return True;
   exception
      when others =>
         return False;
   end Is_Numeric;

   function gameLoop(UserBoard, RealBoard, MineBoard : Array2D) return Integer is
      GameStatus : Integer := 0;
      Userclick_x, Userclick_y : Integer;  UserOpId : Integer;
      NewUserBoard : Array2D := copyBoard(UserBoard);
   begin
      while GameStatus = 0 loop
         Put("Mines Remaining: "); Put(MinesNumber - countFlag(NewUserBoard)); New_Line;
         --Put(" | Number of Undiscover Cell: "); Put(countUndiscoverCell(NewUserBoard)); New_Line;

         Userclick_x := -1; Userclick_y := -1; UserOpId := -1;

         while UserOpId /= 1 and UserOpId /= 2 loop
            Put("FLAG(1) or DISCOVER(2) a cell ? "); Get(UserOpId, 2); Skip_Line;
         end loop;

         while not (Userclick_x >= 0 and Userclick_x < Width) loop
            Put ("X: "); Get(Userclick_x, 2); Skip_Line;
         end loop;

         while not (Userclick_y >= 0 and Userclick_y < Height) loop
            Put ("Y: "); Get(Userclick_y, 2); Skip_Line;
         end loop;


         if UserOpId = 1 then
            -- USER WANT TO FLAG A CELL
            NewUserBoard := setFlag(NewUserBoard, Userclick_x, Userclick_y);
         elsif UserOpId = 2 and RealBoard(Userclick_x, Userclick_y) = 1 then
             -- CHECK IF USER CLICK ON A MINE (LOSE THE GAME)
            DumpBoard (NewUserBoard);
            GameStatus := 2;
            -- DUMP GTK ?
            exit;
         elsif UserOpId = 2 then
            -- USER WANT To DISCOVER A CELL
            NewUserBoard := clickBoard(NewUserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
         else
            Put("ERROR UserOpId Parsing");
         end if;

         if countUndiscoverCell(NewUserBoard) = MinesNumber then
            -- CHECK IF USER WIN
            DumpBoard(NewUserBoard);
            GameStatus := 1;
            -- DUMP GTK ?
         else
            DumpBoard (NewUserBoard);
         end if;
      end loop;

      return GameStatus;
   end gameLoop;
end Game;
