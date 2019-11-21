# frozen_string_literal: true

require 'gosu'
require_relative 'player'

class Game < Gosu::Window
  HEIGHT = 400
  WIDTH = 400

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'
    @player = Player.new(self)
  end

  def draw
    @player.draw
  end

  def update
    @player.move_left if button_down?(Gosu::KbLeft)
    @player.move_right if button_down?(Gosu::KbRight)
  end
end

game = Game.new
game.show
