# frozen_string_literal: true

class Scene < Gosu::Window
  HEIGHT = 400
  WIDTH = 400

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'

    transition_to(:game)
  end

  def update
    @scene.update if @scene.respond_to?(:update)
  end

  def draw
    @scene.draw if @scene.respond_to?(:draw)
  end

  def button_down(id)
    @scene.button_down(id) if @scene.respond_to?(:button_down)
  end

  def transition_to(scene)
    @scene = case scene
    when :game
      Game.new(self)
    when :end
      End.new(self, @scene.score)
    end
  end
end
