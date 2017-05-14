class Board
    attr_accessor :board, :winner_of_game #attr_accessor turn instance variable into instance method ( like @ no longer required ) in the class definition.

    def initialize(size)
        @board = Array.new((size * size), "") #simply returning instance variable @board

        @winner_of_game = nil
    end

    def set_position(position, marker)  
       @board[position] = marker  
    end

    def check_position?(position)
        if @board[position] == ""
            true
        else
            false   #return false for the free position
        end
    end
    def check_full?()  
        @board.count("") == 0 
    end
    def stub_winner? #check if player won the game
        winner = false
        win_array = [[0, 1, 2, 3],[4, 5, 6, 7],[8, 9, 10, 11],[12, 13, 14, 15],[0, 4, 8, 12],[1, 5, 9, 13],[2, 6, 10, 14],[3, 7, 11, 15],[0, 5, 10, 15],[3, 6, 9, 12]]
        win_array.each do |index|
            x_counter = 0
            o_counter = 0
            index.each do |index_check|
                if @board[index_check] == "x"  #check for X in board
                    x_counter += 1
                elsif @board[index_check] == "o" #check for O in board
                    o_counter += 1
                end
                if x_counter == 4
                    @winner_of_game = "x"
                    winner = true
                elsif o_counter == 4
                    @winner_of_game = "o"
                    winner = true
                end
            end
        end
        return winner 
    end
    def tie #when game has full board marked and has no winner 
        stub_winner? == false && check_full? == true  
    end
end
# board = Board.new
# board.set_position(1,"x")
# p board.board 