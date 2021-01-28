package body Game is
    function generateUserBoard(Board, MineBoard : Array2D; Userclick_x : Integer; Userclick_y : Integer) return Array2D is
    begin
        put("[GENERATE USER BOARD]"); New_Line;
        return Board;
    end generateUserBoard;

end Game;
