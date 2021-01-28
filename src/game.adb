package body Game is
    function generateUserBoard return Array2D is
        Board : Array2D := ((others => (others => 0)));
    begin
        Put("[GENERATE USER BOARD]"); New_Line;
        return Board;
    end generateUserBoard;

    function updateUserBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x, Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
        DiscoverBoard : Array2D :=  ((others => (others => 0)));
    begin
        Put("[UPDATE USER BOARD]"); New_Line;

        DiscoverBoard := DiscoverFreeZone(DiscoverBoard, NewUserBoard, RealBoard, MineBoard, Userclick_x, Userclick_y);

        return NewUserBoard;
    end updateUserBoard;

    function DiscoverFreeZone(DiscoverBoard, UserBoard, RealBoard, MineBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewDiscoverBoard : Array2D :=  ((others => (others => 0)));
        type Pos_Neighboors_Index is range 0 .. 7;
        type Pos_Neighboors is array (Pos_Neighboors_Index) of Integer;
        Pos_x_Neighboors : Pos_Neighboors := (1, 1, 1, -1, -1, -1, 0, 0);
        Pos_y_Neighboors : Pos_Neighboors := (1, -1, 0, 1, -1, 0, 1, -1);
    begin
        Put("[DISCOVER FREE ZONE]"); New_Line;

        if not checkCoord(Pos_x, Pos_y) or DiscoverBoard(Pos_x, Pos_y) > 0 or MineBoard(Pos_x, Pos_y) > 0 or Pos_x < 0 or Pos_x >= Width or Pos_y < 0 or Pos_y >= Height then
            Put("PAF LE MUR OU PAS BLANC OU DEJA FAIS "); New_Line;
            return DiscoverBoard;
        else
            for i in Pos_Neighboors_Index loop
                Put("RECURSIF ON A NEW WHITE CELL "); Put("x:"); put(Pos_x); Put(" | y:"); put(Pos_y); New_Line;

                NewDiscoverBoard :=
                    mergeDiscoverBoard(NewDiscoverBoard,
                                   DiscoverFreeZone(DiscoverBoard,
                                                    UserBoard,
                                                    RealBoard,
                                                    MineBoard,
                                                    Pos_x + Pos_x_Neighboors(i),
                                                    Pos_y + Pos_y_Neighboors(i)
                                    )
                    );

            end loop;


             --DiscoverFreeZone
            return NewDiscoverBoard;
        end if;
    end DiscoverFreeZone;

    function mergeDiscoverBoard(DiscoverBoard_1, DiscoverBoard_2 : Array2D) return Array2D is
        NewDiscoverBoard : Array2D;
        subtype Col is Integer range 0 .. Width - 1;
        subtype Line is Integer range 0 .. Height - 1;
    begin
        for i in Col loop
            for j in Line loop
                if DiscoverBoard_1(j, i) > 0 or DiscoverBoard_2(j, i) > 0 then
                    NewDiscoverBoard(j, i) := 1;
                else
                    NewDiscoverBoard(j, i) := 0;
                end if;
            end loop;
        end loop;

        return NewDiscoverBoard;
    end mergeDiscoverBoard;



    function setFlag(UserBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        NewUserBoard(Pos_x, Pos_y) := 8;
        return NewUserBoard;
    end setFlag;
end Game;
