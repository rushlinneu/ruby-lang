class Game
	def initialize
		@player1 = Player.new "player1", "O"
		@player2 = Player.new "player2", "X"
		@board = Board.new
	end

	def play
		currentPlayer = @player1
		puts "To play, each player enter number from 1 to 9"
		puts "The grid taken will be marked by 'O'(player1) and 'X'(player2)"
		puts "When a row or a list or the diagonal is marked by certain player, game over!"

		loop do
			@board.display
			puts "Enter you number, #{currentPlayer}"
			grid = gets.chomp
			if @board.play(currentPlayer, grid.to_i)
				break if @board.win?(currentPlayer)
				if currentPlayer == @player1
					currentPlayer = @player2 
				else
					currentPlayer = @player1
				end
			end
		end

		@board.display
		puts "#{currentPlayer} wins!"
	end
end

class Player
	attr_accessor :name
	attr_reader :symbol # player1 => O, player2 => X

	def initialize(name, s)
		@name = name
		@symbol = s
	end

	def to_s
		name
	end
end

class Board
	def initialize()
		@board = [[1,2,3],
							[4,5,6],
							[7,8,9]
						 ]
	end

	def play(player, grid)
		if grid.between?(1,9)
			@board.each do |row|
				row.each_with_index do |elem, index|
	  			if elem == grid
	  				row[index] = player.symbol 
	  				return true
	  			end
				end
			end
		end
		false
	end

	def display
		@board.each do |row|
			puts row.each {|p| p}.join(" ")
		end
	end

	def win?(player)
		if @board[0].all?{|e| e==player.symbol} ||
			 @board[1].all?{|e| e==player.symbol} ||
			 @board[2].all?{|e| e==player.symbol} ||
			 @board.all?{|e| e[0]==player.symbol} ||
			 @board.all?{|e| e[1]==player.symbol} ||
			 @board.all?{|e| e[2]==player.symbol} ||
			 (@board[0][0] == @board[1][1] && 
			 	@board[0][0] == @board[2][2] &&
			 	@board[0][0] == player.symbol)      ||
			 (@board[0][2] == @board[1][1] && 
			 	@board[0][2] == @board[2][0] &&
			 	@board[0][2] == player.symbol)
			return true
		end
		false
	end
end

game = Game.new()
game.play()