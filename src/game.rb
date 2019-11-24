# frozen_string_literal: true

class Game < Gosu::Window
  HEIGHT = 400
  WIDTH = 400
  ENEMY_SPAWN_RATIO = 3

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'
    @player = Player.new(self)
    @enemies = []
    @bullets = []
    @explosions = []
  end

  def draw
    @player.draw
    @enemies.each(&:draw)
    @bullets.each(&:draw)
    @explosions.each(&:draw)
  end

  def update
    spawn_enemy if spawn_new_enemy?
    check_colission

    @player.update
    @enemies.each(&:update)
    @bullets.each(&:update)

    clear_unused_enemies
    clear_unused_bullets
    clear_unused_explosions
  end

  def button_down(id)
    player_shoot if id == Gosu::KbSpace
  end

  private

  def spawn_enemy
    @enemies << Enemy.new(self)
  end

  def player_shoot
    @bullets << @player.shoot
  end

  def spawn_new_enemy?
    rand(1..100) < ENEMY_SPAWN_RATIO
  end

  def check_colission
    @enemies.each do |enemy|
      @bullets.each do |bullet|
        if colliding?(enemy, bullet)
          explode_enemy(enemy)

          @bullets.delete(bullet)
          @enemies.delete(enemy)
        end
      end
    end
  end

  def explode_enemy(enemy)
    @explosions << enemy.explode
  end

  def colliding?(enemy, bullet)
    distance = Gosu.distance(
      enemy.x,
      enemy.y,
      bullet.x,
      bullet.y
    )

    distance < (enemy.radius + bullet.radius)
  end

  def clear_unused_enemies
    @enemies.reject!(&:out_of_bounds?)
  end

  def clear_unused_bullets
    @bullets.reject!(&:out_of_bounds?)
  end

  def clear_unused_explosions
    @explosions.reject!(&:finished?)
  end
end
