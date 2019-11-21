# frozen_string_literal: true

require 'gosu'
require_relative 'enemy'
require_relative 'player'

class Game < Gosu::Window
  HEIGHT = 400
  WIDTH = 400

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'
    @player = Player.new(self)
    @enemy = Enemy.new(self)
  end

  def draw
    @player.draw
    @enemy.draw
  end

  def update
    @player.update
    @enemy.update
  end
end

game = Game.new
game.show
