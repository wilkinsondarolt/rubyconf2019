# frozen_string_literal: true

class Enemy
  SPEED = 4

  def initialize(window)
    @window = window
    load_sprite
    initial_position
  end

  def update
    move
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  private

  def load_sprite
    @image = Gosu::Image.new("assets/images/enemy#{rand(1..3)}.png")
  end

  def initial_position
    @x = random_horizontal_position
    @y = 0
  end

  def random_horizontal_position
    offset = (@image.width / 2).truncate

    rand(offset..(@window.width - offset))
  end

  def move
    @y += SPEED
  end
end
