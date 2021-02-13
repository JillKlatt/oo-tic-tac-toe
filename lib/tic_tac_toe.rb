require "pry"
class TicTacToe
    attr_accessor :index
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]
    def initialize
        @board = Array.new(9, " ")
        @index = index
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(string)
        @index = string.to_i
        @index = index - 1
        # binding.pry
    end
    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end
      
    def valid_move?(index)
        # if @board[index].include? "X" || "O"
        #     return false
        if position_taken?(index)
            return false
        elsif index > 8 || index < 0
            return false
        else 
            return true
        end
    end

    def turn_count
        turn = 0
        @board.each do |index| 
            if index == "X" || index == "O"
                turn +=1
            end
        end
        turn
    end
    def current_player
        if turn_count.even?
            return "X"
        else
            return "O"
        end
    end

    def turn
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end


  
    def won?
        x_index = 0
        o_index = 0
        if WIN_COMBINATIONS.each do |win_combo|
            win_combo.each do |index|
                if @board[index] == "X"
                    x_index += 1
                elsif @board[index] == "O"
                    o_index += 1
                end
            end
                 if x_index == 3 || o_index == 3
                    return win_combo
                 else
                    x_index = 0 && o_index = 0
                 end
            end
        end
        return false
    end
    # binding.pry
    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end


    def draw?
        if full? && !won?
            return true
        # elsif won?
        #     return false
        else
            return false
        end
    end
    def over?
        if draw? || won?
            true
        else
            false
        end
    end

    def winner
        if won? != false
            @board[won?[0]]
        else
            nil
        end
    end

    def play
        until over? == true
            turn
        end
    if won?
        puts "Congratulations #{winner}!"
    else
        puts "Cat's Game!"
    end
end

end


#GOOD TRIES::

    # def display_board
    #     puts @board[0..2].join(" | " )
    #     puts "-----------"
    #     puts @board[3..5].join(" | " )
    #     puts "-----------"
    #     puts @board[6..8].join(" | " )
    # end

    ## MOVE
        # if @board[index] == "X" || "O"
        #     return true

    ## TURN COUNT
            # @board.to_s.count
        # @board[index].to_int = count
        # count.count("X")
        # @index.length

        # @board[index].to_i.size
        # counter = 0
        # @board.to_s.each do |turn|
        #     turn += 1
        #     counter + 1
        # end

        # counter = 0
        # @board.each.to_s 
        # do |index|
        #     if index == "X" || index == "O"
        #         index += 1
        #     else
        #         return index
        #     end
        # end

    ## POSITION TAKEN
        # def position_taken?(index)
    #     # binding.pry
    #     if @board[index].include? "X" || "O"
    #         return true
    #         # binding.pry
    #     elsif @board[index].empty?
    #         return false
    #     end
    # end

    ## TURN
            # @board[index]
        # if valid_move?
        #     puts input
        #     @board
        # else
        #     @board.new
        # end

    ## WON
                #If winning combo contains all x's or o's
            #Add index num to array

                    # if display_board.include?WIN_COMBINATIONS
        # binding.pry

                #Looking for (0,4,8)
            # return WIN_COMBINATIONS.each do |win|
            #     if win == display_board
            #         return win!
            #     end
            # end

        #     index_0 = win_combo[0]
        #     index_1 = win_combo[1]
        #     index_2 = win_combo[2]

        #     spot_0 = @board[index_0]
        #     spot_1 = @board[index_1]
        #     spot_2 = @board[index_2]

        #     if spot_0 == "X" && spot_1 == "X" && spot_2 == "X"
        #         win_combo
        #     elsif spot_0 == "O" && spot_1 == "O" && spot_2 == "O"
        #         win_combo
        #     end 
        #     return false
        # end

            # def winner
    #     chix_dinner = []
    #     chix_dinner = won?
    #     if chix_dinner == false?
    #         nil
    #     else
    #         if @board[chix_dinner[0]] == "X"
    #             return "X"
    #         else
    #             return "O"
    #         end
    #     end
    # end
            # if WIN_COMBINATIONS.include?(display_board)
        #     return "win!"

        #     x_index = []
        #     o_index = []

        # else
        #     false
        # end

          # def won?
    #     WIN_COMBINATIONS.each do |win_combo|
    #         x_index = []
    #         o_index = []
    #         x_index << [[0,4,8], [0,3,6]]
    #         o_index << [0,4,8]
    #         if x_index.include?(win_combo)
    #             return false
    #         elsif o_index.include?(win_combo)
    #             return win_combo
    #         end
    #     end
    #     if draw?
    #     end
    #     return false
    # end


    ## DRAW
    # def full?
        #     @board.include? {|index| index == "X" || index == "O"}
        # end
        
            # def full?
            #     if @board.all? {|index| index != " "}
            #         return false
            #     else
            #         return true
            #     end
            # end