package body Game is
    function generateUserBoard return Array2D is
        Board : Array2D := ((others => (others => 0)));
    begin
        Put("[GENERATE USER BOARD]"); New_Line;
        return Board;
    end generateUserBoard;

    function updateUserBoard(UserBoard, RealBoard, MineBoard : Array2D; Userclick_x : Integer; Userclick_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        Put("[UPDATE USER BOARD]"); New_Line;
        
        return NewUserBoard;
    end updateUserBoard;

    function setFlag(UserBoard : Array2D; Pos_x, Pos_y : Integer) return Array2D is
        NewUserBoard : Array2D := copyBoard(UserBoard);
    begin
        NewUserBoard(Pos_x, Pos_y) := 8;
        return NewUserBoard;
    end setFlag;
end Game;
