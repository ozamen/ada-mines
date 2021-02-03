package body Game is

    -- Click on the board at (Userclick_x, Userclick_y)
    function clickBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D :=  copyBoard(UserBoard);
    begin
        Put("[CLICK BOARD]"); New_Line;
        NewUserBoard := discoverZone(NewUserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
        return NewUserBoard;
    end clickBoard;

    -- Right click on the board at (Userclick_x, Userclick_y)
    function setFlag(UserBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        if UserBoard(Userclick_x, Userclick_y) = 0 then
            NewUserBoard(Userclick_x, Userclick_y) := 2;
        else
            Put("C PAS UNE CASE FERMÉ T OUF"); New_Line;
        end if;
        return NewUserBoard;
    end setFlag;

    -- Discovering (Pos_x, Pos_y) for each different cases
    function discoverZone(UserBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewUserBoard : Array2D :=  copyBoard(UserBoard);
    begin
        if not checkCoord(Pos_x, Pos_y) then
            Put("PAF LE MUR"); New_Line;
            return NewUserBoard;
        end if;

        if UserBoard(Pos_x, Pos_y) = 1 then
            Put("DEFA FAIT"); New_Line;
            return NewUserBoard;
        end if;

        if UserBoard(Pos_x, Pos_y) = 2 then
            Put("IL Y A UN FLAG J'OUVRE PAS ÇA T OUF"); New_Line;
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
end Game;
