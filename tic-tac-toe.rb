class Board
  attr_accessor :arr
  def initialize
    @arr = Array.new(3) {Array.new(3)}
  end

  def print_board
    puts "    #{@arr[0][0]}    |     #{@arr[1][0]}    |     #{@arr[2][0]}"
    puts '-----------------------------'
    puts "    #{@arr[0][1]}    |     #{@arr[1][1]}    |     #{@arr[2][1]}"
    puts '-----------------------------'
    puts "    #{@arr[0][2]}    |     #{@arr[1][2]}    |     #{@arr[2][2]}"
  end

  def update_board(row,col,symbol)
    @arr[row][col] = symbol
    print_board
  end
end

class Player
  attr_reader :symbol
  attr_accessor :moves_array
  def initialize(symbol)
    @symbol = symbol
    @moves_array = Array.new(8,0)
  end

  def update_array(row,col)
    if row==0
      @moves_array[0] += 1

      if col==0
        @moves_array[3] += 1
        @moves_array[6] += 1
      elsif col==1
        @moves_array[4] += 1
      elsif col==2
        @moves_array[5] += 1
      end
      
    elsif row==1
      @moves_array[1] += 1
      
      if col==0
        @moves_array[3] += 1
      elsif col==1
        @moves_array[4] += 1
        @moves_array[6] += 1
        @moves_array[7] += 1
      elsif col==2
        @moves_array[5] += 1
      end
      
    elsif row==2
      @moves_array[2] += 1

      if col==0
        @moves_array[3] += 1
        @moves_array[7] += 1
      elsif col==1
        @moves_array[4] += 1
      elsif col==2
        @moves_array[5] += 1
        @moves_array[6] += 1
      end
    end
  end
  
end
    

class Game
  def initialize
    @move_count = 0
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
    @move_count = 0
  end

  def start_game
    @board.print_board
    while(!game_end?)
      row = gets.chomp.to_i
      col = gets.chomp.to_i
      update_game(row,col)
    end
  end

  def update_game(row,col)
    if @move_count % 2 == 0
      @board.update_board(row,col,@player1.symbol)
      @player1.update_array(row,col)
    else
      @board.update_board(row,col,@player2.symbol)
      @player2.update_array(row,col)    
    end
    @move_count += 1
  end

  def game_end?
    if @player1.moves_array.include?(3)
      p 'Player 1 wins'
      return true
    elsif @player2.moves_array.include?(3)
      p 'Player 2 wins'
      return true
    elsif @move_count == 9
      p 'Draw'
      return true
    else
      return false
    end
  end
  
end

game = Game.new
game.start_game