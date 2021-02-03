package body Game is
    function generateUserBoard return Array2D is
        Board : Array2D := ((others => (others => 0)));
    begin
        Put("[GENERATE USER BOARD]"); New_Line;
        return Board;
    end generateUserBoard;

    function updateUserBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D :=  copyBoard(UserBoard);
    begin
        --Put("[UPDATE USER BOARD]"); New_Line;

        if not checkCoord(Userclick_x, Userclick_y) then
            Put("PAF LE MUR"); New_Line;
            return NewUserBoard;
        end if;

        if NewUserBoard(Userclick_x, Userclick_y) = 1 then
            Put("DEFA FAIT"); New_Line;
            return NewUserBoard;
        end if;

            -- IF FREE ZONE
        if MineBoard(Userclick_x, Userclick_y) = 0 then
                NewUserBoard := DiscoverFreeZone(NewUserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);
                return NewUserBoard;
        end if;

            -- IF NUMBER OR BOMB
        NewUserBoard(Userclick_x, Userclick_y) := 1;

        return NewUserBoard;
    end updateUserBoard;

    function DiscoverFreeZone(DiscoverBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewDiscoverBoard : Array2D :=  ((others => (others => 0)));
        type Pos_Neighboors_Index is range 0 .. 7;
        type Pos_Neighboors is array (Pos_Neighboors_Index) of Integer;
        Pos_x_Neighboors : Pos_Neighboors := (1, 1, 1, -1, -1, -1, 0, 0);
        Pos_y_Neighboors : Pos_Neighboors := (1, -1, 0, 1, -1, 0, 1, -1);
    begin
        Put("[DISCOVER FREE ZONE]"); New_Line;

        NewDiscoverBoard := copyBoard(DiscoverBoard);
        NewDiscoverBoard(Pos_x, Pos_y) := 1;

        for i in Pos_Neighboors_Index loop
            -- Put("RECURSIF ON A NEW CELL "); Put("x:"); put(Pos_x + Pos_x_Neighboors(i)); Put(" | y:"); put(Pos_y + Pos_y_Neighboors(i)); New_Line;

            NewDiscoverBoard := updateUserBoard(NewDiscoverBoard, RealBoard, MineBoard, Pos_x + Pos_x_Neighboors(i), Pos_y + Pos_y_Neighboors(i));

        end loop;


         --DiscoverFreeZone
        return NewDiscoverBoard;
    end DiscoverFreeZone;

    function setFlag(UserBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        NewUserBoard(Pos_x, Pos_y) := 8;
        return NewUserBoard;
    end setFlag;
end Game;
