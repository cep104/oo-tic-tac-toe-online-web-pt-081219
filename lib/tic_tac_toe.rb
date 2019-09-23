class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [

    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left col
    [1,4,7],  # Middle col
    [2,5,8],  # Right col
    [0,4,8],  # Diagnol 1
    [2,4,6]  # Diagnol 2
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end

  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  
  def move(index, token = "X")
    @board[index] = token
  end

 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

 


    def turn
    puts "please enter a number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end
  
  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end
  
  def full?
    !@board.any?{|x| x == "" || x == " "}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

def play
    @board
    turn until over?
    won? ? puts("You Win!") : puts("Tie!")
    puts "Would you like to play again? (Y or N)"
    if gets.chomp.downcase == "y"
    play
  else
   puts "Goodbye"
  end
end



end




