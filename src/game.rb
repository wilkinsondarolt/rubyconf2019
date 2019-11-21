# frozen_string_literal: true

require 'gosu'
require_relative 'enemy'
require_relative 'player'

class Game < Gosu::Window
  HEIGHT = 400
  WIDTH = 400
  ENEMY_SPAWN_RATIO = 3

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'
    @player = Player.new(self)
    @enemies = []
  end

  def draw
    @player.draw
    @enemies.each(&:draw)
  end

  def update
    spawn_enemy if spawn_new_enemy?

    @player.update
    @enemies.each(&:update)
  end

  private

  def spawn_enemy
    @enemies << Enemy.new(self)
  end

  def spawn_new_enemy?
    rand(1..100) < ENEMY_SPAWN_RATIO
  end
end

game = Game.new
game.show
