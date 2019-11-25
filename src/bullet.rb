# frozen_string_literal: true

class Bullet
  attr_reader :x, :y, :radius

  DIRECTIONS = {
    up: -3,
    down: 3
  }.freeze

  def initialize(window, x, y, direction)
    @x = x
    @y = y
    @speed = DIRECTIONS[direction]
    @window = window

    load_sprite

    Sfx.shoot
  end

  def update
    @y += @speed
  end

  def draw
    @image.draw(@x - radius, @y - radius, 1)
  end

  def out_of_bounds?
    y.negative?
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/bullet.png')
    @radius = (@image.width / 2)
  end
end
