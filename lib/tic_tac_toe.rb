require 'pry'

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
  
  # def input_to_index(input)
  #   input.to_i - 1
  #   # takes the users input turns it into an integer 
  #   # and -1 because numbers in ruby count from 0
  # end
  def input_to_index(string)
    @choice = string.to_i-1
   
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
    # does the index exist on the board and is the position taken
  end

#   def valid_move?(input_to_index)
#     !position_taken?(input_to_index) && @board[input_to_index]
    
# end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
    # validation logic, is the position taken? takes in the
    # index and is this index in the board occupied. 
  end

  
  # def move(index, token = "X")
  #   @board[index] = token
    
  #   # takes in an index and a token(default to X)
  #   # takes that boards position and puts the given token
  #   # I am trying to put something in this board at this postion.
  #   # ex. colors = ["Red", nil, "Black"]
  #   #colors[1] = "Yellow" would replace nil
  # end
  def move(input_to_index, player)
    @board[input_to_index] = player
end

 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
    # is the turn count for the board
    # if the remainder of turncount/2 is 0 it's X turn otherwise Os turn
    # ex. 3/2 has a remainder 4/2 wont 
    # it is either Xs turn or Os turn
  end

  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
    # return value is the amount 
    # of occupied spaces by counting the X and O
    #variable called token if token = X or O
  end

 


  #   def turn
  #   puts "please enter a number 1-9:"
  #   input = gets.chomp
  #   index = input_to_index(input)
  #   # have to assign it to a variable because it doesnt automaticly save.
  #   # doesnt change the inheared refrence you have to capture the value
  #   cp = current_player
  #   if valid_move?(index)
  #     move(index, cp)
  #     display_board
  #   else
  #     puts 'that is invalid try again.'
  #     turn
  #     # if move isn't valid go back to the begining of turn and start over
  #   end
  # end
  
  def turn 
        
    choice = gets.chomp.to_i
    
    position = input_to_index(choice)
    if valid_move?(position)
        #player_token = current_player
        move(position, current_player)
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
    #.find{} runs through all the combos and if no combo turns up all Xs or all Os it will return nil
  #since it is a constant it can be passed into the method
  #WIN_COMBINATION is a nested array 

  # if you say WIN_COMBINATION[0] = [1,2,3](static because your only checking wincombination 0)
  
  # need to check the board and see if combo = WIN_COMBINATION[0] = [1,2,3] is a winning combo
  # winning_combo = nil
  # WINNING_COMBINATIONS.each do |combo|
  # position_1 = combo[0]
  # position_2 = combo[1]
  # position_3 = combo[2]
  # if board[positon_1] == 'X' && board[positon_2] == 'X' && board[positon_3] == 'X'
  # winning_combo = combo
  # elsif board[positon_1] == 'O' && board[positon_2] == 'O' && board[positon_3] == 'O'
  # winning_combo = combo
  #end
  #end
  # winning_combo
  # end
  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
    end
  end
  # needs to be dynamic not static 
  # starts off with winning_combo being nil
  #in the event that during the loop no one has a winning combo it still returns nil
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
      # combo for won? is [0,1,2] put is ther an "X"
    else
      nil
    end
  end

def play
    until over?
      turn
    # when do you want to call turn until?
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end



end




