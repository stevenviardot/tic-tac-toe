# ______________________________________________________________________________
# class BoardCase, definir létat par defaut d'une case dans le jeux
# ______________________________________________________________________________
class BoardCase

attr_accessor :value

  def initialize(value = " ") #valeur par defaut = case vide
    @value = value
  end

  def to_s
    return @value.to_s #renvoyer la valeur au format string
  end

end

# ______________________________________________________________________________
# définir le plateau de jeux et les actions sur le plateau de jeux
# ______________________________________________________________________________

class Board

  def initialize
    # initializer elle doit créer 9 instances BoardCases
    @a1 = BoardCase.new
    @a2 = BoardCase.new
    @a3 = BoardCase.new
    @b1 = BoardCase.new
    @b2 = BoardCase.new
    @b3 = BoardCase.new
    @c1 = BoardCase.new
    @c2 = BoardCase.new
    @c3 = BoardCase.new
  end


  def win_combos # définir les combinaisons gagnantes
    [[@a1.value, @a2.value, @a3.value],
    [@a1.value, @b2.value, @c3.value],
    [@a1.value, @b1.value, @c1.value],
    [@b1.value, @b2.value, @b3.value],
    [@c1.value, @c2.value, @c3.value],
    [@c1.value, @b2.value, @a3.value],
    [@a2.value, @b2.value, @c2.value],
    [@a3.value, @b3.value, @c3.value]]
  end

  def victory? # méthode vérifiant si une des combinaisons gagnantes a été obtenue
    win_combos.each do |combos|
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      show_board
      puts "Le joueur 2 a gagné!!"
      exit
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      show_board
      puts "Le joueur 1 a gagné!!"
      exit
    end
  end
end

  def show_board #afficher le plateau
    puts
    puts "   1   2   3"
    puts "A  #{@a1} | #{@a2} | #{@a3} "
    puts "  ---|---|---"
    puts "B  #{@b1} | #{@b2} | #{@b3} "
    puts "  ---|---|---"
    puts "C  #{@c1} | #{@c2} | #{@c3} "
    puts
  end


  def player_one
    # méthode qui change la BoardCase jouée en fonction de la valeur du joueur 1 (X)
    show_board
    puts "Joueur 1 choisi une case"
    input = gets.chomp.downcase
    case input
      when "a1"
        @a1.value = "X"
      when "a2"
        @a2.value = "X"
      when "a3"
        @a3.value = "X"
      when "b1"
        @b1.value = "X"
      when "b2"
        @b2.value = "X"
      when "b3"
        @b3.value = "X"
      when "c1"
        @c1.value = "X"
      when "c2"
        @c2.value = "X"
      when "c3"
        @c3.value = "X"
      else puts "Ce que tu viens d'écrire n'est pas valide"
        player_one
      end
    victory? # on vérifie si une combinaison gagnante a été obtenue
    player_two # on passe au joueur 2
  end

  def player_two
    # méthode qui change la BoardCase jouée en fonction de la valeur du joueur 2 (O)
    show_board
    puts "Joueur 2 choisi une case:"
    input = gets.chomp.downcase
    case input
      when "a1"
        @a1.value = "O"
      when "a2"
        @a2.value = "O"
      when "a3"
        @a3.value = "O"
      when "b1"
        @b1.value = "O"
      when "b2"
        @b2.value = "O"
      when "b3"
        @b3.value = "O"
      when "c1"
        @c1.value = "O"
      when "c2"
        @c2.value = "O"
      when "c3"
        @c3.value = "O"
      else puts "Ce que tu viens d'écrire n'est pas valide"
        player_two
      end
    victory? # on vérifie si une combinaison gagnante a été obtenue
    player_one # on repasse au joueur 1
  end

end


class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    return @name.to_s
  end
end


class Game
  def initialize    
    puts "----------------------------"
    puts "Bienvenue sur tic tac toe"
    puts "----------------------------"
    puts " "
    puts "Joueur 1 écris ton nom"
    @name1 = gets.chomp
    puts "Joueur 2 écris ton nom"
    @name2 = gets.chomp
    puts @name1 + " joue avec les X, " + @name2 + " joue avec les 0"
    puts "Pour placer ton X ou ton 0, choisi ta position"
    @player1 = Player.new(@name1)
    @player2 = Player.new(@name2)
    @board_game = Board.new
  end

  def go
    @board_game.player_one
  end

end

Game.new.go
