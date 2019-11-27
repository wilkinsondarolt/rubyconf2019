# frozen_string_literal: true

class Enemy
  attr_reader :x, :y, :radius

  def initialize(window)
    @window = window
    load_sprite
    initial_position
  end

  def update
    @y += 4
  end

  def draw
    @image.draw(@x - (@image.width / 2), @y - (@image.height / 2), 1)
  end

  def explode
    Explosion.new(@window, @x, @y)
  end

  def out_of_bounds?
    y > @window.height + @radius
  end

  private

  def load_sprite
    @image = Gosu::Image.new("assets/images/enemy#{rand(1..7)}.png")
    @radius = (@image.width / 2)
  end

  def initial_position
    @x = random_horizontal_position
    @y = 0
  end

  def random_horizontal_position
    rand(@radius..(@window.width - @radius))
  end
end
