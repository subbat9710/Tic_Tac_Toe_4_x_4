require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_create_4x4_board
		board = Board.new(4)   
        result = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]  
		assert_equal(result, board.board)
	end
    
	def test_2_update_first_position_with_x
		board = Board.new(4)
		board.set_position(0, "x")
		result = ["x", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
		assert_equal(result, board.board)
    end

    def test_o_for_the_ninth_position
		board = Board.new(4)
		board.set_position(0, "x")
		board.set_position(8, "o")
        result = ["x", "", "", "", "", "", "", "", "o", "", "", "", "", "", "", ""]
		assert_equal(result, board.board)
    end

    def test_o_for_the_fifteen_position_and_x_for_first
		board = Board.new(4)
		board.set_position(0, "x")
		board.set_position(14, "o")
		result = ["x", "", "", "", "", "", "", "", "", "", "", "", "", "", "o", ""]
		assert_equal(result, board.board)
    end

    def test_for_x_for_the_fifteenth_position_o_at_fifth
		board = Board.new(4)
        board.board = ["x", "", "", "", "o", "", "", "", "", "", "", "", "", "", "", ""]
		board.set_position(14, "x")
        result = ["x", "", "", "", "o", "", "", "", "", "", "", "", "", "", "x", ""]
		assert_equal(result, board.board)
    end

    def test_for_x_for_the_third_position_o_at_seventh
		board = Board.new(4)
        board.board = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "", "", ""]
		board.set_position(2, "x")
        result = ["x", "", "x", "", "", "", "o", "", "", "", "", "", "", "", "", ""]
		assert_equal(result, board.board)
    end

    def test_for_0_for_fifteenth_position
		board = Board.new(4)
        board.board = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "", "", ""]
		board.set_position(14, "x")
        result = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "", "x", ""]
		assert_equal(result, board.board)
    end

    def test_for_0_for_fourteenth_position
		board = Board.new(4)
        board.board = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "", "", ""]
		board.set_position(13, "x")
        result = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "x", "", ""]
		assert_equal(result, board.board)
	end

    def test_for_spot_already_taken
		board = Board.new(4)
        board.board = ["x", "", "", "", "o", "", "", "", "", "", "", "", "", "", "", ""]
        result = board.check_position?(4)
		assert_equal(false, result)
    end

    def test_for_spot_is_open
		board = Board.new(4)
        board.board = ["x", "", "", "", "", "", "o", "", "", "", "", "", "", "", "", ""]
		result = board.check_position?(3)
		assert_equal(true, result)
    end
    def test_for_all_spot_full
    	board = Board.new(4)
    	board.board = ["x", "o", "x", "x", "o", "x", "x", "x", "x", "x", "o", "x", "x", "o", "x", "x"]
    	result = board.check_full?
    	assert_equal(true, result)
    end
    def test_full_board_equals_game_over
    	board = Board.new(4)
    	board.board = ["x", "o", "o", "o", "o", "x", "x", "x", "x", "x", "o", "x", "x", "o", "x", "x"]
    	result = board.check_full?
        assert_equal(true, result)
    end
 #    def test_board_is_almost_full
 #    	board = Board.new(4)
 #    	board.board = ["x", "x", "o", "o", "o", "", "x", "x", "x"]
 #    	result = board.check_full?
 #    	assert_equal(false, result)
 #    end
 #    def test_empty_board
 #    	board = Board.new(4)
 #    	board.board = ["", "", "", "", "", "", "", "", ""]
 #    	result = board.check_full?
 #    	assert_equal(false, result)
 #    end
 #    def test_for_winner_first_row
 #    	board = Board.new(4)
 #    	board.board = [["x", "x", "x"], ["0", "", "o"], ["x", "o", "x"]]
 #    	result = board.stub_winner?
 #    	assert_equal(true, result)
 #    end
 #    def test_for_winner_second_row
 #    	board = Board.new(4)
 #    	board.board = ["o", "x", "x", "o", "o", "o", "x", "o", "x"]
 #    	result = board.stub_winner?
 #    	assert_equal(true, result)
 #    end
 #    def test_for_winner_third_row
 #    	board = Board.new(4)
 #    	board.board = ["x", "0", "", "0", "", "o", "x", "x", "x"]
 #    	result = board.stub_winner?
 #    	assert_equal(true, result)
 #    end
 #    def test_for_tie
 #    	board = Board.new(4)
 #    	board.board = ["x", "0", "x", "o", "x", "x", "o", "x", "o"]
 #    	result = board.stub_winner?
 #    	assert_equal(true, result)
 #    end
end