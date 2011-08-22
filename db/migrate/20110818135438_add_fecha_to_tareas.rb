class AddFechaToTareas < ActiveRecord::Migration
  def self.up
    add_column :tareas, :fecha, :date
  end

  def self.down
    remove_column :tareas, :fecha
  end
end
